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
            if (chckAdminExist())
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
        bool chckAdminExist()
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



        // **** landlord register button ****//

     
        protected void RegisterLandord_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Registered Successfully.')</script>"); 
            if (chcklandLordExist())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
              siginUpNewLandlord();

            }
        }


        void siginUpNewLandlord()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (landlordPassword.Text == confirmLandlordPassword.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Landlordtbl (ll_email, ll_username ,ll_password, ll_mobilenum) VALUES (@landlordEmail, @landlordUsername, @landlordPassword, @landlordMobile)", con);

                   cmd.Parameters.AddWithValue("@landlordEmail", landlordEmail.Text.Trim());
                   cmd.Parameters.AddWithValue("@landlordUsername", landlordUsername.Text.Trim());
                   cmd.Parameters.AddWithValue("@landlordPassword", landlordPassword.Text.Trim());
                   cmd.Parameters.AddWithValue("@landlordMobile", landlordMobile.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Registered Successfully as an LandLord. Go to the Login page to log in to your account!')</script>");
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


        //landlord usnm already exist
        bool chcklandLordExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Landlordtbl WHERE ll_username = '" + landlordUsername.Text.Trim() + "'", con);


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




      

        // **** Warden register button ****//
        protected void RegisterWarden_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Registered Successfully.')</script>"); 
            if (chckWardenExist())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
                siginUpNewWarden();

            }
        }


        void siginUpNewWarden()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (wardenPassword.Text == confirmWardenPassword.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Warden (w_email, w_username ,w_password, w_mobilenum) VALUES (@wardenEmail, @wardenUsername, @wardenPassword, @wardenPhoneNumber)", con);
                    cmd.Parameters.AddWithValue("@wardenEmail", wardenEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@wardenUsername", wardenUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@wardenPassword", wardenPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@wardenPhoneNumber", wardenPhoneNumber.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Registered Successfully as an Warden. Go to the Login page to log in to your account!')</script>");
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


        //Worden usnm already exist
        bool chckWardenExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Warden WHERE w_username = '" + wardenUsername.Text.Trim() + "'", con);


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



        // **** Student register button ****//

        protected void RegisterStudent_click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Registered Successfully.')</script>"); 
            if (chckStudentExist())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
                siginUpNewStudent();

            }
        }


        void siginUpNewStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (landlordPassword.Text == confirmLandlordPassword.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Student (s_email, s_username ,s_password, s_mobilenum) VALUES (@studentEmail, @studentUsername, @studentPassword, @studentPhoneNumber)", con);
                    cmd.Parameters.AddWithValue("@studentEmail", studentEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@studentUsername", studentUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@studentPassword", studentPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@studentPhoneNumber", studentPhoneNumber.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Registered Successfully as an Student. Go to the Login page to log in to your account!')</script>");
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


        //landlord usnm already exist
        bool chckStudentExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Student WHERE s_username = '" + studentUsername.Text.Trim() + "'", con);


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