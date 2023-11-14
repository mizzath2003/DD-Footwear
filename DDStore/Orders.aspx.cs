using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class Orders : System.Web.UI.Page
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
                string query = "SELECT UserName,ProductId,OrderDate FROM PurchaseHistory";
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




    }
}