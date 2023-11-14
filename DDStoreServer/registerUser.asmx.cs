using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.Net;

namespace DDStoreServer
{
    /// <summary>
    /// Summary description for registerUser
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class registerUser : System.Web.Services.WebService
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

        public string addUser(string UserName, string Phone, string Email, string FullName,string Address, string Password)
        {
            int NoRecords = 0;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO tb_user2 (UserName, Phone, Email, FullName,Address, Password,  UserType) VALUES ('" + UserName+"', '"+Phone+"' , '"+Email+"', '"+FullName+"','"+Address+"', '"+Password+"', 'User')", sqlCon);
                NoRecords = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }

            return NoRecords.ToString();
        }

        [WebMethod]
        public string createUser(string UserName, string Phone, string Email, string FullName, string Address, string Password, string UserType)
        {
            int NoRecords = 0;
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO tb_user2 (UserName, Phone, Email, FullName,Address, Password, UserType) VALUES ('" + UserName + "', '" + Phone + "' , '" + Email + "', '" + FullName + "', '"+Address+"','" + Password + "', '" + UserType + "')", sqlCon);
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
