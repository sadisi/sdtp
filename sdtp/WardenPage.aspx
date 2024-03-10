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
                        <h2>We Provide The Best Property You Like</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="item">
                        <a href="hostel-details.aspx">
                            <img src="assets/images/vilo.png" alt=""></a>
                        <span class="category">Hostel</span>
                        <h6>Rs.65000/=</h6>
                        <h4><a href="hostel-details.aspx">Makubura,Homagama</a></h4>
                        <ul>
                            <li>Bedrooms: <span>8</span></li>
                            <li>Bathrooms: <span>8</span></li>
                            <li>Area: <span>545m2</span></li>
                            <li>Floor: <span>1</span></li>
                            <li>Parking: <span>6 spots</span></li>
                            <li>AC: <span>Yes</span></li>
                            <li>
                                <label for="description">Description:</label>
                                <textarea id="DescriptionArea" rows="10" cols="50" placeholder="Description"></textarea>
                            </li>

                        </ul>
                        <div class="main-button ">
                            <asp:LinkButton runat="server" ID="btnApprove" Text="Approve" OnClientClick="approveProperty()">
                         <span class="fa fa-check"></span> Approve 
                            </asp:LinkButton>

                            <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" OnClientClick="removeProperty()">
                         <span class="fa fa-trash"></span> Remove
                            </asp:LinkButton>
                        </div>



                    </div>
                </div>



                <div class="col-lg-4 col-md-6">
                    <div class="item">
                        <a href="property-details.html">
                            <img src="assets/images/vilo.png" alt=""></a>
                        <span class="category">Apartment</span>
                        <h6>Rs.35000/=</h6>
                        <h4><a href="property-details.html">School Junction,Homagama</a></h4>
                        <ul>
                            <li>Bedrooms: <span>3</span></li>
                            <li>Bathrooms: <span>2</span></li>
                            <li>Area: <span>165m2</span></li>
                            <li>Floor: <span>1</span></li>
                            <li>Parking: <span>6 spots</span></li>
                            <li>AC: <span>Yes</span></li>
                            <li>
                                <label for="description">Description:</label>
                                <textarea id="DescriptionArea" rows="10" cols="50" placeholder="Description"></textarea>
                            </li>
                        </ul>
                        <div class="main-button ">
                            <asp:LinkButton runat="server" ID="LinkButton1" Text="Approve" OnClientClick="approveProperty()">
                               <span class="fa fa-check"></span> Approve 
                            </asp:LinkButton>

                            <asp:LinkButton runat="server" ID="LinkButton2" Text="Remove" OnClientClick="removeProperty()">
                               <span class="fa fa-trash"></span> Remove
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
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


</asp:Content>
