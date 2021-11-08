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
			url:"randomPoster.do",
			success:function(v){
				console.log(v)
				var poster=v.split("thumb_x192/thn_");
				if(poster[1]==null){
					$("#randomPoster").attr("src",poster[0]);
				}else{
					$("#randomPoster").attr("src",poster[0]+poster[1]);
				}
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
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                    <div class="object"></div>
                </div>
            </div>
        </div>

        <!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->
                    <jsp:include page="navbar.jsp"></jsp:include>


            <!--Home Sections-->

            <section id="hello" class="home bg-mega"  style="height: 300px;">
                <div class="overlay"></div>
                <div class="container"  style="height: 300px;">
                    <div class="row">
                        <div class="main_home text-center"  style="padding-top: 130px; padding-bottom: 50px;">
                            <div class="home_text">
                                <h2 class="text-white text-uppercase">movie planet</h2>

                                <div class="separator"></div>

                                <h5 class=" text-uppercase text-white"><em>Your own memory of the movie.</em></h5>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->


            <!--About Sections-->
		<section id="feature" class="feature p-top-60">
			<div class="container">
				<div class="row">
					<div class="main_feature">

						<div class="col-md-6 m-top-60">
							<!-- Head Title -->
							<div class="head_title">
								<h2>기억을 공유하고 싶을 때</h2>
								<h5><em>MOVIE PLANET</em></h5>
								<div class="separator_left"></div>
							</div>
							
								<div class="feature_content wow fadeIn m-top-20">
                                    <p>무비플래닛은 2017년도 이후 제작된 영화들의 리뷰를 작성할 수 있는 사이트 입니다.<br>
                                     	다양한 영화의 리뷰와 별점을 확인할 수 있으며,<br>
                                     	 영화에 대한 자신의 기억을 여러 사용자들과 공유할 수 있습니다.</p>

                                    <p>Movie Planet is a site where you can write reviews of movies produced since 2017.<br>
										You can check reviews and scores of various movies,<br>
										 and share your memories of the movie with multiple users.</p>

                                    <div class="feature_btns m-top-30">
                                        <a href="searchMovie.jsp" class="btn btn-default text-uppercase">리뷰 작성하러 가기<i class="fa fa-long-arrow-right"></i></a>
                                    </div>
                                </div>
							<!-- End off Head Title -->
						</div>
                            <div class="col-md-6">
                                <div class="feature_photo sm-m-top-40 animated m-l-150" style="width:400px">
                                    <div class="photo_border"></div>
                                    <div class="feature_img">
                                        <img id="randomPoster" src="assets/images/feature-img.jpg" alt="" />
                                    </div>
                                </div>
                            </div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			<br /> <br /> <br />
		</section>



		<!--Company section-->

            <section id="company" class="company bg-light">
                <div class="container">
                    <div class="row">
                        <div class="main_company roomy-100 text-center">
                            <h3 class="text-uppercase">movie planet</h3>
                            <p>충남 아산시 배방읍 광장로 210 109동 1903호</p>
                            <p> 010. 6268. 3548  -  syjoo15@naver.com</p>
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
                                    Made by soyean with
                                    <a target="_blank" href="http://bootstrapthemes.co">Bootstrap Themes</a> 
                                </p>
                            </div>
                            <div class="col-md-6 text-right sm-text-center sm-m-top-20">
                                <ul class="list-inline">
                                    <li><a href="https://github.com/syjoo1515/MovieProject">GitHub</a></li>
                                    <li><a href="https://linen-ixora-1c1.notion.site/a1d437139e0d4e20a820d8e18c5ce2b5?v=47805801667a4fa59a872d01e452f301">Notion</a></li>
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



        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>