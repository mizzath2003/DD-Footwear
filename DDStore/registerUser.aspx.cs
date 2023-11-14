using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

namespace DDStore
{
    public partial class registerUser : System.Web.UI.Page
    {
        registerServiceReference1.registerUserSoapClient obj=new registerServiceReference1.registerUserSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //// Check if the username is available
            //bool isUsernameAvailable = obj.IsUsernameAvailable(txtUserName.Text);
            
            // Check if any of the required fields are empty
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPhone.Text) || string.IsNullOrEmpty(txtEmail.Text) ||
                string.IsNullOrEmpty(txtFullName.Text) || string.IsNullOrEmpty(txtAddress.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                Error.Text = "Fill in all fields to register";
                Error.Visible = true;
                
            }
            //else if (!isUsernameAvailable)
            //{
            //    Error.Text = "Username already exists";
            //    Error.Visible = true;
            //}
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
               
                Error.Text = "Password's do not match";
                Error.Visible = true;
            }
            else
            {
              

                string value = obj.addUser(txtUserName.Text, txtPhone.Text, txtEmail.Text, txtFullName.Text,txtAddress.Text, txtPassword.Text);
                int record = Int32.Parse(value);

                if (record >= 1)
                {
                    
                    // Registration is successful
                    Error.Visible = false;
                    success.Text = "Registration Successful";
                    // Delay for approximately 1 second (1000 milliseconds) before redirecting
                    string script = "setTimeout(function(){ window.location = 'loginForm.aspx'; }, 1000);";
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