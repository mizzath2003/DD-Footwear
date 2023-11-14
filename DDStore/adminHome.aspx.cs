using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class adminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

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
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session variables
            Session.Remove("Admin");
            Session.Remove("UserName");

            // Redirect to the logout or login page
            Response.Redirect("home.aspx");
        }
    }
}