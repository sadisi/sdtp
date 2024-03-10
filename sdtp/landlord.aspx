<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="landlord.aspx.cs" Inherits="sdtp.landlord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!--add property-->
    <div class="section best-deal">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>| Landlord</h6>
                        <h2>Add your new Property details </h2>
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
                                                    <li>Bedrooms: <span>
                                                        <asp:TextBox runat="server" ID="BedroomsTextBox" Placeholder="bedrooms count" /></span></li>
                                                    <li>Bathrooms: <span>
                                                        <asp:TextBox runat="server" ID="BathroomsTextBox" Placeholder="bathrooms count" /></span></li>
                                                    <li>Area: <span>
                                                        <asp:TextBox runat="server" ID="AreaTextBox" Placeholder="area " /></span></li>
                                                    <li>AC: <span>
                                                        <asp:TextBox runat="server" ID="ACTextBox" Placeholder="available or not" /></span></li>
                                                    <li>Your Location latitude : <span>
                                                        <asp:TextBox runat="server" ID="latitudeTextBox" Placeholder="latitude" /></span></li>
                                                    <li>Your Location longitude: <span>
                                                        <asp:TextBox runat="server" ID="longitudetextBox" Placeholder="longitude" /></span></li>

                                                </ul>

                                            
                                            </div>
                                        </div>

                                        <!--img-->
                                        <div class="col-lg-6">
                                            <label for="imageUpload">Select up to 5 images:</label>
                                            <asp:FileUpload runat="server" ID="imageUpload" Accept="image/*" Multiple="multiple" />
                                            <asp:Button runat="server" ID="btnUploadImages" Text="Upload Images" OnClientClick="return showSelectedImages();" />

                                            <div id="selectedImagesContainer">
                                                <img src="#" alt="" id="selectedImage" style="max-width: 10px; display: none;" />
                                            </div>

                                            <!-- Add hidden input field to store the image path -->
                                            <input type="hidden" runat="server" id="hiddenImagePath" />

                                            <script type="text/javascript">
                                                function showSelectedImages() {
                                                    var fileUpload = document.getElementById('<%= imageUpload.ClientID %>');
                                                    var selectedImage = document.getElementById('selectedImage');
                                                    var hiddenImagePath = document.getElementById('<%= hiddenImagePath.ClientID %>');

                                                    if (fileUpload.files.length > 0) {
                                                        // Assuming you want to display the first selected image
                                                        selectedImage.src = URL.createObjectURL(fileUpload.files[0]);
                                                        selectedImage.style.display = 'block';

                                                        // Update the hidden input field with the image path
                                                        hiddenImagePath.value = "path_to_uploaded_image_1"; // Update this with the actual image path
                                                    } else {
                                                        alert('Please select at least one image.');
                                                        return false; // Prevent form submission
                                                    }

                                                    return true; // Allow form submission
                                                }
                                            </script>
                                        </div>





                                        <!--img end-->




                    
                                        <div class="col-lg-3">
                                            <h4>Add Information About Property</h4>

                                            <div class="icon-button">
                                                <asp:TextBox runat="server" ID="PropertyDescriptionTextBox" TextMode="MultiLine" placeholder="Add property description" Rows="22" Columns="50"></asp:TextBox>
                                                <asp:LinkButton runat="server" ID="btnSubmitDescription" CssClass="btn-with-icon" OnClick ="landlordhstAdd_click">
                                              <i class="fa fa-save"></i> Post
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
        </div>
    </div>
    <!--add property end -->

    <!--previous property -->
    <div class="properties section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="section-heading text-center">
                        <h6>| Your previously add Properties</h6>

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
                            <li>Bedrooms: <span>6</span></li>
                            <li>Bathrooms: <span>5</span></li>
                            <li>Area: <span>450m2</span></li>
                            <li>AC: <span>No</span></li>
                        </ul>
                        <div class="main-button">
                            <a href="property-details.html"><i class="fa-solid fa-pen-to-square"></i>&nbsp Update</a>
                            <a href="property-details.html"><i class="fa-solid fa-trash"></i>&nbsp Delete</a>
                            <a href="property-details.html"><i class="fa-solid fa-circle-check"></i>&nbsp Save</a>
                        </div>



                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="item">
                        <a href="hostel-details.aspx">
                            <img src="assets/images/vilo.png" alt=""></a>
                        <span class="category">Hostel</span>
                        <h6>Rs.55000/=</h6>
                        <h4><a href="hostel-details.aspx">Pitipana, Homagama</a></h4>
                        <ul>
                            <li>Bedrooms: <span>6</span></li>
                            <li>Bathrooms: <span>5</span></li>
                            <li>Area: <span>450m2</span></li>
                            <li>AC: <span>No</span></li>
                        </ul>
                        <div class="main-button">
                            <a href="property-details.html"><i class="fa-solid fa-pen-to-square"></i>&nbsp Update</a>
                            <a href="property-details.html"><i class="fa-solid fa-trash"></i>&nbsp  Delete</a>
                            <a href="property-details.html"><i class="fa-solid fa-circle-check"></i>&nbsp Save</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <!--lanlord pp show 1-->
                </div>
                <div class="col-lg-4 col-md-6">
                    <!--lanlord pp show 2-->
                </div>


            </div>
        </div>
    </div>



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



</asp:Content>
