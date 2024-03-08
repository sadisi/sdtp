<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="sdtp.HomePage" %>
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
          <li><i class="fa fa-envelope"></i>hsotels@.com</li>
          <li><i class="fa fa-map"></i> Homagama, Sri Lanka</li>
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
                  <a href="#" class="logo">
                      <h1>HOSTELS</h1>
                  </a>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                    <li class="active">
                       <asp:LinkButton ID="HomePageBtn" Text="Home" runat="server" OnClick="HomePageBtn_Click"  />  </asp:LinkedButton>
                    </li>


                    <li>
                         <asp:LinkButton ID="Hostelsbtn" Text="Hostels" runat="server"  />  </asp:LinkedButton>
                    </li>

                    <li>
                         <asp:LinkButton ID="LinkButton2" Text="Property Details" runat="server"  />  </asp:LinkedButton>
                    </li>

                    <li>
                         <asp:LinkButton ID="ContactBtnUs" Text="Contact Us" runat="server"  />  </asp:LinkedButton>
                    </li>

                    <li>
                          <asp:LinkButton ID="LogOutBtn" Text="LogOut" runat="server" Visible="False"  />  </asp:LinkedButton>
                    </li>

                    <li>
                         <asp:LinkButton ID="LoginBtn" runat="server" OnClick="LoginBtn_Click" >
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

    <!--banner-->
    
  <div class="main-banner">
    <div class="owl-carousel owl-banner">
      <div class="item item-1">
        <div class="header-text">
          <span class="category">Homagama, <em>Sri Lanka</em></span>
          <h2>Hurry!<br> Get the best accomodaytions in town</h2>
        </div>
      </div>
      <div class="item item-2">
        <div class="header-text">
          <span class="category">Pitipana, <em>Sri Lanka</em></span>
          <h2>Be Quick!<br>Get the Best Hostel for you</h2>
        </div>
      </div>
      <div class="item item-3">
        <div class="header-text">
          <span class="category">School-Junction, <em>Sri Lanka</em></span>
          <h2>Get the highest level hostels near to the NSBM</h2>
        </div>
      </div>
    </div>
  </div>

  
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
                    <button class="nav-link" id="Hostel-tab" data-bs-toggle="tab" data-bs-target="#Hostel" type="button" role="tab" aria-controls="Hostel" aria-selected="false"> Hostel </button>
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
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. 
                      <br><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse</p>
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
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. <br><br>Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
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
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. <br><br>Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
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
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="hostel-details.aspx"><img src="assets/images/vilo.png" alt=""></a>
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
            </ul>
            <div class="main-button">
              <a href="property-details.html">See More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="hostel-details.aspx"><img src="assets/images/vilo.png" alt=""></a>
            <span class="category">Hostel</span>
            <h6>Rs.55000/=</h6>
            <h4><a href="hostel-details.aspx">Pitipana, Homagama</a></h4>
            <ul>
              <li>Bedrooms: <span>6</span></li>
              <li>Bathrooms: <span>5</span></li>
              <li>Area: <span>450m2</span></li>
              <li>Floor: <span>3</span></li>
              <li>Parking: <span>8 spots</span></li>
               <li>AC: <span>No</span></li>
            </ul>
            <div class="main-button">
              <a href="hostel-details.aspx">See More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="hostel-details.aspx"><img src="assets/images/vilo.png" alt=""></a>
            <span class="category">House</span>
            <h6>Rs.35000/=</h6>
            <h4><a href="property-details.html">Pitipana, Homagama</a></h4>
            <ul>
              <li>Bedrooms: <span>5</span></li>
              <li>Bathrooms: <span>4</span></li>
              <li>Area: <span>225m2</span></li>
              <li>Floor: <span>3</span></li>
              <li>Parking: <span>4 spots</span></li>
              <li>AC: <span>No</span></li>
            </ul>
            <div class="main-button">
              <a href="property-details.html">See More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="property-details.html"><img src="assets/images/vilo.png" alt=""></a>
            <span class="category">Apartment</span>
            <h6>Rs.58500/=</h6>
            <h4><a href="property-details.html"> School Junction,Homagama</a></h4>
            <ul>
              <li>Bedrooms: <span>4</span></li>
              <li>Bathrooms: <span>3</span></li>
              <li>Area: <span>125m2</span></li>
              <li>Floor: <span>1st</span></li>
              <li>Parking: <span>2 cars</span></li>
              <li>AC: <span>yes</span></li>
            </ul>
            <div class="main-button">
              <a href="property-details.html">See More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="property-details.html"><img src="assets/images/vilo.png" alt=""></a>
            <span class="category">Hostel</span>
            <h6>Rs.60000/=</h6>
            <h4><a href="property-details.html"> School Junction,Homagama</a></h4>
            <ul>
              <li>Bedrooms: <span>4</span></li>
              <li>Bathrooms: <span>4</span></li>
              <li>Area: <span>180m2</span></li>
              <li>Floor: <span>2nd</span></li>
              <li>Parking: <span>2 cars</span></li>
              <li>AC: <span>yes</span></li>
            </ul>
            <div class="main-button">
              <a href="property-details.html">See More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <a href="property-details.html"><img src="assets/images/vilo.png" alt=""></a>
            <span class="category">Apartment</span>
            <h6>Rs.35000/=</h6>
            <h4><a href="property-details.html"> School Junction,Homagama</a></h4>
            <ul>
              <li>Bedrooms: <span>3</span></li>
              <li>Bathrooms: <span>2</span></li>
              <li>Area: <span>165m2</span></li>
              <li>Floor: <span>1th</span></li>
              <li>Parking: <span>3 cars</span></li>
               <li>AC: <span>yes</span></li>
            </ul>
            <div class="main-button">
              <a href="property-details.html">See More</a>
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
