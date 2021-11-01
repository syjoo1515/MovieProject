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
		$.ajax({
			url:"http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12ff9134153dd158e068074390244746&itemPerPage=1&curPage="+1,
			dataType:'json',
			success:function(v){
				var movieinfo=v["movieListResult"]["movieList"][0];
					$("#movieCd").val(movieinfo.movieCd);
					$("#movieNm").val(movieinfo.movieNm);
					$("#movieNmEn").val(movieinfo.movieNmEn);
					$("#prdtYear").val(movieinfo.prdtYear);
					$("#openDt").val(movieinfo.openDt);
					$("#typeNm").val(movieinfo.typeNm);
					$("#nationAlt").val(movieinfo.nationAlt);
					$("#genreAlt").val(movieinfo.genreAlt);
					$("#peopleNm").val((movieinfo["directors"][0]).peopleNm);
					//$("#form").submit();

				//document.location.href="movieInsert.do";
			}
				
		});
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

            <section id="hello" class="blog-banner bg-mega" style="height: 300px;">
                <div class="overlay"></div>
                <div class="container" style="height: 300px;">
                    <div class="row">
                        <div class="main_home text-center" style="padding-top: 130px;padding-bottom: 50px;">
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
			 <div class="container">
				<div class="row">
					<h2>Stylish Search Box</h2>
			           <div id="custom-search-input">
			                            <div class="input-group col-md-12">
			                                <input type="text" class="  search-query form-control" placeholder="Search" />
			                                <span class="input-group-btn">
			                                    <button class="btn btn-danger" type="button">
			                                        <span class=" glyphicon glyphicon-search"></span>
			                                    </button>
			                                </span>
			                            </div>
			                        </div>
				</div>
			</div>
                    
				<form id="form" action="movieInsert.do">
                    <input type="hidden" id="movieCd" name="movieCd" value="">
                    <input type="hidden" id="movieNm" name="movieNm" value="">
                    <input type="hidden" id="movieNmEn" name="movieNmEn" value="">
                    <input type="hidden" id="prdtYear" name="prdtYear" value="">
                    <!-- <input type="hidden" id="openDt" name="openDt" value=""> -->
                    <input type="hidden" id="typeNm" name="typeNm" value="">
                    <input type="hidden" id="nationAlt" name="nationAlt" value="">
                    <input type="hidden" id="genreAlt" name="genreAlt" value="">
                    <input type="hidden" id="repNationNm" name="repNationNm" value="">
                    <input type="hidden" id="repGenreNm" name="repGenreNm" value="">
                   <!--  <input type="hidden" id="peopleNm" name="peopleNm" value=""> -->
                   <button type="submit" id="button">버튼</button>
                </form>
                    
                        
                    </div><!-- End off row -->

                    <hr />

                    <div class="row">
                        <div class="blog_area fix">
                            
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