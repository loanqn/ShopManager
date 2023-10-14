using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopManager
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session != null)
                {
                    string role = Session["role"] as string;
                    if (String.IsNullOrEmpty(role))
                    {
                        userLink.Visible = true;
                        signUpLink.Visible = true;

                        logOutLink.Visible = false;
                        HelooUserLink.Visible = false;

                        adminLogin.Visible = true;
                        QlySP.Visible = false;
                        QlyUser.Visible = false;

                    }
                    else if (role.Equals("User"))
                    {
                        userLink.Visible = false;
                        signUpLink.Visible = false;

                        logOutLink.Visible = true;
                        HelooUserLink.Visible = true;
                        HelooUserLink.Text = "Hello " + Session["username"].ToString();

                        adminLogin.Visible = true;
                        QlySP.Visible = false;
                        QlyUser.Visible = false;

                    }
                    else if (role.Equals("Admin"))
                    {
                        userLink.Visible = false;
                        signUpLink.Visible = false;

                        logOutLink.Visible = true;
                        HelooUserLink.Visible = true;
                        HelooUserLink.Text = "Hello Admin " + Session["username"].ToString();

                        adminLogin.Visible = false;
                        QlySP.Visible = true;
                        QlyUser.Visible = true;
                      
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void adminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void QlySP_Click(object sender, EventArgs e)
        {
            Response.Redirect("quanlysp.aspx");
        }

        protected void QlyUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("quanlytk.aspx");
        }

        protected void logOutLink_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            userLink.Visible = true;
            signUpLink.Visible = true;

            logOutLink.Visible = false;
            HelooUserLink.Visible = false;

            adminLogin.Visible = true;
            QlyUser.Visible = false;
            QlySP.Visible = false;
            

            Response.Redirect("homepage.aspx");
        }

        protected void userLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void signUpLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}