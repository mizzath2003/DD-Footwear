using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class products : System.Web.UI.Page
    {
        SqlConnection sqlCon = null;
        private string connectionString = "data source=DESKTOP-KI4OH0F\\SQLEXPRESS;Initial Catalog=DDStoreDB;Integrated Security=True; ";

        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {
                sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error connecting to DB" + ex);
            }
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


            if (!IsPostBack)
            {
                BindGridView();
            }

        }

        private void BindGridView()
        {
            // Replace with your database connection logic
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT productId, productName, Price, Quantity, Category, Description, image FROM tb_product2";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridViewProducts.DataSource = dt;
                        GridViewProducts.DataBind();
                    }
                }
            }
        }

        //Delete Product BUTTON
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the product ID from the DataKey
                string productId = GridViewProducts.DataKeys[rowIndex].Value.ToString();

                // Delete the record from the database using the product ID as the criteria
                if (DeleteProduct(productId))
                {
                    BindGridView();
                }
            }

            if (e.CommandName == "EditRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string productId = GridViewProducts.DataKeys[rowIndex].Value.ToString();

                Session["EditProductId"] = productId; // Store the product ID in a session variable
                Response.Redirect("EditProduct.aspx"); // Redirect to the EditProduct.aspx page
            }
        }

        //Edit product BUTTON
      


        private bool DeleteProduct(string productId)
        {
            try
            {
                // Implement your database deletion logic here
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "DELETE FROM tb_product2 WHERE productId = @productId";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@productId", productId);
                        cmd.ExecuteNonQuery();
                    }
                }

                return true; // Return true if the deletion was successful
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log the error)
                return false; // Return false if the deletion failed
            }
        }
    }
}