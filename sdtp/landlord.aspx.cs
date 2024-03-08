using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{
    public partial class landlord : System.Web.UI.Page
    {
       
        protected void HomePageBtn_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("homepage.aspx");
        }
    }
}