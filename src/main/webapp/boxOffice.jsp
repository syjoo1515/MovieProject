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
	
	//?????? ????????? ??????
	function addDays(days){
		var dt=new Date(); //????????? ??????
		var today=new Date();  //????????????&??????.
		dt.setDate(today.getDate()+days);
		var m=dt.getMonth()+1; //?????? 0?????? ???????????? 1 ???????????????
		if(m<10){
			var month="0"+m;
		}else{
			var month=m;
		}
		
		var d=dt.getDate()-1; //?????? ?????? ??????
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
	
	//?????? ????????? ?????????
	var count=0;
	function clickLeftArrow(){
		count--;
		var searchDay=addDays(count);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	}
	
	//????????? ????????? ?????????
	function clickRightArrow(){
		count++;
		if(count>0){
			alert("?????? ?????? ???????????????");
			return false;
		}
		var searchDay=addDays(count);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	}
	
	 //????????? ????????? ???-???????????? ??????
	$(function(){
		var searchDay=addDays(0);
		showBoxoffice(searchDay.split("#")[0], searchDay.split("#")[1]);
	});
	
	 
	//API???????????? ????????? ????????????, DB?????? ????????? ?????? ???????????? ??????
	function showBoxoffice(day, day2){
		//????????? ?????? ?????? ??????
		$("font#today").html(day2+" ??????????????? ??????");
		$("li.active").html(day2+" ??????????????? ??????");
		
		$.ajax({
			url:"https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=12ff9134153dd158e068074390244746&targetDt="+day,
			dataType:"json",
			success:function(v){
				var movieData=v["boxOfficeResult"]["dailyBoxOfficeList"];
				//????????? ????????? ????????? 10??? ?????? ?????????
				var temp="";
				$.each(movieData,function(index,value){
					//console.log(value.movieCd);
					var moviecode=value.movieCd;
						$.ajax({ //??????????????? ?????? ????????? ?????????
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
						temp+="<div>";
						temp+="<img id=\"img"+index+"\"  src=\"\" alt=\"\" / width=\"200\" style=\"cursor:pointer;\"  onclick=\"clickMoviePoster("+value.movieCd+")\">";
						temp+="</div>";
						temp+="<div>";
						temp+="<ol class=\"breadcrumb\">";
						temp+="<li><a href=\"movieDetails.jsp?movieCd="+value.movieCd+"\" class=\"text-black\">"+value.rank+"???</a></li>";
						temp+="<li><a href=\"movieDetails.jsp?movieCd="+value.movieCd+"\" class=\"text-black\">?????????:"+value.openDt+"</a></li>";
						temp+="</ol>";
						temp+="<h6>"+value.movieNm+"</h6>";
						temp+="<p class=\"m-top-20\">?????? ?????????:"+value.audiCnt+"<br>?????? ?????????:"+value.audiAcc+"</p>";
						temp+="</div>";
						temp+="</div>";
						temp+="</div>";
						temp+="</div>";
				$("div#dailyMovie"+index).html(temp);
				temp="";
				}); //????????? ??????
				
				
			},
			error:function(){
				alert("error!");
			}	
		});
		} //showBoxoffice
	
	//????????? ????????? ??????????????? ??????
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
<!-- ????????? ????????? -->
							<c:forEach var="i" begin="0" end="9">
							<div id="dailyMovie${i}">
                            </div>
                           </c:forEach>
<!-- ????????? ????????? ??????  -->

                        </div>
                    </div>
                </div><!-- Portfolio container end -->
            </section><!-- End off portfolio section -->



		<!--footer section-->
		<jsp:include page="footer.jsp"></jsp:include>

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