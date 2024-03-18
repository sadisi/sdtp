<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="landlord.aspx.cs" Inherits="sdtp.landlord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".datatbl").prepend($("<thead></thead>").append($(this).find
                ("tr.first"))).dataTable();
        }); 

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <link href="DataTables/css/datatables.min.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



      <!--add property-->
    <div class="section best-deal">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>| Landlord</h6>
                        <h2>Add your new Property details</h2>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="tabs-content">
                        <div class="row">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="appartment" role="tabpanel" aria-labelledby="appartment-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <li>Hostel ID: <span>
                                                        <asp:TextBox runat="server" ID="HostelIDTextBox" placeholder="Hostel ID" /></span></li>
                                                    <li>Category: <span>
                                                        <asp:TextBox runat="server" ID="CategoryTextBox" placeholder="Category" /></span></li>
                                                    <li>Price: <span>
                                                        <asp:TextBox runat="server" ID="PriceTxtBox" placeholder="100000"/></span></li>
                                                    <li>Latitude: <span>
                                                        <asp:TextBox runat="server" ID="LatitudeTextBox" placeholder="Latitude" /></span></li>
                                                    <li>Longitude: <span>
                                                        <asp:TextBox runat="server" ID="LongitudeTextBox" placeholder="Longitude" /></span></li>
                                                    <li>Location: <span>
                                                        <asp:TextBox runat="server" ID="LocationTextBox" placeholder="Location" /></span></li>

                                                </ul>
                                            </div>

                                        </div>
                                        <!-- img -->
                                        <div class="col-lg-6 ">

                                            <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="ImageFileUpload" runat="server" />
                                            <div class="col">
                                                <br />
                                                <br />
                                                <br />
                                                <center>

                                                    <img id="imgview" src="assets/hstImg/testimg.jpeg" height="300px" width="100px" style="border-radius: 10px;" />
                                                </center>
                                            </div>

                                        </div>

                                        <!-- img end -->
                                        <div class="col-lg-3">
                                            <h4>Add Information About Property</h4>
                                            <div class="icon-button">

                                                <asp:TextBox runat="server" ID="PropertyDescriptionTextBox" TextMode="MultiLine" Rows="20" Columns="100"></asp:TextBox>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="icon-button">
                                        <asp:LinkButton runat="server" ID="btnAdd" CssClass="btn-with-icon" OnClick="btnAdd_Click">
                                        <i class="fa fa-plus"></i> Add
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="btnUpdate" CssClass="btn-with-icon" OnClick="btnUpdate_Click">
                                         <i class="fa fa-pencil"></i> Update
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="btnDelete" CssClass="btn-with-icon" OnClick="btnDelete_Click">
                                        <i class="fa fa-trash"></i> Delete
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--add property end -->
    <!-- Previous property -->
    <div class="container section">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-heading text-center">
                    <h6>| Your Previously Added Properties</h6>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">

                <div class="item">
                   <!--Data sources-->
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:landlordPage %>' ProviderName='<%$ ConnectionStrings:landlordPage.ProviderName %>' SelectCommand="SELECT * FROM [LandlordPPtbl] WHERE ([username] = @username)">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="username" Name="username" Type="String"></asp:SessionParameter>

                        </SelectParameters>
                    </asp:SqlDataSource>
                     <!--Data sources end-->
                    <div class="col">
                        <div class="scrollbar">
                            <!--Gried view-->
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pp_id" DataSourceID="SqlDataSource1" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="pp_id" HeaderText="Hostel ID" ReadOnly="True" SortExpression="pp_id"></asp:BoundField>
                                    <asp:BoundField DataField="pp_category" HeaderText="Category" SortExpression="pp_category"></asp:BoundField>
                                    <asp:BoundField DataField="pp_price" HeaderText="Price" SortExpression="pp_price"></asp:BoundField>
                                    <asp:BoundField DataField="pp_location" HeaderText="Location" SortExpression="pp_location"></asp:BoundField>
                                    <asp:BoundField DataField="pp_longitude" HeaderText="Longitude" SortExpression="pp_longitude"></asp:BoundField>
                                    <asp:BoundField DataField="pp_latitude" HeaderText="Latitude" SortExpression="pp_latitude"></asp:BoundField>
                                    <asp:BoundField DataField="pp_description" HeaderText="Description" SortExpression="pp_description"></asp:BoundField>
                                    <asp:BoundField DataField="pp_status" HeaderText="Status" SortExpression="status"></asp:BoundField>
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">

                                                    <div class="col-lg-10">
                                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("pp_img_url") %>' />
                                                    </div>

                                                </div>

                                            </div>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                            <!--Gried view end-->
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Previous add property end -->


        <!---------------------------------------Student feed---------------------------------->
        <!--hostel Grid-->
        <div class="properties section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 offset-lg-4">
                        <div class="section-heading text-center">
                            <h6>| Landlord Page </h6>
                            <h2>Student Feedbacks</h2>
                        </div>
                    </div>
                </div>

                <!---->
                <div class="row">
                    <div class="col-lg-12 col-md-6">
                        <div class="item text-center">
                            <!-- Add text-center class here -->
                            <h4>Message ID Here</h4>
                            <ul>
                                <!-- Add Hostel ID input -->
                                <li>Message ID:
                              <asp:TextBox runat="server" ID="MessageIDTxtBox" Class="form-control" placeholder="Enter Message ID" />
                                </li>
                            </ul>
                            <div class="main-button">
                                <!-- Add Font Awesome icons to buttons -->

                                <asp:LinkButton runat="server" ID="ApproveBtn" Text='<span class="fa fa-check"></span> Approve' CssClass="btn" OnClick="StFeedApproveBtn_Click" />
                                <asp:LinkButton runat="server" ID="RejectBtn" Text='<span class="fa fa-trash"></span> Remove' CssClass="btn " OnClick="StFeedRemoveBtn_Click" />


                            </div>

                            <!-- Add GridView to display data -->

                            <!-- Define your data source and columns here -->

                        </div>
                    </div>

                </div>

                <!--Data sources-->

                <!--Data sources end-->
                <div class="col">
                    <div class="scrollbar">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:nsbmSdtpDBConnectionString2 %>' ProviderName='<%$ ConnectionStrings:nsbmSdtpDBConnectionString2.ProviderName %>' SelectCommand="SELECT * FROM [studentMessages]"></asp:SqlDataSource>
                        <!--Gried view-->
                        <asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="msg_id" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="msg_id" HeaderText="msg_id" ReadOnly="True" InsertVisible="False" SortExpression="msg_id"></asp:BoundField>
                                <asp:BoundField DataField="student_username" HeaderText="student_username" SortExpression="student_username"></asp:BoundField>
                                <asp:BoundField DataField="student_email" HeaderText="student_email" SortExpression="student_email"></asp:BoundField>
                                <asp:BoundField DataField="student_message" HeaderText="student_message" SortExpression="student_message"></asp:BoundField>
                                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <!--Gried view end-->
                        <!---->
                    </div>
                </div>

                <!--hostel Grid end-->
                <!-----------------------------------------------------Student Feeds end---------------------------------------->

                <!--previous add property end-->

                <div class="contact section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 offset-lg-4">
                                <div class="section-heading text-center">
                                    <h6>| Hostel Locations</h6>
                                    <h2>Get In Touch With Our Locations</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--map section-->
                <div class="contact-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7">
                                <!--map-->
                                <!--map-->
                                <div id="map" style="width: 1300px; height: 700px; border: 0; border-radius: 10px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.15);"></div>
                                <script>
                                    // Initialize and add the map
                                    let map;
                                    let currentInfowindow;

                                    async function initMap() {
                                        // Request needed libraries.
                                        const { Map } = await google.maps.importLibrary("maps");
                                        const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

                                        // The map, centered at a default location
                                        map = new Map(document.getElementById("map"), {
                                            zoom: 15,
                                            center: { lat: 6.820954288978381, lng: 80.04024112766886 },
                                            mapId: "DEMO_MAP_ID",
                                            mapTypeId: 'satellite',
                                        });

                                        // Assuming mapLocations is the variable containing location details received from the backend
                                        const locations = mapLocations;

                                        // Loop through the locations array and add markers
                                        locations.forEach(location => {
                                            const marker = new AdvancedMarkerElement({
                                                map: map,
                                                position: { lat: location.lat, lng: location.lng },
                                                title: location.title,
                                            });

                                            // Construct the HTML content for the infowindow
                                            const content = `
                                              <div id="info-window-content">
                                              <img src="${location.imageUrl}" alt="Image 1" style="max-width: 300px; max-height: 300px;border-radius: 5px; ">
                                              <br><br>
                                              <span class="category">${location.category}</span><br><br>
                                              <h6>Price = Rs.${location.price}/=</h6><hr>
                                              <p>${location.description}</p>
                                               <hr>
                                              <div class="main-button">
                                               <center>
                                              <a href="#">See More</a>
                                              </center>
                                              </div>
                                             </div>

                                                   `;



                                 const infowindow = new google.maps.InfoWindow({
                                     content: content
                                 });

                                 marker.addListener('click', function () {
                                     // Close the current infowindow if one is open
                                     if (currentInfowindow) {
                                         currentInfowindow.close();
                                     }

                                     // Set the current infowindow to the clicked marker's infowindow
                                     currentInfowindow = infowindow;

                                     // Open the infowindow for the clicked marker
                                     infowindow.open(map, marker);
                                 });

                                 // Add marker to the map
                                 marker.setMap(map);
                             });
                         }

                         // Call initMap when the page has loaded
                         window.onload = initMap;

                         // Function to handle button click
                         function submitFunction(inputId) {
                             const inputValue = document.getElementById(inputId).value;
                             alert('Submitted value: ' + inputValue);
                         }

                                </script>
                    
                     <!--map-->

                     <div class="row">
                         <div class="col-lg-6">
                             <div class="item phone">
                                 <img src="assets/images/phone-icon.png" alt="" style="max-width: 52px;">
                                 <h6>+94 11256778<br>
                                     <span>Phone Number</span></h6>
                             </div>
                         </div>
                         <div class="col-lg-6">
                             <div class="item email">
                                 <img src="assets/images/email-icon.png" alt="" style="max-width: 52px;">
                                 <h6>Hostels@gmail.com<br>
                                     <span>Business Email</span></h6>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>
