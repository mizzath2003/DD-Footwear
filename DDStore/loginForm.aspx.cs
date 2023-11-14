using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class loginForm : System.Web.UI.Page
    {
        loginServiceReference1.LoginSoapClient obj=new loginServiceReference1.LoginSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {

            


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string result = obj.AttemptLogin(txtUserName.Text,txtPassword.Text);

            switch (result)
            {
                case "Admin":
                    Session["Admin"] = txtUserName.Text;
                    Response.Redirect("adminHome.aspx");
                    break;
                case "User":
                    Session["UserName"] = txtUserName.Text;
                    Response.Redirect("Shop.aspx");
                    break;
                case "error":
                    Error.Text = "Incorrect username or password";
                    Error.Visible = true;
                    break;
                case "empty":
                    Error.Text = "Fill in all fields to Sign In";
                    Error.Visible = true;
                    break;
            }


        }
    }
}