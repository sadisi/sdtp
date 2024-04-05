using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{
    public partial class landlord : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

    
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the Google Maps API key from the config
            string googleMapsApiKey = WebConfigurationManager.AppSettings["GoogleMapsApiKey"];

            // Register the API key as a startup script variable
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GoogleMapsApiKey", $"var googleMapsApiKey = '{googleMapsApiKey}';", true);

            // Establish connection to the database
            string connectionString = "Data Source=DESKTOP-PAO1EML;Initial Catalog=nsbmSdtpDB;Integrated Security=True";

            // List to store location data retrieved from the database
            List<object> locations = new List<object>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define your SQL query to retrieve data from the database
                string query = "SELECT * FROM LandlordPPtbl WHERE pp_status = 'Active' AND username = @Username";

                // Open the database connection
                connection.Open();

                // Define the SqlCommand object and add parameters to it
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", Session["username"]);

                    // Execute the query and retrieve the data
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
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
                    }
                }
            }

            // Serialize the list to JSON
            string locationsJson = new JavaScriptSerializer().Serialize(locations);

            // Register the locations as a startup script variable
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MapLocations", $"var mapLocations = {locationsJson};", true);
        }


        protected void HomePageBtn_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("homepage.aspx");
        }

        //add button
        protected void btnAdd_Click(object sender, EventArgs e)
        {
           if(checkHostelExist())
            {
                Response.Write("<script>alert('Your Hostel ID Already exsist. try some other Hostel ID')</script>");
            }
            else
            {
                addNewHostel();
            } 
        }

        bool checkHostelExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM LandlordPPtbl WHERE pp_id = '" + HostelIDTextBox.Text.Trim() + "'", con);
                

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

        void addNewHostel()
        {
            try
            {

                //image upload
                string filepath = "~/hstImg/testImage.jpg";
                string filename = Path.GetFileName(ImageFileUpload.PostedFile.FileName);
                ImageFileUpload.SaveAs(Server.MapPath("hstImg/" + filename));
                filepath = "~/hstImg/" + filename;
 
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO LandlordPPtbl (username, pp_id, pp_category, pp_price, pp_location, pp_longitude, pp_latitude, pp_description, pp_img_url, pp_status) VALUES (@Username, @HostelIDTextBox, @CategoryTextBox, @PriceTxtBox, @LocationTextBox, @LongitudeTextBox, @LatitudeTextBox, @PropertyDescriptionTextBox, @ImageFileUpload, @Status)", con);    
                cmd.Parameters.AddWithValue("@Username", Session["username"]);
                cmd.Parameters.AddWithValue("@HostelIDTextBox", HostelIDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@CategoryTextBox", CategoryTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@PriceTxtBox", PriceTxtBox.Text.Trim());
                cmd.Parameters.AddWithValue("@LocationTextBox", LocationTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@LongitudeTextBox", LongitudeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@LatitudeTextBox", LatitudeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@PropertyDescriptionTextBox", PropertyDescriptionTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@ImageFileUpload", filepath);
                
                cmd.ExecuteNonQuery();
                con.Close();  
                Response.Write("<script>alert('Property added successfully.')</script>");
                GridView1.DataBind();

                inputFdClear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //update button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkHostelExist())
            {
                UpdateHosteldt();
               
            }
            else
            {
                Response.Write("<script>alert('Hostel Doesnt exist ')</script>");

            }
        }

        void UpdateHosteldt()
        {
            try
            {
                string filepath = "~/hstImg/banner-03.jpg";

                // Check if a file is uploaded
                if (ImageFileUpload.HasFile)
                {
                    string filename = Path.GetFileName(ImageFileUpload.PostedFile.FileName);
                    ImageFileUpload.SaveAs(Server.MapPath("hstImg/" + filename));
                    filepath = "~/hstImg/" + filename;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Construct the update query dynamically
                    StringBuilder updateQuery = new StringBuilder("UPDATE LandlordPPtbl SET ");
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    // Check category is entered
                    if (!string.IsNullOrEmpty(CategoryTextBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_category = @CategoryTextBox, ");
                        cmd.Parameters.AddWithValue("@CategoryTextBox", CategoryTextBox.Text.Trim());
                    }
                    // Check Price is entered
                    if (!string.IsNullOrEmpty(PriceTxtBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_price = @PriceTxtBox, ");
                        cmd.Parameters.AddWithValue("@PriceTxtBox", PriceTxtBox.Text.Trim());
                    }


                    // Check if location is entered
                    if (!string.IsNullOrEmpty(LocationTextBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_location = @LocationTextBox, ");
                        cmd.Parameters.AddWithValue("@LocationTextBox", LocationTextBox.Text.Trim());
                    }


                    // Check if Longitude is entered
                    if (!string.IsNullOrEmpty(LongitudeTextBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_longitude = @LongitudeTextBox, ");
                        cmd.Parameters.AddWithValue("@LongitudeTextBox", LongitudeTextBox.Text.Trim());
                    }


                    // Check if latitude is entered
                    if (!string.IsNullOrEmpty(LatitudeTextBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_latitude = @LatitudeTextBox, ");
                        cmd.Parameters.AddWithValue("@LatitudeTextBox", LatitudeTextBox.Text.Trim());
                    }
                    // Check if PropertyDescription is entered
                    if (!string.IsNullOrEmpty(PropertyDescriptionTextBox.Text.Trim()))
                    {
                        updateQuery.Append("pp_description = @PropertyDescriptionTextBox, ");
                        cmd.Parameters.AddWithValue("@PropertyDescriptionTextBox", PropertyDescriptionTextBox.Text.Trim());
                    }
                    // Check if Image is entered
                    if (!string.IsNullOrEmpty(filepath))
                    {
                        updateQuery.Append("pp_img_url = @ImageFileUpload, ");
                        cmd.Parameters.AddWithValue("@ImageFileUpload", filepath);
                    }

                    // Remove the trailing comma and space
                    updateQuery.Length -= 2;

                    // Add the WHERE clause
                    updateQuery.Append(" WHERE pp_id = @HostelIDTextBox AND username = @Username");
                    cmd.Parameters.AddWithValue("@HostelIDTextBox", HostelIDTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", Session["username"]);

                    cmd.CommandText = updateQuery.ToString();
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Update successfully.')</script>");
                    GridView1.DataBind();

                    inputFdClear();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        //delete button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkHostelExist())
            {
                DeleteHosteldt();
            }
            else
            {
                
                Response.Write("<script>alert('Your Hostel ID Already exsist. try some other Hostel ID')</script>");

                
            }
        }


        void DeleteHosteldt()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM LandlordPPtbl WHERE pp_id = @HostelID AND username = @Username", con);
                cmd.Parameters.AddWithValue("@HostelID", HostelIDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", Session["username"]);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Hostel Detail Deleted successfully.')</script>");
                GridView1.DataBind();

                inputFdClear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void inputFdClear()
        {
            HostelIDTextBox.Text = "";
            CategoryTextBox.Text = "";
            PriceTxtBox.Text = "";
            LocationTextBox.Text = "";
            LongitudeTextBox.Text = "";
            LatitudeTextBox.Text = "";
            PropertyDescriptionTextBox.Text = "";
        }


        //landolord student feedback section


        //approve button
        protected void StFeedApproveBtn_Click(object sender, EventArgs e)
        {

            if (checkStMsgIDlIDExist())
            {
                ApproveStMsgDetails();

            }
            else
            {
                Response.Write("<script>alert('Your message ID Not in Our Database. Check your ID')</script>");
            }

        }


        //remove button
        protected void StFeedRemoveBtn_Click(object sender, EventArgs e)
        {
            if (checkStMsgIDlIDExist())
            {
                DeleteMsgDetails();
            }
            else
            {
                Response.Write("<script>alert('Your Message ID Not in Our Database. Check your ID')</script>");

            }
        }


        bool checkStMsgIDlIDExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM studentMessages WHERE msg_id = '" + MessageIDTxtBox.Text.Trim() + "'", con);

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



        void ApproveStMsgDetails()
        {
            try
            {
                
                if (string.IsNullOrWhiteSpace(MessageIDTxtBox.Text))
                {
                    Response.Write("<script>alert('Please enter a Message ID');</script>");
                    return; 
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmdn = new SqlCommand("UPDATE studentMessages SET status = @MsgStatus WHERE msg_id = @MsgID", con);
                cmdn.Parameters.AddWithValue("@MsgStatus", "Approved by " + Session["username"]);
                cmdn.Parameters.AddWithValue("@MsgID", MessageIDTxtBox.Text.Trim());
                cmdn.ExecuteNonQuery();


                con.Close();
                Response.Write("<script>alert(' You approved a Student message !')</script>");
                GridView2.DataBind();

                ClearInputs();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void DeleteMsgDetails()
        {
            try
            {
                // Check if txtHostelIDBox is not empty
                if (string.IsNullOrWhiteSpace(MessageIDTxtBox.Text))
                {
                    Response.Write("<script>alert('Please enter a Message ID');</script>");
                    return; 
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM studentMessages WHERE msg_id = @MsgId ", con);
                cmd.Parameters.AddWithValue("@MsgId", MessageIDTxtBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Message ID " + MessageIDTxtBox.Text.Trim() + "Details Deleted !')</script>");
                GridView2.DataBind();

                ClearInputs();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void ClearInputs()
        {
            MessageIDTxtBox.Text = "";
        }
    }
}