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
    public partial class Registerpage : System.Web.UI.Page
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
            Response.Redirect("Login.aspx");
        }


        //Admin register Button
        protected void RegisterAdmin_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Registered Successfully.')</script>"); 
            if (chckUserExist())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
                siginUpNewUser();
            }


           
        }


        //register button user define method
        void siginUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (adminPassword.Text == confirmAdminPassword.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Admin (admin_email, admin_username, admin_password) VALUES (@adminEmail, @adminUsername, @adminPassword)", con);

                    cmd.Parameters.AddWithValue("@adminEmail", adminEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@adminUsername", adminUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@adminPassword", adminPassword.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Registered Successfully as an Admin. Go to the Login page to log in to your account!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Password does not match. Please re-check your passwords!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //check if user already exist
        bool chckUserExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
           
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE admin_username = '"+ adminUsername.Text.Trim() + "'", con);


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
                return false;
            }

           
        }


    }
}