<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sdtp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <div class="sub-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-8">
          <ul class="info">
            <li><i class="fa fa-envelope"></i> info@company.com</li>
            <li><i class="fa fa-map"></i> Homagama, LK 33160</li>
          </ul>
        </div>
        <div class="col-lg-4 col-md-4">
          <ul class="social-links">
            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
            <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
            <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.aspx" class="logo">
                        <h1>HOSTELS</h1>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                     <ul class="nav">
              <li class="active">
                   <asp:LinkButton ID="HomePageBtn" Text="Home" runat="server"  />  </asp:LinkedButton>
                </li>


               <li>
                    <asp:LinkButton ID="Hostelsbtn" Text="Hostels" runat="server"  />  </asp:LinkedButton>
               </li>

               <li>
                    <asp:LinkButton ID="LinkButton2" Text="Hostel Details" runat="server"  />  </asp:LinkedButton>
               </li>

              <li>
                   <asp:LinkButton ID="ContactBtnUs" Text="Contact Us" runat="server"  />  </asp:LinkedButton>
              </li>

              <li>
                <asp:LinkButton ID="LogOutBtn" Text="LogOut" runat="server"  />  </asp:LinkedButton>
             </li>

            <li>
                 <asp:LinkButton ID="LinkButton4" runat="server" >
                    <i class="fa fa-user"></i> Register
                  </asp:LinkButton>
           </li>


    
            </ul>    
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="main-banner">
    <div class="owl-carousel owl-banner">
      <div class="item item-1">
        <div class="header-text">
          <span class="category">Homagama, <em>Sri Lanka</em></span>
          <h2>Welcome!<br> landloard </h2>
        </div>
      </div>
      <div class="item item-2">
        <div class="header-text">
          <span class="category">Pitipana, <em>Sri Lanka</em></span>
          <h2>Be Quick!<br>Register as landlord</h2>
        </div>
      </div>
      <div class="item item-3">
        <div class="header-text">
          <span class="category">School-Junction, <em>Sri Lanka</em></span>
          <h2>Register as Warden</h2>
        </div>
      </div>
    </div>
  </div>

  <div class="featured section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
         
        </div>
        <div class="col-lg-5">
          <div class="section-heading">
            <h6>| Welcome !</h6>
            <h2>Please Fill Below Feilds &amp;to Login !</h2>
          </div>
        <div>
        <label for="userType">Select User Type:</label>
        <select id="userType" onchange="showLoginFields(this.value)">
            <option value="admin">Admin</option>
            <option value="landlord">Landlord</option>
            <option value="warden">Warden</option>
            <option value="student">Student</option>
        </select>
    </div>

<!-- Admin Login Fields -->
<div id="adminFields" style="display: none;">
    <label for="adminUsername">Username:</label>
    <asp:TextBox runat="server" ID="adminUsername" placeholder="Username"></asp:TextBox>
    <br>
    <label for="adminPassword">Password:</label>
    <asp:TextBox runat="server" ID="adminPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:Button runat="server" ID="adminLoginButton" CssClass="register-btn" Text="Login" OnClientClick="loginbtn(); return false;" />
    <label for="registerLink">Register as Admin:</label>
    <a href="register.aspx">Register</a>
</div>

<!-- Landlord Login Fields -->
<div id="landlordFields" style="display: none;">
    <label for="landlordEmail">Email:</label>
    <asp:TextBox runat="server" ID="landlordEmail" placeholder="Email"></asp:TextBox>
    <br>
    <label for="landlordPassword">Password:</label>
    <asp:TextBox runat="server" ID="landlordPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:Button runat="server" ID="landlordLoginButton" CssClass="register-btn" Text="Login" OnClientClick="loginbtn(); return false;" />
    <label for="registerLink">Register as Landlord:</label>
    <a href="register.aspx">Register</a>
</div>

<!-- Warden Login Fields -->
<div id="wardenFields" style="display: none;">
    <label for="wardenEmail">Email:</label>
    <asp:TextBox runat="server" ID="wardenEmail" placeholder="Email"></asp:TextBox>
    <br>
    <label for="wardenPassword">Password:</label>
    <asp:TextBox runat="server" ID="wardenPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:Button runat="server" ID="wardenLoginButton" CssClass="register-btn" Text="Login" OnClientClick="loginbtn(); return false;" />
    <br>
    <label for="registerLink">Register as Warden:</label>
    <a href="register.aspx">Register</a>
</div>

      <!-- Student Login Fields -->
<div id="studentFields" style="display: none;">
    <label for="studentEmail">Email:</label>
    <asp:TextBox runat="server" ID="TextBox3" placeholder="Email"></asp:TextBox>
    <br>
    <label for="studentPassword">Password:</label>
    <asp:TextBox runat="server" ID="TextBox4" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:Button runat="server" ID="Button2" CssClass="register-btn" Text="Login" OnClientClick="loginbtn(); return false;" />
    <br>
    <label for="registerLink">Register as Student:</label>
    <a href="register.aspx">Register</a>
</div>


        </div>
     
      </div>
    </div>
  </div>

<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/counter.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/mapjs.js"></script>

  <script>
      function showLoginFields(selectedOption) {
          var adminFields = document.getElementById('adminFields');
          var landlordFields = document.getElementById('landlordFields');
          var wardenFields = document.getElementById('wardenFields');
          var studentFields = document.getElementById('studentFields');

          // Hide all fields
          adminFields.style.display = 'none';
          landlordFields.style.display = 'none';
          wardenFields.style.display = 'none';
          studentFields.style.display = 'none';

          // Show fields based on selected option
          if (selectedOption === 'admin') {
              adminFields.style.display = 'block';
          } else if (selectedOption === 'landlord') {
              landlordFields.style.display = 'block';
          } else if (selectedOption === 'warden') {
              wardenFields.style.display = 'block';
          } else if (selectedOption === 'student') {
              studentFields.style.display = 'block';
          }
      }
  </script>



</asp:Content>
