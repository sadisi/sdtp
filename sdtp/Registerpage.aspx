<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registerpage.aspx.cs" Inherits="sdtp.Registerpage" %>
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
                        <li><i class="fa fa-envelope"></i>info@company.com</li>
                        <li><i class="fa fa-map"></i>Homagama, LK 33160</li>
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
                              <asp:LinkButton ID="HomePageBtn" Text="Home" runat="server" OnClick="HomePageBtn_Click" />
                              </asp:LinkedButton>
                          </li>


                          <li>
                              <asp:LinkButton ID="Hostelsbtn" Text="Hostels" runat="server" />
                              </asp:LinkedButton>
                          </li>

                          <li>
                              <asp:LinkButton ID="LinkButton2" Text="Hostel Details" runat="server" />
                              </asp:LinkedButton>
                          </li>

                          <li>
                              <asp:LinkButton ID="ContactBtnUs" Text="Contact Us" runat="server" />
                              </asp:LinkedButton>
                          </li>


                          <li>
                              <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">
                                 <i class="fa fa-user"></i> Login
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

    <!-- ***** Header Area End ***** -->

    <div class="main-banner">
        <div class="owl-carousel owl-banner">
            <div class="item item-1">
                <div class="header-text">
                    <span class="category">Homagama, <em>Sri Lanka</em></span>
                    <h2>Hurry!<br>
                        Register as landlord</h2>
                </div>
            </div>
            <div class="item item-2">
                <div class="header-text">
                    <span class="category">Pitipana, <em>Sri Lanka</em></span>
                    <h2>Be Quick!<br>
                        Register as Warden</h2>
                </div>
            </div>
            <div class="item item-3">
                <div class="header-text">
                    <span class="category">School-Junction, <em>Sri Lanka</em></span>
                    <h2>Welcome !</h2>
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
                        <h6>| Featured</h6>
                        <h2>Please Fill bellow Feilds &amp; To Register ! </h2>
                    </div>
                    <!-- Use the same dropdown for user type selection -->
                    <div>
                        <label for="userType">Select User Type:</label>
                        <select id="userType" onchange="showRegisterFields(this.value)">
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
                        <label for="adminPassword">Password:</label>
                        <asp:TextBox runat="server" ID="adminPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <br>
                        <label for="confirmAdminPassword">Confirm Password:</label>
                        <asp:TextBox runat="server" ID="confirmAdminPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        <!-- Registration Button -->
                        <asp:Button runat="server" ID="Button2" CssClass="register-btn" Text="Register" OnClientClick="submitRegistration(); return false;" />

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
                        <asp:Button runat="server" ID="Button1" CssClass="register-btn" Text="Register" OnClientClick="submitRegistration(); return false;" />

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
                        <asp:Button runat="server" ID="registrationButton" CssClass="register-btn" Text="Register" OnClientClick="submitRegistration(); return false;" />

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
                        <asp:Button runat="server" ID="studentRegistrationButton" CssClass="register-btn" Text="Register" OnClientClick="submitStudentRegistration(); return false;" />

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
