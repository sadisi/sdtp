﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="sdtp.HomePage" %>

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
                                        <button class="nav-link active" id="appartment-tab" data-bs-toggle="tab" data-bs-target="#appartment" type="button" role="tab" aria-controls="appartment" aria-selected="true">Appartment</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="Hostel-tab" data-bs-toggle="tab" data-bs-target="#Hostel" type="button" role="tab" aria-controls="Hostel" aria-selected="false">Hostel </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="House-tab" data-bs-toggle="tab" data-bs-target="#House" type="button" role="tab" aria-controls="House" aria-selected="false">House</button>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="appartment" role="tabpanel" aria-labelledby="appartment-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <li>Total Flat Space <span>185 m2</span></li>
                                                    <li>Floor number <span>3rd</span></li>
                                                    <li>Number of rooms <span>4</span></li>
                                                    <li>Parking Available <span>Yes</span></li>
                                                    <li>Payment Process <span>Bank</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <img src="assets/images/deal-01.jpg" alt="">
                                        </div>
                                        <div class="col-lg-3">
                                            <h4>Extra Info About Property</h4>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. 
                      <br>
                                                <br>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse
                                            </p>
                                            <div class="icon-button">
                                                <a href="property-details.aspx"><i class="fa fa-tag"></i>See more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Hostel" role="tabpanel" aria-labelledby="Hostel-tab">
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
                                            <img src="assets/images/deal-02.jpg" alt="">
                                        </div>
                                        <div class="col-lg-3">
                                            <h4>Detail Info About House</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.
                                                <br>
                                                <br>
                                                Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
                                            <div class="icon-button">
                                                <a href="property-details.html"><i class="fa fa-tag"></i>See more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="House" role="tabpanel" aria-labelledby="House-tab">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="info-table">
                                                <ul>
                                                    <li>Total Flat Space <span>320 m2</span></li>
                                                    <li>Floor number <span>3rd</span></li>
                                                    <li>Number of rooms <span>6</span></li>
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
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse.
                                                <br>
                                                <br>
                                                Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
                                            <div class="icon-button">
                                                <a href="property-details.html"><i class="fa fa-tag"></i>See more</a>
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
                        <h6>| Properties</h6>
                        <h2>We Provide The Best Property You Like</h2>
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
        <h4><a href="#x">${property.location}</a></h4> <!-- Change property name to 'location' -->
        <ul>
            <li>Description: <span>${property.description}</span></li>
            <!-- Add other details as needed -->
        </ul>
        <div class="main-button">
            <a href="property-details.html">See More</a>
        </div>
    </div>
</div>
`;
                    }

                    // Wait for the DOM to be fully loaded
                    document.addEventListener('DOMContentLoaded', function () {
                        var propertyContainer = document.getElementById('property-container');

                        // Loop through the properties and generate HTML for each one
                        propertyData.forEach(function (property) { // Change variable name to 'propertyData'
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
                                    zoom: 15,
                                    center: { lat: 6.820954288978381, lng: 80.04024112766886 },
                                    mapId: "DEMO_MAP_ID",
                                    mapTypeId: 'satellite',
                                });

                                // Array of locations
                                const locations = mapLocations; // Assuming mapLocations is the variable containing location details received from the backend

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
                                                   <img src="${location.imageUrl}" alt="Image 1" style="max-width: 100px; max-height: 100px;">
                                                   <span class="category">${location.category}</span>
                                                   <h6>Rs.${location.price}/=</h6>
                                                   <p>${location.description}</p><hr>
                                                   <div class="main-button"><center>
                                                   <a href="#">See More</a></center>
                                                   </div><hr>
                                                   <input type="text" id="input1" placeholder="Enter text">
                                                   <button class="map-button">Submit</button>
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
