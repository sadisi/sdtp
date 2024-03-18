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
    public partial class studentPage : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-PAO1EML;Initial Catalog=nsbmSdtpDB;Integrated Security=True";

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





                  //Hostel GridView
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define your SQL query to retrieve data from the database
                string query = "SELECT * FROM LandlordPPtbl WHERE pp_status = 'Active'";

                // Open the database connection
                connection.Open();

                // Execute the query and retrieve the data
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Execute the query and retrieve the data
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        List<object> properties = new List<object>();
                        while (reader.Read())
                        {
                            var filename = Path.GetFileName(reader["pp_img_url"].ToString());
                            var property = new
                            {
                                imageUrl = $"hstImg/{filename}",
                                category = reader["pp_category"].ToString(),
                                price = reader["pp_price"].ToString(),
                                location = reader["pp_location"].ToString(),
                                description = reader["pp_description"].ToString()
                            };


                            properties.Add(property);
                        }

                        // Serialize the list to JSON
                        string propertiesJson = new JavaScriptSerializer().Serialize(properties);

                        // Register the properties as a startup script variable
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "PropertyData", $"var propertyData = {propertiesJson};", true);
                    }
                }
            }


                // Retrieve admin articles and bind them to the Repeater
                BindAdminArticles();
         
          


        }

        protected void BindAdminArticles()
        {
            string query = "SELECT admin_article FROM adminArticle";
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString2))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
            }
            AdminArticlesRepeater.DataSource = dt;
            AdminArticlesRepeater.DataBind();
        }





        protected void FeedSendBtn_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO studentMessages (student_username, student_email, student_message, status) VALUES (@studentUsername, @emailTxtBox, @messageTxtBox, @status)", con);
                    cmd.Parameters.AddWithValue("@studentUsername", Session["username"]);
                    cmd.Parameters.AddWithValue("@emailTxtBox", emailTxtBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@messageTxtBox", messageTxtBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", "Unread");

                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearFeilds();
                }
                Response.Write("<script>alert('A message was successfully sent. further details, they can contact you via your provided email.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearFeilds()
        {
            emailTxtBox.Text = "";
            messageTxtBox.Text = "";
        }
    }
}
