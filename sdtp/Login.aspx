<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sdtp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    


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
            <option value="user">Select your Type</option>
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
                <asp:TextBox runat="server" ID="adminPassword" TextMode="Password" placeholder="Password" ></asp:TextBox>
                <asp:Button runat="server" ID="adminLoginButton" CssClass="register-btn" Text="Login" OnClick="AdminLogin_click" />
                <label for="registerLink">Register as Admin:</label>
                <a href="Registerpage.aspx">Register</a>
            </div>

            <!-- Landlord Login Fields -->
            <div id="landlordFields" style="display: none;">
                <label for="landlordUsername">Username:</label>
                <asp:TextBox runat="server" ID="landlordUsername" placeholder="Username"></asp:TextBox>
                <br>
                <label for="landlordPassword">Password:</label>
                <asp:TextBox runat="server" ID="landlordPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:Button runat="server" ID="landlordLoginButton" CssClass="register-btn" Text="Login" OnClick="LandlordLogin_click" />
                <label for="registerLink">Register as Landlord:</label>
                <a href="Registerpage.aspx">Register</a>
            </div>
            <!-- Warden Login Fields -->
            <div id="wardenFields" style="display: none;">
                <label for="wardenUsername">Username:</label>
                <asp:TextBox runat="server" ID="wardenUsername" placeholder="Username"></asp:TextBox>
                <br>
                <label for="wardenPassword">Password:</label>
                <asp:TextBox runat="server" ID="wardenPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:Button runat="server" ID="wardenLoginButton" CssClass="register-btn" Text="Login" OnClick="WardenLogin_click" />
                <br>
                <label for="registerLink">Register as Warden:</label>
                <a href="Registerpage.aspx">Register</a>
            </div>

            <!-- Student Login Fields -->
            <div id="studentFields" style="display: none;">
                <label for="studentUsername">Username:</label>
                <asp:TextBox runat="server" ID="studentUsername" placeholder="Username" ></asp:TextBox>
                <br>
                <label for="studentPassword">Password:</label>
                <asp:TextBox runat="server" ID="studentPassword" TextMode="Password" placeholder="Password" ></asp:TextBox>
                <asp:Button runat="server" ID="studentLoginButton" CssClass="register-btn" Text="Login"  OnClick="StudentLogin_click" />
                <br>
                <label for="registerLink">Register as Student:</label>
                <a href="Registerpage.aspx">Register</a>
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
