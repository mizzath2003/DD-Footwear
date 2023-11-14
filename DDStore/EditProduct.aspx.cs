using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class EditProduct : System.Web.UI.Page
    {
        addProductServiceReference1.addProductSoapClient ob3 = new addProductServiceReference1.addProductSoapClient();

        SqlConnection sqlCon = null;
        private string connectionString = "data source=DESKTOP-KI4OH0F\\SQLEXPRESS;Initial Catalog=DDStoreDB;Integrated Security=True; ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the editProductId is stored in the Session
                if (Session["EditProductId"] != null)
                {
                    string editProductId = Session["EditProductId"].ToString();

                    // Query the database to retrieve the product details based on editProductId
                    DataTable productDetails = GetProductDetails(editProductId);

                    if (productDetails != null && productDetails.Rows.Count > 0)
                    {
                        DataSet ds = ob3.getCategoryName();
                        ddlCategory.DataSource = ds;
                        ddlCategory.DataTextField = "CategoryName";
                        ddlCategory.DataValueField = "CategoryName";
                        ddlCategory.DataBind();

                        DataRow product = productDetails.Rows[0];
                        txtProductId.Text = product["productId"].ToString();
                        txtProductName.Text = product["productName"].ToString();
                        txtProductPrice.Text = product["Price"].ToString();
                        txtProductQuantity.Text = product["Quantity"].ToString();
                        txtProductDescription.Text = product["Description"].ToString();

                        // Set the selected category in the DropDownList
                        string category = product["Category"].ToString();
                        ddlCategory.Items.FindByValue(category).Selected = true;
                    }
                    else
                    {
                        // Handle the case where the product with the provided editProductId does not exist
                        Error.Text = "Product not found.";
                        Error.Visible = true;
                    }
                }
                else
                {
                    // Handle the case where editProductId is not stored in the Session
                    Error.Text = "EditProductId not provided.";
                    Error.Visible = true;
                }
            }
        }

        // Method to fetch product details from the database
        private DataTable GetProductDetails(string productId)
        {
            DataTable productDetails = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT productId, productName, Price, Quantity, Category, Description FROM tb_product2 WHERE productId = @productId";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(productDetails);
                }
            }

            return productDetails;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if the editProductId is stored in the Session
            if (Session["EditProductId"] != null)
            {
                string editProductId = Session["EditProductId"].ToString();

                // Check if a file has been uploaded for the new image
                if (ProductImage.HasFile)
                {
                    // Get the uploaded image data
                    byte[] newImageData;
                    using (Stream stream = ProductImage.PostedFile.InputStream)
                    {
                        using (BinaryReader binaryReader = new BinaryReader(stream))
                        {
                            newImageData = binaryReader.ReadBytes(ProductImage.PostedFile.ContentLength);
                        }
                    }

                    // Update the product image in the database
                    bool updateImageResult = UpdateProductImage(editProductId, newImageData);

                    if (!updateImageResult)
                    {
                        // Product image update failed
                        Error.Text = "Failed to update the product image.";
                        Error.Visible = true;
                        return; // Exit early if the image update failed
                    }
                }

                // Update other product details in the database
                bool updateResult = UpdateProduct(editProductId);

                if (updateResult)
                {
                    success.Text = "Product updated successfully";
                    // Delay for approximately 1 second (1000 milliseconds) before redirecting
                    string script = "setTimeout(function(){ window.location = 'products.aspx'; }, 1000);";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
                }
                else
                {
                    // Product update failed
                    Error.Text = "Failed to update the product.";
                    Error.Visible = true;
                }
            }
        }

        private bool UpdateProductImage(string productId, byte[] newImageData)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE tb_product2 SET image = @image WHERE productId = @productId";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@productId", productId);
                        cmd.Parameters.AddWithValue("@image", newImageData);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log the error)
                return false; // Return false if the image update failed
            }
        }

        private bool UpdateProduct(string productId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE tb_product2 SET productName = @productName, Price = @price, Quantity = @quantity, Category = @category, Description = @description WHERE productId = @productId";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@productId", productId);
                        cmd.Parameters.AddWithValue("@productName", txtProductName.Text);
                        cmd.Parameters.AddWithValue("@price", Convert.ToInt32(txtProductPrice.Text));
                        cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(txtProductQuantity.Text));
                        cmd.Parameters.AddWithValue("@category", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@description", txtProductDescription.Text);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log the error)
                return false; // Return false if the update failed
            }
        }
    }
}