using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;





namespace sdtp
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the Google Maps API key from the appSettings section in web.config
            string googleMapsApiKey = WebConfigurationManager.AppSettings["GoogleMapsApiKey"];

            // Register the API key as a startup script variable
            Page.ClientScript.RegisterStartupScript(this.GetType(), "GoogleMapsApiKey", $"var googleMapsApiKey = '{googleMapsApiKey}';", true);

            // Establish connection to the database using the provided connection string
            string connectionString = "Data Source=DESKTOP-PAO1EML;Initial Catalog=nsbmSdtpDB;Integrated Security=True";
            /*
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
                        // Loop through the retrieved data and generate HTML markup dynamically
                        while (reader.Read())
                        {
                            // Generate HTML markup for each row of data
                            string imageUrl = reader["pp_img_url"].ToString();
                            string category = reader["pp_category"].ToString();
                            decimal longitude = (decimal)reader["pp_longitude"];
                            decimal latitude = (decimal)reader["pp_latitude"];
                            string location = reader["pp_location"].ToString();
                            string description = reader["pp_description"].ToString();
                            string status = reader["pp_status"].ToString(); // Added the new "status" column

                            string html = $@"
                            <div class='col-lg-4 col-md-6'>
                                    <div class='item'>
                                      <a href='hostel-details.aspx'><img src='{imageUrl}' alt=''></a>
                <span class='category'>{category}</span>
                <h6>Rs.{price}/=</h6>
                <h4><a href='hostel-details.aspx'>{location}</a></h4>
                <ul>
                    <li>Bedrooms: <span>{bedrooms}</span></li>
                    <li>Bathrooms: <span>{bathrooms}</span></li>
                    <li>Area: <span>{area}m2</span></li>
                    <li>Floor: <span>{floor}</span></li>
                    <li>Parking: <span>{parking} spots</span></li>
                    <li>AC: <span>{ac}</span></li>
                </ul>
                <div class='main-button'>
                    <a href='property-details.html'>See More</a>
                </div>
            </div>
        </div>";

                            // Add the generated HTML to a container control on your page
                            container.Controls.Add(new LiteralControl(html));
                        }
                    }
                }
            }


            */
        }
    }
}



