<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WardenPage.aspx.cs" Inherits="sdtp.WardenPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--hostel Grid-->
    <div class="properties section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="section-heading text-center">
                        <h6>| Properties</h6>
                        <h2>Warden Page</h2>
                    </div>
                </div>
            </div>

            <!---->
            <div class="row">
                <div class="col-lg-12 col-md-6">
                    <div class="item text-center">
                        <!-- Add text-center class here -->
                        <h4>Enter Hostel ID here</h4>
                        <ul>
                            <!-- Add Hostel ID input -->
                            <li>Hostel ID:
                                 <asp:TextBox runat="server" ID="txtHostelIDBox" Class="form-control" placeholder="Enter hostel ID" />
                            </li>
                        </ul>
                        <div class="main-button">
                            <!-- Add Font Awesome icons to buttons -->
                          
                            <asp:LinkButton runat="server" ID="LinkButton1" Text='<span class="fa fa-check"></span> Approve' OnClick="ApproveBtn_Click" CssClass="btn" />
                            <asp:LinkButton runat="server" ID="LinkButton2" Text='<span class="fa fa-trash"></span> Remove' OnClick="RemoveBtn_Click" CssClass="btn " />


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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:landLordPageTableForWardenPageAccess %>' ProviderName='<%$ ConnectionStrings:landLordPageTableForWardenPageAccess.ProviderName %>' SelectCommand="SELECT * FROM [LandlordPPtbl]"></asp:SqlDataSource>
                    <!--Gried view-->
                    <asp:GridView class="table table-striped table-bordered"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pp_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="pp_id" HeaderText="Hostel ID" ReadOnly="True" SortExpression="pp_id"></asp:BoundField>
                            <asp:BoundField DataField="pp_category" HeaderText="Category" SortExpression="pp_category"></asp:BoundField>
                            <asp:BoundField DataField="pp_price" HeaderText="Price" SortExpression="pp_price"></asp:BoundField>
                            <asp:BoundField DataField="pp_location" HeaderText="Location" SortExpression="pp_location"></asp:BoundField>
                            <asp:BoundField DataField="pp_longitude" HeaderText="Longitude" SortExpression="pp_longitude"></asp:BoundField>
                            <asp:BoundField DataField="pp_latitude" HeaderText="Latitude" SortExpression="pp_latitude"></asp:BoundField>
                            <asp:BoundField DataField="pp_description" HeaderText="Description" SortExpression="pp_description"></asp:BoundField>
                            <asp:BoundField DataField="username" HeaderText="Landlord Name" SortExpression="username"></asp:BoundField>
                            <asp:BoundField DataField="pp_status" HeaderText="Status" SortExpression="pp_status"></asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="container-fluid">
                                        <div class="row">

                                            <div class="col-lg-6">
                                                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pp_img_url") %>' />
                                            </div>

                                        </div>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <!--Gried view end-->
                    <!---->
                </div>
            </div>

            <!--hostel Grid end-->

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
            <br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br>

            <!--map section-->
             <!--map section-->
<div class="contact-content">
  <div class="container">
    <div class="row">
      <div class="col-lg-7">
          <!--map-->
        <div id="map"  style="width: 1300px; height: 700px; border: 0; border-radius: 10px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.15);">
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

            // Array of locations
            const locations = [
                {
                    lat: 6.8227638483330315,
                    lng: 80.03801351732815,
                    title: 'Location 1',
                    content: '<div id="info-window-content"><img src="assets/images/vilo.png" alt="Image 1"><p>Additional information about Location 1.</p><input type="text" id="input1" placeholder="Enter text"><button  Class="map-button"">Submit</button></div>'
                },
                {
                    lat: 6.825874839137297,
                    lng: 80.04293712283503,
                    title: 'Location 2',
                    content: '<div id="info-window-content"><img src="assets/images/property-05.jpg" alt="Image 2"><p>Additional information about Location 2.</p><input type="text" id="input2" placeholder="Enter text"><button Class="map-button">Submit</button></div>'
                },
                {
                    lat: 6.824981287537003,
                    lng: 80.0417274849921,
                    title: 'Location 3',
                    content: '<div id="info-window-content"><img src="assets/images/property-06.jpg" alt="Image 3"><p>Additional information about Location 3.</p><input type="text" id="input3" placeholder="Enter text"><button  Class="map-button"">Submit</button></div>'
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

        }
    </script>



        </div>
             <!--map-->
        <div class="row">
          <div class="col-lg-6">
            <div class="item phone">
              <img src="assets/images/phone-icon.png" alt="" style="max-width: 52px;">
              <h6>+94 11256778<br><span>Phone Number</span></h6>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="item email">
              <img src="assets/images/email-icon.png" alt="" style="max-width: 52px;">
              <h6>info@HstNSBM.co<br><span>Business Email</span></h6>
            </div>
          </div>
        </div>
      </div>

     
    </div>
  </div>
</div>
</asp:Content>
