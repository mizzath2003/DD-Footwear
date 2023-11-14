using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DDStore
{
    public partial class Shop : System.Web.UI.Page
    {
        private string connectionString = "data source=DESKTOP-KI4OH0F\\SQLEXPRESS;Initial Catalog=DDStoreDB;Integrated Security=True; ";

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Admin"] != null)
            //{
            //    // The user is logged in as an admin; you can use this information
            //    string adminUsername = Session["Admin"].ToString();
            //    // Implement admin-specific logic
            //}
            //else if (Session["UserName"] !=null)
            //{
            //    string Username = Session["UserName"].ToString();
            //}
            //else
            //{

            //    Session.Remove("Admin");
            //    Session.Remove("UserName");

            //    Response.Redirect("loginForm.aspx");
            //}

            if (!IsPostBack)
            {
                BindProducts();
                GetCategoryDataWithTotalCount();
            }
        }

        private void BindProducts()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT productId, productName, Price, Quantity, Description, image FROM tb_product2";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        rptProducts.DataSource = dt;
                        rptProducts.DataBind();
                    }
                }
            }
        }

        private void GetCategoryDataWithTotalCount()
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT categoryId, categoryName FROM tb_category";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        categoryRepeater.DataSource = dt;
                        categoryRepeater.DataBind();
                    }
                }



            }


        }

        protected void BuyProduct_Click(object sender, EventArgs e)
        {
            // Check if the user is authenticated (logged in)
            if (Session["UserName"] != null)
            {
                // Retrieve the productId from the CommandArgument
                if (sender is Button btn)
                {
                    string productId = btn.CommandArgument;
                    string userName = Session["UserName"].ToString();

                    // Create a SQL connection and command
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("UPDATE tb_product2 SET Quantity = Quantity - 1 WHERE productId = @productId", sqlCon))
                        {
                            cmd.Parameters.AddWithValue("@productId", productId);
                            sqlCon.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                
                                RecordPurchase(userName, productId);
                                
                                Response.Redirect("Confirmation.aspx");
                            }
                            else
                            {
                                string script = "alert('Product is out of stock.');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                            }
                        }
                    }
                }
            }
            else
            {
                string loginScript = "if (confirm('You need to log in to purchase. Do you want to log in now?')) { window.location = 'loginForm.aspx'; }";
                ScriptManager.RegisterStartupScript(this, GetType(), "LoginScript", loginScript, true);
            }
        }

        private void RecordPurchase(string userName, string productId)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO PurchaseHistory (UserName, ProductId, OrderDate) VALUES (@UserName, @ProductId, GETDATE())", sqlCon))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    sqlCon.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


    }


}
