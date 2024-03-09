<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registerpage.aspx.cs" Inherits="sdtp.Registerpage" %>
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
                        <h6>| Featured</h6>
                        <h2>Please Fill bellow Feilds &amp; To Register ! </h2>
                    </div>
                    <!-- Use the same dropdown for user type selection -->
                    <div>
                        <label for="userType">Select User Type:</label>
                        <select id="userType" onchange="showRegisterFields(this.value)">
                             <option value="user">Select your Type</option>
                            <option value="admin">Admin</option>
                            <option value="landlord">Landlord</option>
                            <option value="warden">Warden</option>
                            <option value="student">student</option>
                        </select>
                    </div>

                    <!-- Admin Registration Fields -->
                    <div id="adminRegisterFields" style="display: none;">
                        <label for="adminEmail">Email:</label>
                        <asp:TextBox runat="server" ID="adminEmail" placeholder="Email"></asp:TextBox>
                        <br>
                        <label for="adminUsername">Username:</label>
                        <asp:TextBox runat="server" ID="adminUsername" placeholder="Username"></asp:TextBox>
                        <br>
                        <label for="adminPassword">Password:</label>
                        <asp:TextBox runat="server" ID="adminPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <br>
                        <label for="confirmAdminPassword">Confirm Password:</label>
                        <asp:TextBox runat="server" ID="confirmAdminPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <!-- Registration Button -->
                        <asp:Button runat="server" ID="Button2" CssClass="register-btn" Text="Register" OnClick="RegisterAdmin_click"/>

                        <!-- Have a Account Login Link -->
                        <label for="loginLink">Already Have an Account:</label>
                        <a href="Login.aspx">Login</a>

                    </div>

                    <!-- Landlord Registration Fields -->
                    <div id="landlordRegisterFields" style="display: none;">
                        <label for="landlordEmail">Email:</label>
                        <asp:TextBox runat="server" ID="landlordEmail" placeholder="Email"></asp:TextBox>
                        <br>
                        <label for="landlordUsername">Username:</label>
                        <asp:TextBox runat="server" ID="landlordUsername" placeholder="Username"></asp:TextBox>
                        <br>
                        <label for="landlordMobile">Mobile Number:</label>
                        <asp:TextBox runat="server" ID="landlordMobile" placeholder="Mobile Number"></asp:TextBox>
                        <br>
                        <label for="landlordPassword">Password:</label>
                        <asp:TextBox runat="server" ID="landlordPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <br>
                        <label for="confirmLandlordPassword">Confirm Password:</label>
                        <asp:TextBox runat="server" ID="confirmLandlordPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <!-- Registration Button -->
                        <asp:Button runat="server" ID="Button1" CssClass="register-btn" Text="Register" OnClick="RegisterLandord_click" />

                        <!-- Have a Account Login Link -->
                        <label for="loginLink">Already Have an Account:</label>
                        <a href="Login.aspx">Login</a>
                    </div>


                    <!-- Warden Registration Fields -->
                    <div id="wardenRegisterFields" style="display: none;">
                        <label for="wardenEmail">Email:</label>
                        <asp:TextBox runat="server" ID="wardenEmail" placeholder="Email"></asp:TextBox>
                        <br>
                        <label for="wardenUsername">Username:</label>
                        <asp:TextBox runat="server" ID="wardenUsername" placeholder="Username"></asp:TextBox>
                        <br>
                        <label for="wardenPhoneNumber">Phone Number:</label>
                        <asp:TextBox runat="server" ID="wardenPhoneNumber" placeholder="Phone Number"></asp:TextBox>
                        <br>
                        <label for="wardenPassword">Password:</label>
                        <asp:TextBox runat="server" ID="wardenPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <br>
                        <label for="confirmWardenPassword">Confirm Password:</label>
                        <asp:TextBox runat="server" ID="confirmWardenPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <br>
                        
                        <!-- Registration Button -->
                        <asp:Button runat="server" ID="registrationButton" CssClass="register-btn" Text="Register" OnClick="RegisterWarden_click" />

                        <!-- Have a Account Login Link -->
                        <label for="loginLink">Already Have an Account:</label>
                        <a href="Login.aspx">Login</a>
                    </div>

                    <!-- Student Registration Fields -->
                    <div id="studentRegisterFields" style="display: none;">
                        <label for="studentEmail">Email:</label>
                        <asp:TextBox runat="server" ID="studentEmail" placeholder="Email"></asp:TextBox>
                        <br>
                        <label for="studentUsername">Username:</label>
                        <asp:TextBox runat="server" ID="studentUsername" placeholder="Username"></asp:TextBox>
                        <br>
                        <label for="studentPassword">Password:</label>
                        <asp:TextBox runat="server" ID="studentPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <br>
                        <label for="confirmStudentPassword">Confirm Password:</label>
                        <asp:TextBox runat="server" ID="confirmStudentPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <br>
                        <label for="studentPhoneNumber">Phone Number:</label>
                        <asp:TextBox runat="server" ID="studentPhoneNumber" placeholder="Phone Number"></asp:TextBox>
                        <br>
                        <!-- Registration Button -->
                        <asp:Button runat="server" ID="studentRegistrationButton" CssClass="register-btn" Text="Register" OnClick="RegisterStudent_click" />

                        <!-- Have an Account Login Link -->
                        <label for="studentLoginLink">Already Have an Account:</label>
                        <a href="Login.aspx">Login</a>
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
        function showRegisterFields(selectedOption) {
            var adminRegisterFields = document.getElementById('adminRegisterFields');
            var landlordRegisterFields = document.getElementById('landlordRegisterFields');
            var wardenRegisterFields = document.getElementById('wardenRegisterFields');
            var studentRegisterFields = document.getElementById('studentRegisterFields');

            // Hide all registration fields
            adminRegisterFields.style.display = 'none';
            landlordRegisterFields.style.display = 'none';
            wardenRegisterFields.style.display = 'none';
            studentRegisterFields.style.display = 'none';

            // Show registration fields based on selected option
            if (selectedOption === 'admin') {
                adminRegisterFields.style.display = 'block';
            } else if (selectedOption === 'landlord') {
                landlordRegisterFields.style.display = 'block';
            } else if (selectedOption === 'warden') {
                wardenRegisterFields.style.display = 'block';
            } else if (selectedOption === 'student') {
                studentRegisterFields.style.display = 'block';
            }
        }

        // Logic to submit the registration form based on user type
        function submitRegistration() {
            // Add your logic here for handling the registration submission
        }
    </script>


</asp:Content>