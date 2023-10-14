using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ShopManager
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login_tbl WHERE " +
                    "username = '" + tbAdminId.Text.Trim() + "' AND password = '" + tbAdminPass.Text.Trim() + "'",
                    con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Welcome Admin " + dr.GetValue(0).ToString() + "');</script>");
                        Response.Write("<script>alert('Login Successful !');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["role"] = "Admin";

                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Wrong UserID or Password, Please try again !');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}