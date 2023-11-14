using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDStore
{
    public partial class categoryAdd : System.Web.UI.Page
    {
        addCategoryServiceReference1.addCategorySoapClient obj2=new addCategoryServiceReference1.addCategorySoapClient();
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

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCategoryId.Text) || string.IsNullOrEmpty(txtCategoryName.Text))
            {
                Error.Text = "Fill in all fields to add category";
                Error.Visible = true;

            }
            else
            {


                string value = obj2.insertCategory(txtCategoryId.Text, txtCategoryName.Text);
                int record = Int32.Parse(value);

                if (record >= 1)
                {

                    // Registration is successful
                    Error.Visible = false;
                    success.Text = "Category Added Successfully";
                    // Delay for approximately 1 second (1000 milliseconds) before redirecting
                    string script = "setTimeout(function(){ window.location = 'category.aspx'; }, 1000);";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
                }
                else
                {
                    Error.Text = "Could Not Add Category";
                }
            }
        }
    }
}