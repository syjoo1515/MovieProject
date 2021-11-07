<%@page import="java.util.Date"%>
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


		<link rel="stylesheet" href="assets/css/style.css">
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


</style>
<script type="text/javascript">
	
	//날짜 구하는 함수
	function addDays(days){
		var dt=new Date(); //출력할 날짜
		var today=new Date();  //현재날짜&시간.
		dt.setDate(today.getDate()+days);
		var m=dt.getMonth()+1; //월은 0부터 시작해서 1 더해줘야함
		if(m<10){
			var month="0"+m;
		}else{
			var month=m;
		}
		
		var d=dt.getDate()-1; //하루 전꺼 검색
		if(d<10 && d>=0){
			var day="0"+d;
		} else{
			var day=d;
		}
		
		var year=dt.getFullYear();
		
		var result=year+""+month+""+day;
		var result2=year+"."+month+"."+day;
		return result+"#"+result2;
	}
	
	//왼쪽 화살표 클릭시
	var count=0;
	function clickLeftArrow(){
		count--;
		var searchDay=addDays(count);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	}
	
	//오른쪽 화살표 클릭시
	function clickRightArrow(){
		count++;
		if(count>0){
			alert("가장 최근 날짜입니다");
			return false;
		}
		var searchDay=addDays(count);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	}
	
	 //페이지 로딩될 때-어제날짜 출력
	$(function(){
		var searchDay=addDays(0);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	});
	
	 
	//API파싱해서 데이터 가져오고, DB에서 포스터 정보 가져오는 함수
	function showBoxoffice(day, day2){
		//상단에 조회 날짜 출력
		$("font#today").html(day2+" 박스오피스 순위");
		$("li.active").html(day2+" 박스오피스 순위");
		
		$.ajax({
			url:"https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=12ff9134153dd158e068074390244746&targetDt="+day,
			dataType:"json",
			success:function(v){
				var movieData=v["boxOfficeResult"]["dailyBoxOfficeList"];
				//반복문 돌려서 데이터 10개 모두 출력함
				var temp="";
				$.each(movieData,function(index,value){
					//console.log(value.movieCd);
					var moviecode=value.movieCd;
						$.ajax({ //영화코드에 맞는 포스터 가져옴
							url:"searchMovieByCd.do",
							data:{movieCd : value.movieCd},
							success:function(v){
								//console.log(v.poster);
								$("#img"+index).attr("src",v.poster);
							}
						});
						temp+="<div class=\"col-md-3 m-top-40\">";
						temp+="<div class=\"blog_item m-top-30\">";
						temp+="<div class=\"blog_item_img\"  style=\"margin: auto;  text-align: center;\">";
						temp+="<img id=\"img"+index+"\"  src=\"\" alt=\"\" / width=\"200\" style=\"cursor:pointer;\"  onclick=\"clickMoviePoster("+value.movieCd+")\">";
						temp+="</div>";
						temp+="<div class=\"m-l-30\">";
						temp+="<ol class=\"breadcrumb\">";
						temp+="<li><a href=\"#\" class=\"text-black\">"+value.rank+"위</a></li>";
						temp+="<li><a href=\"#\" class=\"text-black\">개봉일:"+value.openDt+"</a></li>";
						temp+="</ol>";
						temp+="<h6>"+value.movieNm+"</h6>";
						temp+="<p class=\"m-top-20\">일일 관객수:"+value.audiCnt+"<br>누적 관객수:"+value.audiAcc+"</p>";
						temp+="</div>";
						temp+="</div>";
						temp+="</div>";
				$("div#dailyMovie"+index).html(temp);
				temp="";
				}); //반복문 종료
				
				
			},
			error:function(){
				alert("error!");
			}	
		});
		} //showBoxoffice
	
	//포스터 클릭시 상세정보로 이동
	function clickMoviePoster(movieCd){
			document.location.href="movieDetails.jsp?movieCd="+movieCd;
	}
	


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

            <section id="hello" class="model-banner bg-mega" style="height: 300px;">
                <div class="overlay"></div>
                <div class="container" style="height: 300px;">
                    <div class="row">
                        <div class="main_home text-center" style="padding-top: 130px;padding-bottom: 50px;">
                            <div class="model_text">
                                <h1 class="text-white text-uppercase">BOX OFFICE</h1>
                                <ol class="breadcrumb">
                                    <li class="active"><h3>Home</h3></li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->



            <!--Portfolio Section-->
            <section id="gallery" class="gallery margin-top-120 bg-white m-bottom-100">
                <!-- Portfolio container-->
                <div class="container">
                    <div class="row">
                        <div class="main-gallery main-model roomy-80">
                        <div style="margin: auto;  text-align: center;">
                        <img src="assets/images/left.png" alt="" width="25px" style="transform:translate(0%,-20%); cursor:pointer;"  onclick="clickLeftArrow()">
            		    <font class="m-bottom-40 m-l-15 m-r-15" id="today" style="color:#6f6f6f; font-size:20px; font-weight:bold;"></font>
            		    <img src="assets/images/right.png" alt="" width="25px" style="transform:translate(0%,-20%); cursor:pointer;" onclick="clickRightArrow()">
            		    </div>
<!-- 반복할 데이터 -->
							<c:forEach var="i" begin="0" end="9">
							<div id="dailyMovie${i}">
                            </div>
                           </c:forEach>
<!-- 여기서 데이터 출력  -->

                        </div>
                    </div>
                </div><!-- Portfolio container end -->
            </section><!-- End off portfolio section -->



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