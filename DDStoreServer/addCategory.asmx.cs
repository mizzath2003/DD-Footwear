using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace DDStoreServer
{
    /// <summary>
    /// Summary description for addCategory
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class addCategory : System.Web.Services.WebService
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
        public string insertCategory(string CategoryId, string CategoryName)
        {
            int NoRecords = 0;
            try
            {

                getConnection();
                SqlCommand cmd = new SqlCommand("insert into tb_category values ('" + CategoryId + "','" + CategoryName + "');", sqlCon);
                NoRecords = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return NoRecords.ToString();
        }
    }
}
