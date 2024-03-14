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
                                                        <asp:TextBox runat="server" ID="HostelIDTextBox" /></span></li>
                                                    <li>Category: <span>
                                                        <asp:TextBox runat="server" ID="CategoryTextBox" /></span></li>
                                                    <li>Latitude: <span>
                                                        <asp:TextBox runat="server" ID="LatitudeTextBox" /></span></li>
                                                    <li>Longitude: <span>
                                                        <asp:TextBox runat="server" ID="LongitudeTextBox" /></span></li>
                                                    <li>Location: <span>
                                                        <asp:TextBox runat="server" ID="LocationTextBox" /></span></li>

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
                                    <asp:BoundField DataField="pp_location" HeaderText="Location" SortExpression="pp_location"></asp:BoundField>
                                    <asp:BoundField DataField="pp_longitude" HeaderText="Longitude" SortExpression="pp_longitude"></asp:BoundField>
                                    <asp:BoundField DataField="pp_latitude" HeaderText="Latitude" SortExpression="pp_latitude"></asp:BoundField>
                                    <asp:BoundField DataField="pp_description" HeaderText="Description" SortExpression="pp_description"></asp:BoundField>
                                   <asp:BoundField DataField="pp_status" HeaderText="Status" SortExpression="status"></asp:BoundField>
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">

                                                    <div class="col-lg-6">
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
                    <div id="map" style="width: 1300px; height: 700px; border: 0; border-radius: 10px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.15);">
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
                                    zoom: 14,
                                    center: { lat: 6.820954288978381, lng: 80.04024112766886 },
                                    mapId: "DEMO_MAP_ID",
                                    mapTypeId: 'satellite',
                                });

                                // Array of locations
                                const locations = [
                                    {
                                        lat: 6.8227638483330315,
                                        lng: 80.03801351732815,
                                        title: 'Location 1',
                                        content: '<div id="info-window-content"><img src="assets/images/vilo.png" alt="Image 1"><p>Additional information about Location 1.</p><input type="text" id="input1" placeholder="Enter text"><button onclick="submitFunction(\'input1\')" style="margin-top: 5px; padding: 5px 10px; background-color: #f35525; color: white; border: none; border-radius: 3px; cursor: pointer;">Submit</button></div>'
                                    },
                                    {
                                        lat: 6.825874839137297,
                                        lng: 80.04293712283503,
                                        title: 'Location 2',
                                        content: '<div id="info-window-content"><img src="assets/images/property-05.jpg" alt="Image 2"><p>Additional information about Location 2.</p><input type="text" id="input2" placeholder="Enter text"><button onclick="submitFunction(\'input2\')" style="margin-top: 5px; padding: 5px 10px; background-color: #f35525; color: white; border: none; border-radius: 3px; cursor: pointer;">Submit</button></div>'
                                    },
                                    {
                                        lat: 6.824981287537003,
                                        lng: 80.0417274849921,
                                        title: 'Location 3',
                                        content: '<div id="info-window-content"><img src="assets/images/property-06.jpg" alt="Image 3"><p>Additional information about Location 3.</p><input type="text" id="input3" placeholder="Enter text"><button onclick="submitFunction(\'input3\')" style="margin-top: 5px; padding: 5px 10px; background-color: #f35525; color: white; border: none; border-radius: 3px; cursor: pointer;">Submit</button></div>'
                                    },
                                    // Add contentString for other locations
                                ];

                                // Loop through the locations array and add markers
                                locations.forEach(location => {
                                    const marker = new AdvancedMarkerElement({
                                        map: map,
                                        position: { lat: location.lat, lng: location.lng },
                                        title: location.title,
                                    });

                                    const infowindow = new google.maps.InfoWindow({
                                        content: location.content
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
                                });


                            }

                            // Call initMap when the page has loaded
                            window.onload = initMap;

                            // Function to handle button click
                            function submitFunction(inputId) {
                                const inputValue = document.getElementById(inputId).value;
                                alert('Submitted value: ' + inputValue);
                                // You can perform further actions with the submitted value
                            }
                        </script>



                    </div>
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
                                <h6>info@HstNSBM.co<br>
                                    <span>Business Email</span></h6>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

        <script src="DataTables/js/datatables.min.js"></script>
        <script src="DataTables/js/datatables.js"></script>
</asp:Content>
