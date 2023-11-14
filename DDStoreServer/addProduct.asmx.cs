using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace DDStoreServer
{
    /// <summary>
    /// Summary description for addProduct
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class addProduct : System.Web.Services.WebService
    {
        SqlConnection sqlCon = null;
        public SqlConnection getConnection()
        {
            try
            {
                sqlCon = new SqlConnection("data source=DESKTOP-KI4OH0F\\SQLEXPRESS;Initial Catalog=DDStoreDB;Integrated Security=True; "); sqlCon.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error connecting to DB" + ex);
            }
            return sqlCon;
        }

        [WebMethod]
        public string InsertProduct(string productId, string productName, string category, int price, int quantity, string description, byte[] imagePath)
        {
          
            int NoRecords = 0;

            try
            {
                getConnection();

                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_product2 (productId, productName, Description, Price, Quantity, Category, image) VALUES (@productId, @productName, @Description, @Price, @Quantity, @Category, @image);", sqlCon))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@productName", productName);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.Add("@image", SqlDbType.VarBinary, -1).Value = imagePath;

                    NoRecords = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
          

            return NoRecords.ToString();
        }

        [WebMethod]
        public DataSet getCategoryName()
        {
            DataSet ds = new DataSet();

            try
            {
                getConnection();
                SqlCommand cmdCategory = new SqlCommand("Select categoryName from tb_category", sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmdCategory);

                da.Fill(ds, "tb_category");
            }
            catch (Exception ex)
            {
                Console.WriteLine("error searching category name" + ex);
            }
            return ds;
        }

    }
}

