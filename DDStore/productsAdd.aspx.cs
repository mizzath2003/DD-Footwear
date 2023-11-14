using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Xml;

namespace DDStore
{
    public partial class productsAdd : System.Web.UI.Page
    {
        addProductServiceReference1.addProductSoapClient ob3=new addProductServiceReference1.addProductSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                // The user is logged in as an admin; you can use this information
                string adminUsername = Session["Admin"].ToString();
                // Implement admin-specific logic
            }
            else
            {
                Session.Remove("Admin");
                // Redirect to the login page or show an error message
                Response.Redirect("loginForm.aspx");
            }

            DataSet ds = ob3.getCategoryName();
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.DataValueField = "CategoryName";
            ddlCategory.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtProductId.Text) || string.IsNullOrEmpty(txtProductName.Text) || string.IsNullOrEmpty(txtProductPrice.Text) ||
                string.IsNullOrEmpty(txtProductQuantity.Text) || string.IsNullOrEmpty(txtProductDescription.Text))
            {
                Error.Text = "Fill in all fields to register";
                Error.Visible = true;

            }
            else
            {
                // Check if a file has been uploaded
                if (ProductImage.HasFile)
                {
                    try
                    {
                        // Get the values from the form
                        string productId = txtProductId.Text;
                        string productName = txtProductName.Text;
                        string category = ddlCategory.Text;
                        int price = Convert.ToInt32(txtProductPrice.Text);
                        int quantity = Convert.ToInt32(txtProductQuantity.Text);
                        string description = txtProductDescription.Text;


                        byte[] imageData;
                        using (Stream stream = ProductImage.PostedFile.InputStream)
                        {
                            using (BinaryReader binaryReader = new BinaryReader(stream))
                            {
                                imageData = binaryReader.ReadBytes(ProductImage.PostedFile.ContentLength);
                            }
                        }

                        string result = ob3.InsertProduct(productId, productName, category, price, quantity, description, imageData);


                        // Call the web service to insert the product data
                        //ProductWebService productService = new ProductWebService();
                        //string result = productService.InsertProduct(productName, category, price, quantity, description, imageData);



                        int record = Int32.Parse(result);

                        if (record >= 1)
                        {
                            Error.Visible = true;
                            success.Text = "Product Insert Successfully";
                            // Delay for approximately 1 second (1000 milliseconds) before redirecting
                            string script = "setTimeout(function(){ window.location = 'products.aspx'; }, 1000);";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
                        }
                        else
                        {
                            Error.Text = "Could Not Enter Product";
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions here (e.g., display an error message).
                        Response.Write("An error occurred: " + ex.Message);
                    }
                }
                else
                {
                    // Handle the case where no file was uploaded.
                    Error.Text="Please select an image.";
                    Error.Visible = true;
                }
            }
        }
    }
    
}