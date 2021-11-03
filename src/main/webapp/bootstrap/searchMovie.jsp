<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>

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
		$("#searchTitleButton").click(function(){
			if($("#searchTitleInput").val().length==0){
				$("#checkSearchTitle").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp검색하려는 영화 제목을 입력해주세요</font>");
			}
			else{
				var moviename=encodeURI($('#searchTitleInput').val());
				$.ajax({

					url:"searchMovie.do",
					data:{title: moviename},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType:"json",
					success:function(v){
						//console.log(v);
							var temp=""
							$.each(v,function(index,value){
								$.ajax({
									url:"searchMovieImg.do",
									data:{movieCd : value.movieCd},
									success:function(v){
										$("#img"+index).attr("src",v.poster);
									}
								});
								
							console.log(value.movieCd);
                            temp+="<div class=\"post_item\">";
                            temp+="<div class=\"item_img\">";
                            temp+="<img id=\"img"+index+"\" src=\"assets/images/s-post-img1.jpg\" alt=\"\" />";
                            temp+="</div>";
                            temp+="<div class=\"item_text\">";
                            temp+="<h6>"+value.movieNm+"</h6>";
                            temp+="<p><i class=\"fa fa-clock-o\"></i> 개봉일:"+value.openDt+"</p>";
                            temp+="<p>유형:"+value.typeNm+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp장르: "+value.genreAlt+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제작국가:"+value.nationAlt+"</p>";
                            temp+="</div>";
                            temp+="</div>";
							
						});
							$("#searchTitleResult").html(temp);
					}
				});
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
                    <input type="text" name="title" id="searchTitleInput" tabindex="2" class="form-control30" placeholder="검색하려는 영화 제목을 입력해 주세요" value="" style="height: 28px;">
					<button type="button" class="btn btn-dark" id="searchTitleButton">검색</button> <span id="checkSearchTitle"></span>
                    <div class="row">
                        <div class="main-gallery main-model roomy-80">
            		    <h4 id="today"></h4>
            		    
            		            <div class="said_post fix m-top-70">
                                    <h6 class="m-bottom-40 text-uppercase">검색결과</h6>
                                     <div id="searchTitleResult">
<%--                                     <c:forEach var="i" begin="0" end="9">
                                    <div class="post_item">
                                        <div class="item_img">
                                            <img src="assets/images/s-post-img1.jpg" alt="" />
                                        </div>
                                        <div class="item_text">
                                            <h6>it’s been a long day without you</h6>
                                            <p><i class="fa fa-clock-o"></i>  July 20th, 2015</p>
                                        </div>
                                    </div>
                                    </c:forEach> --%>
                                    </div>
                                </div>

                        </div>
                    </div>
                    
                        
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