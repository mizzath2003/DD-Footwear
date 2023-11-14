using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class userAdd : System.Web.UI.Page
    {
        registerServiceReference1.registerUserSoapClient obj = new registerServiceReference1.registerUserSoapClient();

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

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            // Check if any of the required fields are empty
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPhone.Text) || string.IsNullOrEmpty(txtEmail.Text) ||
                string.IsNullOrEmpty(txtFullName.Text) || string.IsNullOrEmpty(txtAddress.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                Error.Text = "Fill in all fields to register";
                Error.Visible = true;

            }
            else
            {


                string value = obj.createUser(txtUserName.Text, txtPhone.Text, txtEmail.Text, txtFullName.Text,txtAddress.Text, txtPassword.Text, ddlUserType.Text);
                int record = Int32.Parse(value);

                if (record >= 1)
                {

                    // Registration is successful
                    Error.Visible = false;
                    success.Text = "Registration Successful";
                    // Delay for approximately 1 second (1000 milliseconds) before redirecting
                    string script = "setTimeout(function(){ window.location = 'users.aspx'; }, 1000);";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
                }
                else
                {
                    Error.Text = "Unsuccessful Registration";
                }
            }
        }
    }
}