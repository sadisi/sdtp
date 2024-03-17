using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{
    public partial class WardenPage : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the Google Maps API key from the appSettings section in web.config
            string googleMapsApiKey = WebConfigurationManager.AppSettings["GoogleMapsApiKey"];

            // Register the API key as a startup script variable
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GoogleMapsApiKey", $"var googleMapsApiKey = '{googleMapsApiKey}';", true);

            // Establish connection to the database using the provided connection string
            string connectionString = "Data Source=DESKTOP-PAO1EML;Initial Catalog=nsbmSdtpDB;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define your SQL query to retrieve data from the database
                string query = "SELECT * FROM LandlordPPtbl WHERE pp_status = 'Active' ";

                // Open the database connection
                connection.Open();

                // Execute the query and retrieve the data
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Execute the query and retrieve the data
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        List<object> locations = new List<object>();
                        while (reader.Read())
                        {

                            var filename = Path.GetFileName(reader["pp_img_url"].ToString());
                            var location = new
                            {
                                lat = reader.IsDBNull(reader.GetOrdinal("pp_latitude")) ?
                                          (decimal?)null : Convert.ToDecimal(reader["pp_latitude"]),
                                lng = reader.IsDBNull(reader.GetOrdinal("pp_longitude")) ?
                                         (decimal?)null : Convert.ToDecimal(reader["pp_longitude"]),
                                title = reader["pp_location"].ToString(),
                                imageUrl = $"hstImg/{filename}",
                                description = reader["pp_description"].ToString(),
                                price = reader["pp_price"].ToString(),
                                category = reader["pp_category"].ToString()
                            };

                            locations.Add(location);
                        }

                        // Serialize the list to JSON
                        string locationsJson = new JavaScriptSerializer().Serialize(locations);

                        // Register the locations as a startup script variable
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "MapLocations", $"var mapLocations = {locationsJson};", true);
                    }
                }
            }
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

                SqlCommand cmd = new SqlCommand("SELECT * FROM LandlordPPtbl WHERE pp_id = '" + txtHostelIDBox.Text.Trim() + "'", con);

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
