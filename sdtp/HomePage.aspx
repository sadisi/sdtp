<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="sdtp.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!--best Deal start-->
    <div class="section best-deal">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>| Best Deal</h6>
                        <h2>Find Your Best Deal Right Now!</h2>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="tabs-content">
                        <div class="row">
                            <div class="nav-wrapper ">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="studentfeed-tab" data-bs-toggle="tab" data-bs-target="#studentfeed" type="button" role="tab" aria-controls="studentfeed" aria-selected="true">Send a Message</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="Hostel-tab" data-bs-toggle="tab" data-bs-target="#Hostel" type="button" role="tab" aria-controls="Hostel" aria-selected="false">Admin Article</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="House-tab" data-bs-toggle="tab" data-bs-target="#House" type="button" role="tab" aria-controls="House" aria-selected="false">Newly added</button>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="studentfeed" role="tabpanel" aria-labelledby="studentfeed-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <li>Email <span>
                                                        <asp:TextBox ID="emailTxtBox" runat="server" CssClass="input-field" placeholder="example@gmail.com"></asp:TextBox></span></li>
                                                    <li>Message<span><asp:TextBox ID="messageTxtBox" runat="server" CssClass="input-field" placeholder="Your message here..."></asp:TextBox></span></li>

                                                    <li>
                                                        <br>
                                                        <br>
                                                        <asp:Button ID="sendBtn" runat="server" Text="Send" CssClass="map-button" OnClick="FeedSendBtn_Click" />

                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <img src="assets/images/deal-01.jpg" alt="">
                                        </div>
                                        <div class="col-lg-3">
                                            <h4>Read This Instructions</h4>
                                            <p>
                                                Here you can see new hostels, apartments, houses, and accommodations. Also, at the bottom of the page, we provide a map to find accommodation locations. For further details, you can contact the landlords.
                                  You can add your messages here. these messages are send to the Landlord.  Follow these steps to send messages.
                                   <br>
                                                <hr>
                                                1. Enter your Hostel ID number. 
                                  <br>
                                                2. Enter your email.<br>
                                                3. Enter your message.<br>
                                                4. Click on send.
                                  <hr>
                                            </p>
                                            <div class="icon-button">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Hostel" role="tabpanel" aria-labelledby="Hostel-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <asp:Repeater ID="AdminArticlesRepeater" runat="server">
                                                        <ItemTemplate>
                                                            <li>
                                                                <p><%# Eval("admin_article") %></p>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <img src="assets/images/deal-02.jpg" alt="">
                                        </div>
                                        <div class="col-lg-3">
                                            <h4>Admin articles</h4>
                                            <p>
                                                Admin Aosts articles here to improve awareness about finding proper accommodations.
                                                <br>
                                                <br>
                                            </p>
                                            <div class="icon-button">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="House" role="tabpanel" aria-labelledby="House-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <li>Total Flat Space <span>250 m2</span></li>
                                                    <li>Floor number <span>2nd</span></li>
                                                    <li>Number of rooms <span>5</span></li>
                                                    <li>Parking Available <span>Yes</span></li>
                                                    <li>Payment Process <span>Bank</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <img src="assets/images/deal-03.jpg" alt="">
                                        </div>
                                        <div class="col-lg-3">
                                            <h4>Extra Info About House</h4>
                                            <p>
                                                Barnd new house . near to NSBM green University. Attch 5 bathrooms, 5 Bedrooms, 2 parking slots with 1 Garage. Also have a kitchen. AC and Normal Fans, Solar Powered System.
                                  <br>
                                                <b>location :&nbsp</b> Pitipana Homagama
                                  <br>
                                                <b>Contact US:&nbsp</b> +94 11256778
                                            </p>
                                            <div class="icon-button">
                                                <a href="#"><i class="fa fa-tag"></i>See more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--best Deal-->
    <!--hostel Grid-->
    <div class="properties section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="section-heading text-center">
                        <h6>| Hostels / Houses</h6>
                        <h2>We Provide The Best Hostels You Like</h2>
                    </div>
                </div>
            </div>
            <div class="row" id="property-container">



                <script>
                    // Function to generate HTML for each property
                    function generatePropertyHTML(property) {
                        return `
                             <div class="col-lg-4 col-md-6">
                             <div class="item">
                             <a href="#"><img src="${property.imageUrl}" alt=""></a>
                             <span class="category">${property.category}</span>
                             <h6>Rs.${property.price}/=</h6>
                             <h4><a href="#x">${property.location}</a></h4> 
                                <ul>
                                   <li>Description: <br> <span>${property.description}</span></li>
                                    
                                </ul>
                                <ul>
                                <li>
                                   <asp:TextBox ID="messageBox" runat="server" placeholder="Enter message here..."></asp:TextBox>
                               </li>
          
                              </ui>
                                     <asp:Button ID="submitButton" runat="server" Text="Send"  class="map-button" />
                               <hr>
                               <div class="main-button">
                                 <a href="#">See more</a>
                                </div>
                                  </div>

                                </div>
                              `;
                    }


                    // Wait for the DOM to be fully loaded
                    document.addEventListener('DOMContentLoaded', function () {
                        var propertyContainer = document.getElementById('property-container');

                        // Loop through the properties and generate HTML for each one
                        propertyData.forEach(function (property) {
                            propertyContainer.innerHTML += generatePropertyHTML(property);
                        });
                    });
                </script>

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
