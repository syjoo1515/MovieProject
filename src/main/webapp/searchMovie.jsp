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
#movieImg, #directorImg, #actorImg{
	transform:translate(0%,-20%);  
	margin-right: 10px; 
	visibility: hidden;
}

#movieFont, #directorFont, #actorFont{
	color: #e5e5e5; 
	font-weight: bold;
	font-size:24px;
}

/* ?????? css */
fieldset {
  position: relative;
  display: inline-block;
  padding: 0 0 0 40px;
  background: #fff;
  border:solid 1.5px #ee997b;
  border-radius: 6px;
}

input,
button {
  position: relative;
  width: 350px;
  height: 50px;
  padding: 0;
  display: inline-block;
  float: left;
}

input {
	/*  background-color:grey;*/
	font-size: 18px;
  color: #666;
  z-index: 2;
  border: 0 none;
}
input:focus {
  outline: 0 none;
}
input:focus + button {
  -webkit-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
          transform: translate(0, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}
input:focus + button .fa {
  -webkit-transform: translate(0px, 0);
      -ms-transform: translate(0px, 0);
          transform: translate(0px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  color: #fff;
}

button {
  z-index: 1;
  width: 50px;
  border: 0 none;
  background: #ee997b;
  cursor: pointer;
  padding:1.5px;
  border-radius: 0 5px 5px 0;  
  -webkit-transform: translate(-50px, 0);
      -ms-transform: translate(-50px, 0);
          transform: translate(-50px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}

.fa-search {
  font-size: 1.4rem;
  color: #ee997b;
  /* z-index: 3; */
  top: 25%;
  -webkit-transform: translate(-340px, 0);
      -ms-transform: translate(-340px, 0);
          transform: translate(-340px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  -webkit-transition: all 0.1s ease-in-out;
          transition: all 0.1s ease-in-out;
}


</style>

<script type="text/javascript">

	$(function(){
		//??????????????? ?????? ?????????
		$("#movieBtn").click(function(){
			$("#movieImg").css("visibility","visible");
			$("#directorImg").css("visibility","hidden");
			$("#actorImg").css("visibility","hidden");
			$("#movieFont").css("color","#ee997b");
			$("#directorFont").css("color","#e5e5e5");
			$("#actorFont").css("color","#e5e5e5");
		});
		//??????????????? ?????? ?????????
		$("#directorBtn").click(function(){
			$("#movieImg").css("visibility","hidden");
			$("#directorImg").css("visibility","visible");
			$("#actorImg").css("visibility","hidden");
			$("#movieFont").css("color","#e5e5e5");
			$("#directorFont").css("color","#ee997b");
			$("#actorFont").css("color","#e5e5e5");
		});
		//??????????????? ?????? ?????????
		$("#actorBtn").click(function(){
			$("#movieImg").css("visibility","hidden");
			$("#directorImg").css("visibility","hidden");
			$("#actorImg").css("visibility","visible");
			$("#movieFont").css("color","#e5e5e5");
			$("#directorFont").css("color","#e5e5e5");
			$("#actorFont").css("color","#ee997b");
		});
		//???????????? ?????????
		$("#saerchTitleBtn").click(function(){
			if($("#movieImg").css("visibility")=="visible"){
				clickSearch("movie");
			}else if($("#directorImg").css("visibility")=="visible"){
				clickSearch("director");
			}else if($("#actorImg").css("visibility")=="visible"){
				clickSearch("actor");
			}
		});
	});
	
	
	
	//???????????? ??????
	function clickSearch(btn){
			if($("#searchTitleInput").val().length==0){
				$("#checkSearchTitle").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp??????????????? ?????? ????????? ??????????????????</font>");
				return false;
			}
			else{
				var inputText=encodeURI($('#searchTitleInput').val());
				var url="";
				if(btn == "movie"){
					url="searchMovie.do";
				}else if(btn == "director"){
					url="searchDirector.do";
				}else if(btn== "actor"){
					url="searchActor.do";
				}
					var temp="";
				$.ajax({
					url:url,
					data:{title: inputText},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType:"json",
					success:function(v){
						console.log(v);
							temp+="<h6 class=\"m-bottom-40 text-uppercase\">??? "+v.length+"?????? ??????????????? ????????????</h6>";
							$.each(v,function(index,value){ //????????? ????????? ????????? ?????? ??????
							$.ajax({  //???????????? id??? ????????? movieCd??? ????????? likemovie DB??? ????????? ????????? ?????? (????????? ????????????, ????????? ?????????)
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
                            temp+="<p style=\"margin-bottom\:2px;\"><i class=\"fa fa-clock-o\"></i> ?????????:"+value.openDt+"</p>";
                            temp+="<p>??????:"+value.typeNm+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp??????: "+value.genreAlt+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ????????????:"+value.nationAlt+"</p>";
                          	temp+="<p></p>";
                          	temp+="<p></p>";
                          	temp+="<span style=\"cursor:pointer\" onclick=\"clickHeart("+value.movieCd+")\" margin=\"10px\"><font size=\"3px\" >?????????</font>&nbsp<img id=\"img"+value.movieCd+"\" src=\"assets/images/heart.png\" alt=\"\" width=\"20px\"></span><div style=\"margin-top\:3px;\"></div>";
                          	temp+="<span style=\"cursor:pointer\" onclick=\"clickInfo("+value.movieCd+")\"><font size=\"3px\" >???????????? ????????????</font>&nbsp<img src=\"assets/images/box-arrow-in-right.svg\" alt=\"\" width=\"20px\"></span>";
                          	temp+="</div>";
                            temp+="</div>";
						});
							$("#searchTitleResult").html(temp);
					}
				});
			}//else
	}
	
	//?????? ?????????
	function clickHeart(movieCd){
		if(${sessionScope.id==null||sessionScope.password==null}){
			alert("????????? ??? ????????? ?????????");
			document.location.href="login.jsp";
		}else{
			if(($("#img"+movieCd).attr("src"))=="assets/images/heart.png"){ //??? ???????????? likemoive??? inert?????? ???????????????
				$.ajax({
					url:"likeMovieInsert.do",
					data:{id:"${sessionScope.id}", movieCd:movieCd},
					success:function(v){
						$("#img"+movieCd).attr("src", "assets/images/heart-fill.png");
						
					}
				});				
			}else{ //??????????????? likemovie?????? ??? ????????? ????????????
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
	
	//???????????? ?????????
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
                                <h2 class="text-white text-uppercase">Search for movies</h2>
                                <ol class="breadcrumb">
                                    <li class="active"></li>
                                </ol>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->




            <!--Blog Features Section-->
            <section id="blog_fashion" class="blog_fashion roomy-100 ">
                <div class="container ">
                <div style="margin: auto;  text-align: center;">
                <span  id="movieBtn" style="margin-right: 50px; cursor:pointer;"><img id="movieImg" src="assets/images/checked.png" alt="" width="30px"/><font id="movieFont">??????????????? ??????</font></span>
                <span  id="directorBtn" style="margin-right: 50px; cursor:pointer;"><img id="directorImg" src="assets/images/checked.png" alt="" width="30px"/><font  id="directorFont">??????????????? ??????</font></span>
                <span  id="actorBtn" style="margin-right: 50px; cursor:pointer;"><img id="actorImg" src="assets/images/checked.png" alt="" width="30px"/><font  id="actorFont" size="5px">??????????????? ??????</font></span>
                    <div class="m-top-60">
					<fieldset><input type="text" name="title" id="searchTitleInput" placeholder="??????????????? ?????? ????????? ????????? ?????????"/><button type="submit" id="saerchTitleBtn"><i class="fa fa-search"></i></button></fieldset>
                  	<span id="checkSearchTitle"></span>
					</div>
                  </div>
                  
                    <div class="row">
                    <div class="row">
                        <div class="main-gallery main-model">
            		    <h4 id="today"></h4>
            		    <hr>
            		            <div class="said_post fix m-top-70">
                                  
                                     <div id="searchTitleResult">
<%--                                     <c:forEach var="i" begin="0" end="9">
                                    <div class="post_item">
                                        <div class="item_img">
                                            <img src="assets/images/s-post-img1.jpg" alt="" />
                                        </div>
                                        <div class="item_text">
                                            <h6>it???s been a long day without you</h6>
                                            <p><i class="fa fa-clock-o"></i>  July 20th, 2015</p>
                                        </div>
                                    </div>
                                    </c:forEach> --%>
                                    </div>
                                </div>

                        </div>
                    </div>
                    
                        
                    </div><!-- End off row -->

                    

                    <div class="row">
                        <div class="blog_area fix">
                            
                        </div>
                    </div>

                </div><!-- End off container -->
            </section><!-- End off blog Fashion -->


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
        <script src="assets/js/masonry.min.js"></script>
        

        
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>