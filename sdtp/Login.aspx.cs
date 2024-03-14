using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{

    public partial class Login : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HomePageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registerpage.aspx");
        }


        //admin login
        protected void AdminLogin_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Login .')</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE admin_username  = '" + adminUsername.Text.Trim() + "' AND admin_password = '" + adminPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                
                if (dr.HasRows)// there a no uer like that 
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('"+dr.GetValue(2).ToString()+"')</script>");
                        Session["username"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }
                   Response.Redirect("AdminPage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentilas')</script>");
                }
                
            }
            catch(Exception ex) 
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }


         

        }


        //landlord login
        protected void LandlordLogin_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Login .')</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Landlordtbl WHERE ll_username  = '" + landlordUsername.Text.Trim() + "' AND ll_password = '" + landlordPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)// there a no uer like that 
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(2).ToString() + "')</script>");
                        Session["username"] = dr.GetValue(2).ToString();
                       Session["role"] = "landlord";
                    }
                    Response.Redirect("landlord.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentilas')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        //watrden login
        protected void WardenLogin_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Login .')</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Warden WHERE w_username  = '" + wardenUsername.Text.Trim() + "' AND w_password = '" + wardenPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)// there a no uer like that 
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(2).ToString() + "')</script>");
                        Session["username"] = dr.GetValue(2).ToString();
                        Session["role"] = "warden";
                    }
                    Response.Redirect("WardenPage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentilas')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        //student login
        protected void StudentLogin_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Login .')</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Student WHERE s_username  = '" + studentUsername.Text.Trim() + "' AND s_password = '" + studentPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)// there a no uer like that 
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(2).ToString() + "')</script>");
                        Session["username"] = dr.GetValue(2).ToString();
                        Session["role"] = "student";
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentilas')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}