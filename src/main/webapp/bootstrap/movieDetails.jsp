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
<style type="text/css">
.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
}
</style>

<script type="text/javascript">

//파라미터에 있는 영화코드 정규식을 이용해서 가져오는 함수(구글링해서 긁어옴)
	function getParameterByName(name) { 
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
		results = regex.exec(location.search); 
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
		}
	var movieCd=getParameterByName("movieCd");

	$(function(){
		$.ajax({
			url:"searchMovieByCd.do",
			data:{movieCd : movieCd},
			success:function(v){
				var poster=(v.poster).split("thumb_x192/thn_");
				if(poster[1]==null){
					$("#poster").attr("src",poster[0]);
				}else{
					$("#poster").attr("src",poster[0]+poster[1]);
				}
				$("#movieNm").html(v.movieNm);
				$("#openDt").html(v.openDt);
				$("#typeNm").html(v.typeNm);
				$("#nationAlt").html(v.nationAlt);
				$("#genreAlt").html(v.genreAlt);
				$("#peopleNm").html(v.peopleNm);
				$("#genreAlt").html(v.genreAlt);
				$("#discrip").html(v.discrip);
			}
		});
		
		$("#movieCd").val(movieCd);
		
	});
	var count=0;
	function clickStar(number){
		if($("#"+number).attr("src")=="assets/images/star-fill.png"){
			count--;
			$("#"+number).attr("src","assets/images/star.png")
		}else{
			count++;
			$("#"+number).attr("src","assets/images/star-fill.png")
		}
		$("#countStar").val(count);
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
                        <div class="main_home text-center" style="padding-top: 130px;padding-bottom: 50px;">
                            <div class="about_text">
                                <h1 class="text-white text-uppercase">영화 상세정보</h1>
                                <ol class="breadcrumb">
                                    <li class="active"></li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
            
            

            <!--Model Details Section-->
            <section id="m_details" class="m_details roomy-100 fix">
                <div class="container">
                    <div class="row">
                        <div class="main_details">
                            <div class="col-md-6">
                                <div class="m_details_img">
                                    <img id="poster" src="assets/images/angela-img.jpg" alt="" width="400px"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="m_details_content m-bottom-40">
                                    <h2 id="movieNm">Angela Baby</h2>
                                    <p id=discrip></p>
                                </div>
                                <hr />
                                <div class="person_details m-top-40">
                                    <div class="row">
                                        <div class="col-md-5 text-left">

                                            <p>개봉일:</p>
                                            <p>영화 유형:</p>
                                            <p>영화 장르:</p>
                                            <p>영화 감독:</p>
                                            <p>제작 국가:</p>
                                        </div>
                                        <div class="col-md-7 text-left">
                                            <p id="openDt"></p>
                                            <p id="typeNm"></p>
                                            <p id="genreAlt"></p>
                                            <p id="peopleNm"></p>
                                            <p id="nationAlt"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End off row -->
                </div> <!-- End off container -->
            </section> <!-- End off Model Details Section -->


            <!--리뷰작성-->
            <section id="contact" class="contact fix bg-grey ">
                <div class="container ">
                    <div class="row">
                        <div class="main_contact p-top-100 p-bottom-100">
	                    <div class="said_post">
	                        <h4 class="m-bottom-40  m-l-30 text-uppercase">리뷰 작성하기</h4>
	                        </div>
                            <div class="col-md-6 sm-m-top-30">
                                <form class="" action="reviewForm.do">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group"> 
                                                <label>제목</label>
                                                <input id="first_name" name="title" type="text" class="form-control" required="">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group" style="margin-left:100px"> 
                                                <label>평점</label>
                                                <div>
                                                <img alt="" src="assets/images/star.png" width="20px" style="cursor:pointer" id="1" onclick="clickStar(1)">
                                                <img alt="" src="assets/images/star.png" width="20px" style="cursor:pointer" id="2" onclick="clickStar(2)">
                                                <img alt="" src="assets/images/star.png" width="20px" style="cursor:pointer" id="3" onclick="clickStar(3)">
                                                <img alt="" src="assets/images/star.png" width="20px" style="cursor:pointer" id="4"  onclick="clickStar(4)">
                                                <img alt="" src="assets/images/star.png" width="20px" style="cursor:pointer" id="5" onclick="clickStar(5)">
                                                <input id="countStar" name="grade" type="hidden" class="form-control" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="noresize"> 
                                                <label>내용</label>
                                                <div><textarea name="contents" class="noresize" rows="10" style="width:700px"></textarea></div>
                                            </div>
                                            <input type="hidden" name="id" value="${sessionScope.id}">
                                            <input type="hidden" name="movieCd" value="" id="movieCd">
                                            <div class="form-group">
                                                <a href="" class="btn btn-default">리뷰 작성<i class="fa fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>



                        </div>
                    </div><!--End off row -->
                </div><!--End off container -->
            </section><!--End off Contact Section-->
            
            
          <!--리뷰보기-->
            <section id="contact" class="contact fix">
                <div class="container ">
                    <div class="row">
                        <div class="main_contact p-top-100 p-bottom-100">
	                    <div class="said_post">
	                        <h4 class="m-bottom-40 m-l-30 text-uppercase">리뷰 보기</h4>
	                        </div>
                            <div class="sm-m-top-30">
                                <form class="" action="subcribe.php">
                                    <div class="row">
                                        
										<div class="panel-body">
											<table class="table table-bordered table-list">
												<tbody>
													<tr>
														<td class="hidden-xs" style="width:20%;">아이디</td>
														<td>${sessionScope.id}</td>
													</tr>
													<tr>
														<td class="hidden-xs">닉네임</td>
														<td id="username"></td>
													</tr>
													<tr>
														<td class="hidden-xs">전화번호</td>
														<td id="phone"></td>
													</tr>
													<tr>
														<td class="hidden-xs">Email</td>
														<td id="email"></td>
													</tr>
													<tr>
														<td class="hidden-xs">가입일</td>
														<td id="regdate"></td>
													</tr>
													<tr>
														<td class="hidden-xs">정보 수정</td>
														<td>Password : <input type="password" name="password"
															id="modInfoInput" tabindex="2" class="form-control30"
															placeholder="비밀번호를 입력해주세요" value="" style="height: 28px;">
															<button type="button" class="btn btn-dark"
																id="modInfoButton">정보 수정</button> <span id="checkModinfoPw"></span></td>
													</tr>

												</tbody>
											</table>
										</div>


                                    </div>

                                </form>
                            </div>



                        </div>
                    </div><!--End off row -->
                </div><!--End off container -->
            </section><!--End off Contact Section-->


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