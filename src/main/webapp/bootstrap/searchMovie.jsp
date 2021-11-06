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
						console.log(v);
							var temp="";
							temp+="<h6 class=\"m-bottom-40 text-uppercase\">총 "+v.length+"개의 검색결과가 있습니다</h6>";
							
							$.each(v,function(index,value){ //검색된 데이터 반복문 통해 출력
							//console.log(value.movieCd);
							$.ajax({  //로그인한 id와 출력된 movieCd를 가지고 likemovie DB에 데이터 있는지 확인 (있으면 빨간하트, 없으면 빈하트)
								url:"likeMovieSearch.do",
								data:{id:"${sessionScope.id}", movieCd: value.movieCd},
								success:function(v){
									//console.log(v);
									if(v==value.movieCd){
										$("#img"+value.movieCd).attr("src", "assets/images/heart-fill.png");
									}
								}
							});
                            temp+="<div class=\"post_item\">";
                            temp+="<div class=\"item_img\">";
                            temp+="<img src=\""+value.poster+"\" alt=\"\"/ width=\"150px\">";
                            temp+="</div>";
                            temp+="<div class=\"item_text\" style=\"margin-top\:20px;\">";
                            temp+="<h6>"+value.movieNm+"</h6>";
                            temp+="<p style=\"margin-bottom\:2px;\"><i class=\"fa fa-clock-o\"></i> 개봉일:"+value.openDt+"</p>";
                            temp+="<p>유형:"+value.typeNm+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp장르: "+value.genreAlt+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 제작국가:"+value.nationAlt+"</p>";
                          	temp+="<p></p>";
                          	temp+="<p></p>";
                          	temp+="<span style=\"cursor:pointer\" onclick=\"clickHeart("+value.movieCd+")\" margin=\"10px\"><font size=\"3px\" >찜하기</font>&nbsp<img id=\"img"+value.movieCd+"\" src=\"assets/images/heart.png\" alt=\"\" width=\"20px\"></span><div style=\"margin-top\:3px;\"></div>";
                          	temp+="<span style=\"cursor:pointer\" onclick=\"clickInfo("+value.movieCd+")\"><font size=\"3px\" >상세정보 바로가기</font>&nbsp<img src=\"assets/images/box-arrow-in-right.svg\" alt=\"\" width=\"20px\"></span>";
                            
                          	temp+="</div>";
                            temp+="</div>";
							
						});
							$("#searchTitleResult").html(temp);
					}
				});
			}
		});
	});
	
	//하트 클릭시
	function clickHeart(movieCd){
		if(${sessionScope.id==null||sessionScope.password==null}){
			alert("로그인 후 이용해 주세요");
			document.location.href="login.jsp";
		}else{
			if(($("#img"+movieCd).attr("src"))=="assets/images/heart.png"){ //빈 하트이면 likemoive에 inert하고 빨간하트로
				$.ajax({
					url:"likeMovieInsert.do",
					data:{id:"${sessionScope.id}", movieCd:movieCd},
					success:function(v){
						$("#img"+movieCd).attr("src", "assets/images/heart-fill.png");
						
					}
				});				
			}else{ //빨간하트면 likemovie에서 값 지우고 빈하트로
				$.ajax({
					url:"likeMovieDelete.do",
					data:{id:"${sessionScope.id}", movieCd:movieCd},
					success:function(v){
						$("#img"+movieCd).attr("src", "assets/images/heart.png");
					}
				});
				
			}
		}
	}
	
	//상세정보 클릭시
	function clickInfo(movieCd){
			document.location.href="movieDetails.jsp?movieCd="+movieCd;

	}
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
                        <div class="main_home text-center" style="padding-top: 130px; padding-bottom: 50px;">
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
            <section id="blog_fashion" class="blog_fashion roomy-100 ">
                <div class="container ">
                    <div class="row">
                    <input type="text" name="title" id="searchTitleInput" tabindex="2" class="form-control30" placeholder="검색하려는 영화 제목을 입력해 주세요" value="" style="height: 28px;">
					<button type="button" class="btn btn-dark" id="searchTitleButton">검색</button> <span id="checkSearchTitle"></span>
                    <div class="row">
                        <div class="main-gallery main-model">
            		    <h4 id="today"></h4>
            		    
            		            <div class="said_post fix m-top-70">
                                    <h4 class="m-bottom-40 text-uppercase">검색결과</h4>
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
        

        
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>