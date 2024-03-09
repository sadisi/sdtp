using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace sdtp
{
    public partial class AdminPage : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //landlord account create
        protected void LandlordAccCreate_click(object sender, EventArgs e)
        {
            if (checkLLExist())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
                siginUpNewlandlord();

            }
        }


        void siginUpNewlandlord()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (PasswordTextBox.Text == ConfirmPasswordTextBox.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Landlordtbl (ll_email, ll_username ,ll_password, ll_mobilenum) VALUES (@EmailTextBox, @UsernameTextBox, @PasswordTextBox, @MobileNumberTextBox)", con);
                    cmd.Parameters.AddWithValue("@EmailTextBox", EmailTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@UsernameTextBox", UsernameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@PasswordTextBox", PasswordTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@MobileNumberTextBox", MobileNumberTextBox.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Your new landload account has been successfully created.')</script>");
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
        bool checkLLExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Student WHERE ll_username = '" + UsernameTextBox.Text.Trim() + "'", con);


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


        //Warden account create
        protected void WardenAccCreate_click(object sender, EventArgs e)
        {
            if (checkWDExist())
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
                if (WardenPSTxtbox.Text == WardenPSConfirmTxtbox.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Warden (w_email, w_username ,w_password, w_mobilenum) VALUES (@WardenEmailTxtbox, @WardenUNTxtbox, @WardenPSTxtbox, @WardenMNTxtbox)", con);
                    cmd.Parameters.AddWithValue("@WardenEmailTxtbox", WardenEmailTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@WardenUNTxtbox", WardenUNTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@WardenPSTxtbox", WardenPSTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@WardenMNTxtbox", WardenMNTxtbox.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Your new Warden account has been successfully created.')</script>");
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


        //Warden usnm already exist
        bool checkWDExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Warden WHERE w_username = '" + WardenUNTxtbox.Text.Trim() + "'", con);


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


        //Student account create
        protected void StudentAccCreate_click(object sender, EventArgs e)
        {
            if (checkLStd())
            {
                Response.Write("<script>alert('User already exist with this username, Change your Username ')</script>");
            }
            else
            {
                siginUpNewStd();

            }
        }


        void siginUpNewStd()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (StudentPSTxtbox.Text == StudentConfirmPSTxtbox.Text)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Student (s_email, s_username ,s_mobilenum, s_password) VALUES (@StudentEmailTxtbox, @StudentUNTxtbox, @StudentPSTxtbox, @StudentMNTxtbox)", con);
                    cmd.Parameters.AddWithValue("@StudentEmailTxtbox", StudentEmailTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@StudentUNTxtbox", StudentUNTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@StudentPSTxtbox", StudentPSTxtbox.Text.Trim());
                    cmd.Parameters.AddWithValue("@StudentMNTxtbox", StudentMNTxtbox.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Your new Student account has been successfully created.')</script>");
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
        bool checkLStd()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Student WHERE s_username = '" + StudentUNTxtbox.Text.Trim() + "'", con);


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