using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdtp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {

                    Hostelsbtn.Visible = true;
                    HomePageBtn.Visible = true;
                    ContactBtnUs.Visible = true;
                    landlordPageBtn.Visible = false;
                    WardenPageBtn.Visible = false;
                    LogOutBtn.Visible = false; //lg out btn
                    HelloUser.Visible = false; //usnm display button
                    
                }
                else if (Session["role"].Equals("admin"))
                {
                    Hostelsbtn.Visible = true;
                    HomePageBtn.Visible = true;
                    ContactBtnUs.Visible = true;

                    LoginBtn.Visible = false; //lg in  btn
                    LogOutBtn.Visible = true; //lg out btn
                    landlordPageBtn.Visible = false;
                    AdminPageBtn.Visible = true;
                    WardenPageBtn.Visible = false;
                    HelloUser.Visible = true; //usnm display button

                    HelloUser.Text = "Hello Admin";
                }

                else if (Session["role"].Equals("landlord"))
                {
                    Hostelsbtn.Visible = true;
                    HomePageBtn.Visible = true;
                    ContactBtnUs.Visible = true;


                    LoginBtn.Visible = false; //lg in  btn
                    landlordPageBtn.Visible = true;
                    WardenPageBtn.Visible = false;
                    LogOutBtn.Visible = true; //lg out btn
                    HelloUser.Visible = true; //usnm display button

                    HelloUser.Text = "@" + Session["username"].ToString() + " ";
                }

                else if (Session["role"].Equals("warden"))
                {
                    Hostelsbtn.Visible = true;
                    HomePageBtn.Visible = true;
                    ContactBtnUs.Visible = true;
                   
                    LoginBtn.Visible = false; //lg in  btn
                    LogOutBtn.Visible = true; //lg out btn
                    HelloUser.Visible = true; //usnm display button
                    WardenPageBtn.Visible = true;
                    HelloUser.Text = "@" + Session["username"].ToString() + " ";
                }

                else if (Session["role"].Equals("student"))
                {
                    Hostelsbtn.Visible = true;
                    HomePageBtn.Visible = true;
                    ContactBtnUs.Visible = true;
                    WardenPageBtn.Visible = false;
                    LoginBtn.Visible = false; //lg in  btn
                    LogOutBtn.Visible = true; //lg out btn
                    HelloUser.Visible = true; //usnm display button
                    HelloUser.Text = "@" + Session["username"].ToString() + " ";
                }
            }


            catch(Exception ex)
            {

            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void HomePageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }


        //logout
        protected void LogOutBtn_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["role"] = "";


            //default navigation settngs

            HomePageBtn.Visible = true;
            Hostelsbtn.Visible = true;
            ContactBtnUs.Visible = true;
            LoginBtn.Visible= true;

            LogOutBtn.Visible = false; 
            HelloUser.Visible = false;
            landlordPageBtn.Visible = false;
            AdminPageBtn.Visible = false;
            WardenPageBtn.Visible = false;

            //celar the sessions and re direct to home page
            Session.Clear();
            Response.Redirect("homepage.aspx");
        }

        protected void landlordPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("landlord.aspx");
        }

        protected void AdminPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }

        protected void WardenPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("WardenPage.aspx");
        }
    }
}