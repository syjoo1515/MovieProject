<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Fonts link-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">


        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/slick-theme.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/fonticons.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/bootsnav.css">


        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
   <body data-spy="scroll" data-target=".navbar-collapse">


        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->

                    <jsp:include page="navbar.jsp"></jsp:include>


            <!--Home Sections-->

            <section id="hello" class="service-banner bg-mega" style="height: 300px;">
                <div class="overlay"></div>
                <div class="container" style="height: 300px;">
                    <div class="row">
                        <div class="main_home text-center" style="padding-top: 130px;padding-bottom: 50px;">
                            <div class="about_text">
                                <h1 class="text-white text-uppercase">Service</h1>
                                <ol class="breadcrumb">
                                    <li><a href="#">Home</a></li>
                                    <li class="active"><a href="#">Service</a></li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
            
            


            <!--About Sections-->
            <section id="feature" class="sv_feature roomy-100">
                <div class="container">
                    <div class="row">
                        <div class="main_sv_feature">

                            <div class="col-md-12">
                                <!-- Head Title -->
                                <div class="head_title text-center">
                                    <h2>We are Pouseidon.</h2>
                                    <h5><em>With the waves from Ocean. Always love what we do and just do what we love</em></h5>
                                    <div class="separator_auto"></div>
                                </div><!-- End off Head Title -->

                                <div class="sv_feature_content wow fadeIn m-top-40 text-center fix">
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh 
                                        euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim 
                                        ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl 
                                        ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit
                                        in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
                                        luptatum zzril delenit augue duis dolore te feugaitam soluta nobis eleifend 
                                        option congue.</p>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="sv_feature_photo wow fadeIn m-top-60 text-center fix">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <div class="sv_feature_item sm-m-top-20">
                                                <img src="assets/images/s-team-img1.jpg" alt="" />
                                                <h6 class="m-top-20">Fashionista</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="sv_feature_item sm-m-top-20">
                                                <img src="assets/images/s-team-img2.jpg" alt="" />
                                                <h6 class="m-top-20">Model Photo</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="sv_feature_item sm-m-top-20">
                                                <img src="assets/images/s-team-img3.jpg" alt="" />
                                                <h6 class="m-top-20">Catwalk</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="sv_feature_item sm-m-top-20">
                                                <img src="assets/images/s-team-img4.jpg" alt="" />
                                                <h6 class="m-top-20">Advertisement</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section>

            <!--SV Service Section-->
            <section id="sv_service" class="sv_service bg-grey roomy-80">
                <div class="container">
                    <div class="row">
                        <div class="main_service">

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item">
                                    <h4><i class="fa fa-desktop"></i> Perfect Responsive</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item xs-m-top-40">
                                    <h4><i class="fa fa-diamond"></i> unique design</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item sm-m-top-40">
                                    <h4><i class="fa fa-bug"></i> clean & clear</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item m-top-40">
                                    <h4><i class="fa fa-cut"></i> Perfect Responsive</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item m-top-40">
                                    <h4><i class="fa fa-headphones"></i> Perfect Responsive</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                            <div class="col-md-4 col-sm-6">
                                <div class="sv_service_item m-top-40">
                                    <h4><i class="fa fa-bullhorn"></i> Perfect Responsive</h4>
                                    <p class="m-top-20">Quam putamusiana parum claram, anteposuerit litterarum formas humanitatis seacula 
                                        quarta decima et quinta decima. Eodem modo sollemnes</p>
                                </div>
                            </div><!-- End off col-md-4 -->

                        </div>
                    </div>
                </div>
            </section><!-- End off sv service section -->


            <!--Pricing Section-->
            <section id="pricing" class="pricing roomy-100 fix">
                <div class="container">
                    <div class="row">
                        <div class="main_pricing ">
                            <div class="col-md-12">
                                <div class="head_title m-bottom-30 sm-text-center">
                                    <h2>Table Price</h2>
                                    <h5><em>Here are some our pricing packet. Select your most suitable service.</em></h5>
                                    <div class="separator_left"></div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-6">
                                <div class="pricing_item text-center m-top-30">
                                    <div class="pricing_head p-top-30">
                                        <h3 class=""><sup>$</sup><span>29</span></h3>
                                        <p class="text-uppercase m-top-20">basic packet</p>
                                    </div>
                                    <hr />
                                    <div class="pricing_body bg-white">
                                        <ul>
                                            <li> 2 events</li>
                                            <li> 3 models available</li>
                                            <li> 5 days in use</li>
                                            <li> 1 studio</li>
                                            <li> Limited support</li>
                                        </ul>
                                        <div class="pricing_btn m-top-40">
                                            <a href="" class="btn btn-primary">register <i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-3 -->

                            <div class="col-md-3 col-sm-6">
                                <div class="pricing_item m-top-30 text-center">
                                    <div class="pricing_top_border"></div>
                                    <div class="pricing_head p-top-30">
                                        <h3 class=""><sup>$</sup><span>42</span></h3>
                                        <p class="text-uppercase m-top-20">standard packet</p>
                                    </div>
                                    <hr />
                                    <div class="pricing_body bg-white">
                                        <ul>
                                            <li> 5 events</li>
                                            <li> 8 models available</li>
                                            <li> 10 days in use</li>
                                            <li> 2 studio</li>
                                            <li> Limited support</li>
                                        </ul>
                                        <div class="pricing_btn m-top-40">
                                            <a href="" class="btn btn-primary">register <i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-3 -->

                            <div class="col-md-3 col-sm-6">
                                <div class="pricing_item m-top-30 text-center">
                                    <div class="pricing_head p-top-30">
                                        <h3 class=""><sup>$</sup><span>69</span></h3>
                                        <p class="text-uppercase m-top-20">premium packet</p>
                                    </div>
                                    <hr />
                                    <div class="pricing_body bg-white">
                                        <ul>
                                            <li> 10 events</li>
                                            <li> 15 models available</li>
                                            <li> 20 days in use</li>
                                            <li> 2 studio</li>
                                            <li> Premium support</li>
                                        </ul>
                                        <div class="pricing_btn m-top-40">
                                            <a href="" class="btn btn-primary">register <i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-3 -->

                            <div class="col-md-3 col-sm-6">
                                <div class="pricing_item m-top-30 text-center">
                                    <div class="pricing_head p-top-30">
                                        <h3 class=""><sup>$</sup><span>99</span></h3>
                                        <p class="text-uppercase m-top-20">business packet</p>
                                    </div>
                                    <hr />
                                    <div class="pricing_body bg-white">
                                        <ul>
                                            <li> 15 events</li>
                                            <li> 20 models available</li>
                                            <li> 30 days in use</li>
                                            <li> 5 studio</li>
                                            <li> Unlimited support</li>
                                        </ul>
                                        <div class="pricing_btn m-top-40">
                                            <a href="" class="btn btn-primary">register <i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End off col-md-3 -->

                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Pricing section -->





            <!--Company section-->

            <section id="company" class="company bg-light">
                <div class="container">
                    <div class="row">
                        <div class="main_company roomy-100 text-center">
                            <h3 class="text-uppercase">pouseidon.</h3>
                            <p>7th floor - Palace Building - 221b Walk of Fame - London- United Kingdom</p>
                            <p>(+84). 123. 456. 789  -  info@poiseidon.lnk</p>
                        </div>
                    </div>
                </div>
            </section>


            <!-- scroll up-->
            <div class="scrollup">
                <a href="#"><i class="fa fa-chevron-up"></i></a>
            </div><!-- End off scroll up -->


            <footer id="footer" class="footer bg-mega">
                <div class="container">
                    <div class="row">
                        <div class="main_footer p-top-40 p-bottom-30">
                            <div class="col-md-6 text-left sm-text-center">
                                <p class="wow fadeInRight" data-wow-duration="1s">
                                    Made with 
                                    <i class="fa fa-heart"></i>
                                    by 
                                    <a target="_blank" href="http://bootstrapthemes.co">Bootstrap Themes</a> 
                                    2016. All Rights Reserved
                                </p>
                            </div>
                            <div class="col-md-6 text-right sm-text-center sm-m-top-20">
                                <ul class="list-inline">
                                    <li><a href="">Facebook</a></li>
                                    <li><a href="">Twitter</a></li>
                                    <li><a href="">Instagram</a></li>
                                    <li><a href="">Pinterest</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>




        </div>

        <!-- JS includes -->

        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.js"></script>
        <script src="assets/js/jquery.easing.1.3.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/jquery.collapse.js"></script>
        <script src="assets/js/bootsnav.js"></script>


        <!-- paradise slider js -->

        <!--
                <script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
                <script src="assets/js/gmaps.min.js"></script>
        
                <script>
                    function showmap() {
                        var mapOptions = {
                            zoom: 8,
                            scrollwheel: false,
                            center: new google.maps.LatLng(-34.397, 150.644),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
                        $('.mapheight').css('height', '350');
                        $('.maps_text h3').hide();
                    }
        
                </script>-->





        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>