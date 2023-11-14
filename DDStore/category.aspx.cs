using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class category : System.Web.UI.Page
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

            if (!IsPostBack)
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
            }

            if (!IsPostBack)
            {
                DataTable dt = GetDataFromDatabase(connectionString);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private DataTable GetDataFromDatabase(string connectionString)
        {
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT categoryId,categoryName FROM tb_category";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the username to identify the user to delete
                string usernameToDelete = GridView1.Rows[rowIndex].Cells[1].Text;

                // Delete the record from the database using the username as the criteria
                if (DeleteUser(usernameToDelete))
                {

                    BindGridView();
                }

            }
        }

        private bool DeleteUser(string categoryId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "DELETE FROM tb_category WHERE categoryId = @categoryId";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@categoryId", categoryId);
                        cmd.ExecuteNonQuery();
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {

                return false;
            }
        }

        private void BindGridView()
        {
            DataTable dt = GetDataFromDatabase(connectionString);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}