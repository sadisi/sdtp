using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
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
        }
    }
    

}