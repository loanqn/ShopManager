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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoBtn_Click(object sender, EventArgs e)
        {
            getProductByID();
        }

        protected void AddProductBtn_Click(object sender, EventArgs e)
        {
            if (checkIfProductExits())
            {
                Response.Write("<script>alert('Author with this ID is already Exits. You cannot add" +
                    " another Author with the same Author ID.');</script>");
            }
            else
            {
                addNewProduct();
            }
        }

        protected void UpdateProductBtn_Click(object sender, EventArgs e)
        {
            if (checkIfProductExits())
            {
                updateProduct();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist.');</script>");
            }
        }

        protected void DeleteProductBtn_Click(object sender, EventArgs e)
        {
            if (checkIfProductExits())
            {
                deleteProduct();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist.');</script>");
            }
        }

        protected void addNewProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO sanpham_tbl(MaSP, TenSP) " +
                    "VALUES (@MaSP, @TenSp)", con);

                cmd.Parameters.AddWithValue("@MaSP", txtProID.Text.Trim());
                cmd.Parameters.AddWithValue("@TenSp", txtProName.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Product Added Successfully.');</script>");
                clearField();
                AuthorDataTable.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void updateProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE sanpham_tbl SET " +
                    "TenSP = @TenSP WHERE MaSP = '" + txtProID.Text.Trim() + "'", con);


                cmd.Parameters.AddWithValue("@TenSP", txtProName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Updated Successfully.');</script>");
                clearField();
                AuthorDataTable.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void getProductByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from sanpham_tbl WHERE MaSP = '" + txtProID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtProName.Text = dt.Rows[0][1].ToString();
                    AuthorDataTable.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Product ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected bool checkIfProductExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from sanpham_tbl WHERE MaSP = '" + txtProID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return false;
        }

        protected void deleteProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM sanpham_tbl WHERE MaSp = '" + txtProID.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product Delete Successfully.');</script>");
                clearField();
                AuthorDataTable.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void clearField()
        {
            txtProID.Text = " ";
            txtProName.Text = " ";
        }

        
    }
}