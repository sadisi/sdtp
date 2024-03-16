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
using System.Web.Script.Serialization;
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


                            var location = new
                            {
                                lat = reader.IsDBNull(reader.GetOrdinal("pp_latitude")) ?
                                          (decimal?)null : Convert.ToDecimal(reader["pp_latitude"]),
                                lng = reader.IsDBNull(reader.GetOrdinal("pp_longitude")) ?
                                         (decimal?)null : Convert.ToDecimal(reader["pp_longitude"]),
                                title = reader["pp_location"].ToString(),
                                imageUrl = reader["pp_img_url"].ToString(),
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

            ////////////
            ///Gried view of properties
            ///////////
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
                            var property = new
                            {
                                imageUrl = reader["pp_img_url"].ToString(),
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
        }
    }
    
    
}



