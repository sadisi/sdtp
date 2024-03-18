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
                        <h6>| Welcome to </h6>
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

                            <asp:LinkButton runat="server" ID="LinkButton1" Text='<span class="fa fa-check"></span> Approve' OnClick="ApproveBtn_Click" CssClass="btn" />
                            <asp:LinkButton runat="server" ID="LinkButton2" Text='<span class="fa fa-trash"></span> Remove' OnClick="RemoveBtn_Click" CssClass="btn " />

                        </div>
                   </div>
                </div>

            </div>

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

                                            <div class="col-lg-12">
                                                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pp_img_url") %>' />
                                            </div>

                                        </div>

                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

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
             </div>
         </div>
     </div>
 </div>
</asp:Content>
