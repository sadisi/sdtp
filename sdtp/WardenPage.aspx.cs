using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{
    public partial class WardenPage : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //approve button
        protected void ApproveBtn_Click(object sender, EventArgs e)
        {
            
            if (checkHostelIDExist())
            {
                ApproveHostelDetails();
               
            }
            else
            {
                Response.Write("<script>alert('Your Hostel ID Not in Our Database exsist. Check your ID')</script>");
            }
            
        }


        //remove button
        protected void RemoveBtn_Click(object sender, EventArgs e)
        {
            if (checkHostelIDExist())
            {
                DeleteHostelDetails();
            }
            else
            {
                Response.Write("<script>alert('Your Hostel ID Not in Our Database exsist. Check your ID')</script>");
               
            }
        }


        bool checkHostelIDExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM wardenPPdetails WHERE wpp_id = '" + txtHostelIDBox.Text.Trim() + "'", con);

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


        
        void ApproveHostelDetails()
        {
            try
            {
                // Check if txtHostelIDBox is not empty
                if (string.IsNullOrWhiteSpace(txtHostelIDBox.Text))
                {
                    Response.Write("<script>alert('Please enter a Hostel ID');</script>");
                    return; // Exit the method if Hostel ID is empty
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmdn = new SqlCommand("UPDATE LandlordPPtbl SET pp_status = @WDStatus WHERE pp_id = @HostelID", con);
                cmdn.Parameters.AddWithValue("@WDStatus", "Active");
                cmdn.Parameters.AddWithValue("@HostelID", txtHostelIDBox.Text.Trim());
                cmdn.ExecuteNonQuery();


                con.Close();
                Response.Write("<script>alert('New Hostel Add. Added to Map !')</script>");
                GridView1.DataBind();

                ClearInputs();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void DeleteHostelDetails()
        {
            try
            {
                // Check if txtHostelIDBox is not empty
                if (string.IsNullOrWhiteSpace(txtHostelIDBox.Text))
                {
                    Response.Write("<script>alert('Please enter a Hostel ID');</script>");
                    return; // Exit the method if Hostel ID is empty
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM LandlordPPtbl WHERE pp_id = @WDid ", con);
                cmd.Parameters.AddWithValue("@WDid", txtHostelIDBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Hstel ID " + txtHostelIDBox.Text.Trim() + "Details Deleted !')</script>");
                GridView1.DataBind();

                ClearInputs();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void ClearInputs()
        {
            txtHostelIDBox.Text = "";
        }
    }
}
