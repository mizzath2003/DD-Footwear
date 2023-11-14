using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace DDStoreServer
{
    /// <summary>
    /// Summary description for Login
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Login : System.Web.Services.WebService
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
        public string AttemptLogin(string username, string password)
        {
            string result = string.Empty;

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {

                getConnection();

                string query = "SELECT UserName, UserType FROM tb_user2 WHERE UserName = '"+username+"' AND password = '"+password+"'";
                    using (SqlCommand cmd = new SqlCommand(query, sqlCon))
                    {
                        cmd.Parameters.AddWithValue("UserName", username);
                        cmd.Parameters.AddWithValue("Password", password);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    string userType = reader["UserType"].ToString();

                                    if (userType == "Admin")
                                    {
                                        result = "Admin";
                                    }
                                    else
                                    {
                                        result = "User";
                                    }
                                }
                            }
                            else
                            {
                                result = "error";
                            }
                        }
                    }
                
            }
            else
            {
                result = "empty";
            }

            return result;
        }
    }
}
