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


            <nav class="navbar navbar-default navbar-fixed white no-background bootsnav text-uppercase">
                <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->

                <div class="container">    

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="index.html">

                            <img src="assets/images/logo.png" class="logo logo-display" alt="">
                            <img src="assets/images/logo-black.png" class="logo logo-scrolled" alt="">

                        </a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                            <li><a href="home.jsp">home</a></li> 
							<li><a href="aboutus.jsp">about</a></li> 							                   
                            <li><a href="boxOffice.jsp">박스오피스</a></li> 							
                            <li><a href="#">영화 검색</a></li>                                    
                            <li><a href="login.jsp">로그인</a></li>  
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>  


            </nav>


            <!--Home Sections-->

            <section id="hello" class="blog-banner bg-mega">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="about_text">
                                <h1 class="text-white text-uppercase">영화 검색</h1>
                                <ol class="breadcrumb">
                                    <li class="active">영화 제목을 검색하여주시길 바랍니다</li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->


            <!--Blog Features Section-->
            <section id="blog_fashion" class="blog_fashion roomy-100">
                <div class="container">
                    <div class="row">
                        <div class="main_blog_fashion">
                            <div class="col-md-8">
                                <div class="blog_fashion_left">
                                    <div class="blog_fashion_img">
                                        <img src="assets/images/fashion-img1.jpg" alt="" />
                                    </div>
                                    <div class="blog_fashion_content">
                                        <ol class="breadcrumb">
                                            <li><a href="#" class="text-black">Fashion</a></li>
                                            <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                            <li><a href="#" class="text-black">2 comments</a></li>
                                        </ol>
                                        <a href="blog-details.html"><h2>International Fashion week 2015</h2></a>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
                                            nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. 
                                            Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper 
                                            suscipit lobortis nisl aliquip commodo consequat.Duis autem vel 
                                            eum iriure dolor...</p>


                                        <a href="blog-details.html" class="btn btn-default m-top-20"> Read More <i class="fa fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="blog_fashion_right">
                                    <div class="fashion_test text-center">
                                        <img class="img-circle" src="assets/images/blog-test-img1.jpg" alt="" />

                                        <h6 class="m-top-20">Pouseidon - From OCean</h6>
                                        <p class="m-top-20">With the waves from somewhere so far. 
                                            We comes with elegants and beautiful. 
                                            Just do what we love and always love what we do</p>
                                        <img class="m-top-20" src="assets/images/blog-sign.png" alt="" />
                                    </div>

                                    <div class="fashion_praspect m-top-40">
                                        <div class="fashion_praspect_inner bg-black">
                                            <p class="text-white">Good design is making something intelligible and memorable. 
                                                Great design is making something memorable and meaningful.</p>
                                            <p class="text-white">_ Dieter Rams</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div><!-- End off row -->

                    <hr />

                    <div class="row">
                        <div class="blog_area fix">
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/1.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/2.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/3.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/4.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/5.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/6.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/7.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/8.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                            <div class="col-md-4">
                                <div class="blog_item m-top-30">
                                    <div class="blog_item_img">
                                        <img src="assets/images/blog/9.jpg" alt="" />
                                    </div>
                                    <ol class="breadcrumb">
                                        <li><a href="#" class="text-black">Fashion</a></li>
                                        <li><a href="#" class="text-black">Feb 28th 2015</a></li>
                                    </ol>
                                    <h5>Street Girl with skate</h5>
                                    <p class="m-top-20">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                                        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat....</p>
                                </div>
                            </div><!-- End off col-md-4 -->
                        </div>
                    </div>

                </div><!-- End off container -->
            </section><!-- End off blog Fashion -->



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
        <script src="assets/js/masonry.min.js"></script>
        
        <script type="text/javascript">
            var msnry = new Masonry('.blog_area');
        </script>
        
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>