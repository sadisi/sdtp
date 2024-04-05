<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="sdtp.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="section best-deal">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>| User Type </h6>
                        <h2>Create Accounts</h2>
                    </div>
                    <div>
                        <label for="userType">User Type:</label>
                        <select id="userType" onchange="showUserFields(this.value)">
                            <option value="user">Select Account Type</option>
                            <option value="landlord">Landlord</option>
                            <option value="student">Student</option>
                            <option value="warden">Warden</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="tabs-content">
                        <div class="row">
                            <div class="col-lg-3">
                                <!-- Info Table -->
                                <div class="info-table">
                                    <!-- Landlord Fields -->
                                    <div id="landlordFields" style="display: none;">
                                        <ul>
                                            <li>Email: <span>
                                                <asp:TextBox runat="server" ID="EmailTextBox" /></span></li>
                                            <li>Username: <span>
                                                <asp:TextBox runat="server" ID="UsernameTextBox" /></span></li>
                                            <li>Mobile Number: <span>
                                                <asp:TextBox runat="server" ID="MobileNumberTextBox" /></span></li>
                                            <li>Password: <span>
                                                <asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password" /></span></li>
                                            <li>Confirm Password: <span>
                                                <asp:TextBox runat="server" ID="ConfirmPasswordTextBox" TextMode="Password" /></span></li>
                                        </ul>
                                        <asp:Button runat="server" ID="LandlordButton" CssClass="register-btn" Text="Create an Account" OnClick="LandlordAccCreate_click" />
                                    </div>
                                    <!-- End Landlord Fields -->

                                    <!-- Student Fields -->
                                    <div id="studentFields" style="display: none;">
                                        <ul>
                                            <li>Email: <span>
                                                <asp:TextBox runat="server" ID="StudentEmailTxtbox" /></span></li>
                                            <li>Username: <span>
                                                <asp:TextBox runat="server" ID="StudentUNTxtbox" /></span></li>
                                            <li>Mobile Number: <span>
                                                <asp:TextBox runat="server" ID="StudentMNTxtbox" /></span></li>
                                            <li>Password: <span>
                                                <asp:TextBox runat="server" ID="StudentPSTxtbox" TextMode="Password" /></span></li>
                                            <li>Confirm Password: <span>
                                                <asp:TextBox runat="server" ID="StudentConfirmPSTxtbox" TextMode="Password" /></span></li>
                                        </ul>
                                        <asp:Button runat="server" ID="StudentButton" CssClass="register-btn" Text="Create an Account" OnClick="StudentAccCreate_click" />
                                    </div>
                                    <!-- End Student Fields -->

                                    <!-- Warden Fields -->
                                    <div id="wardenFields" style="display: none;">
                                        <ul>
                                            <li>Email: <span>
                                                <asp:TextBox runat="server" ID="WardenEmailTxtbox" /></span></li>
                                            <li>Username: <span>
                                                <asp:TextBox runat="server" ID="WardenUNTxtbox" /></span></li>
                                            <li>Mobile Number: <span>
                                                <asp:TextBox runat="server" ID="WardenMNTxtbox" /></span></li>
                                            <li>Password: <span>
                                                <asp:TextBox runat="server" ID="WardenPSTxtbox" TextMode="Password" /></span></li>
                                            <li>Confirm Password: <span>
                                                <asp:TextBox runat="server" ID="WardenPSConfirmTxtbox" TextMode="Password" /></span></li>
                                        </ul>
                                        <asp:Button runat="server" ID="WardenButton" CssClass="register-btn" Text="Create an Account" OnClick="WardenAccCreate_click" />
                                    </div>
                                    <!-- End Warden Fields -->

                                </div>
                            </div>
                            <div class="col-lg-6">
                            </div>
                            <div class="col-lg-3">
                                <h4>Add Article</h4>
                                <div class="icon-button">

                                    <asp:TextBox runat="server" ID="ArticleTextBox" TextMode="MultiLine" Rows="20"  Columns="50"></asp:TextBox>

                                </div>
                                <div class="icon-button">
                                    <asp:LinkButton runat="server" ID="ArticleUploadBtn" CssClass="btn btn-with-icon" OnClientClick="ArticleUploadBtn_Click" OnClick="ArticleUploadBtn_Click">
                                    <i class="fas fa-upload"></i> Publish Article
                                    </asp:LinkButton>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showUserFields(selectedUserType) {
            var landlordFields = document.getElementById('landlordFields');
            var studentFields = document.getElementById('studentFields');
            var wardenFields = document.getElementById('wardenFields');

            // Hide all user fields
            landlordFields.style.display = 'none';
            studentFields.style.display = 'none';
            wardenFields.style.display = 'none';

            // Show fields based on selected user type
            if (selectedUserType === 'landlord') {
                landlordFields.style.display = 'block';
            } else if (selectedUserType === 'student') {
                studentFields.style.display = 'block';
            } else if (selectedUserType === 'warden') {
                wardenFields.style.display = 'block';
            }
        }
    </script>
    <!--previous add property end-->

    <div class="contact section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="section-heading text-center">
                        <h6>| ADMIN</h6>
                        <h2>This is Admin Page</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
