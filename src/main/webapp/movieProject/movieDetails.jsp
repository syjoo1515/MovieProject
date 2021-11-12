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

#popupWriting, #showReview, #popupWritingUpdate{
	display: none;
}

#popupWriting, #popupWritingUpdate{
	width: 1000px;
	height: 600px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	z-index: 2;
	vertical-align:middle;
	margin:auto;
	border-radius: 10px;
 }


.backgroungGray{
    content: "";
    width: 100%;
    height: 100%;
    background: #00000054;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1;
}

</style>

<script type="text/javascript">

//파라미터에 있는 영화코드 정규식을 이용해서 가져오는 함수(구글링해서 긁어옴)
	function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { 
        	sval = temp[1]; 
        	}
    }
    return sval;
}
	var movieCd=getParam("movieCd");

	$(function(){
		//영화 상세정보 데이터 출력
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
				
				var actors=(v.actorsNm).split("#");
				var actor="";
				if(actors.length<5){
					$.each(actors,function(index,value){
						actor+=value+", "
					});
					actor=actor.substring(0,actor.length-4); //-4한 이유: split("#")를 하면서 아무것도 없는 인자가 하나 들어가서 -2가 아닌 -4임
				}else{
					actor=actors[0]+", "+actors[1]+", "+actors[2]+", "+actors[3]+", "+actors[4]
				}
				if(v.movieNmEn=="null"){
					v.movieNmEn="";
				}
				$(".movieNm").html(v.movieNm+"&nbsp&nbsp<font id=\"movieNmEn\" size=\"4px\"></font>");
				$("#movieNmEn").html(v.movieNmEn);
				$("#openDt").html(v.openDt);
				$("#typeNm").html(v.typeNm);
				$("#nationAlt").html(v.nationAlt);
				$("#genreAlt").html(v.genreAlt);
				$("#peopleNm").html(v.peopleNm);
				$("#genreAlt").html(v.genreAlt);
				$("#discrip").html(v.discrip);
				$("#showTm").html(v.showTm+"분");
				$("#watchGradeNm").html(v.watchGradeNm);
				$("#actorsNm").html(actor);
				$("#movieCd").val(v.movieCd);
				$("#movieCdUpdate").val(v.movieCd);
			}
		});
		
		//로그인한 id와 출력된 movieCd를 가지고 likemovie DB에 데이터 있는지 확인 (있으면 빨간하트, 없으면 빈하트)
		$.ajax({  
			url:"likeMovieSearch.do",
			data:{id:"${sessionScope.id}", movieCd: movieCd},
			success:function(v){
				//console.log(v);
				if(v==movieCd){
					$("#heartImg").attr("src", "assets/images/heart-fill.png");
				}
			}
		});

		//리뷰작성 클릭시 리뷰 모달창 뜸
		$("#popupWritingBtn").click(function(){
			if(${sessionScope.id==null||sessionScope.password==null}){
				alert("로그인 후 이용해 주세요");
				document.location.href="login.jsp";
				return false;
			}
			$("#popupWriting").show();
			$("body").append("<div class='backgroungGray'></div>");
		});
		
		
		//x표시나 백그라운드 클릭시 모달창 꺼짐
		$("body").click(function(event){
			if(event.target.className=='close m-top-10 m-r-15'||event.target.className=='backgroungGray'){
				$("#popupWriting").hide();
				$("#popupWritingUpdate").hide();
				$(".backgroungGray").hide();
			}
		});
		
		//리뷰 제출
		$("#submitReview").click(function(){
			$.ajax({
				url:"reviewForm.do",
				type:'get',
				data:$("form[id=reviewForm]").serialize(),
				success:function(v){
					console.log(v);
				}
			});
		});
		
		//전체리뷰 클릭시 리뷰가 나오고, 이 때 전체 리뷰 가져옴
		$("#showReviewBtn").click(function(){
			$("#showReview").show();
			//전체 리뷰 가져옴
			$.ajax({
				url:"showReview.do",
				data:{movieCd:movieCd},
				success:function(v){
					console.log(v);
					
						var temp="";
					$.each(v,function(index,value){
						temp+="<div class=\"sm-m-top-30 m-bottom-80 panel-body\" style=\"background-color:#FBF5EF;  border-radius: 10px;\">";
						temp+="<table class=\"table\" style=\"margin-bottom:0px\">";
						temp+="<thead>";
						temp+="<tr>";
						temp+="<th style=\"width:74%;\">"+value.title+"</th>";
						temp+="<th style=\"width:13%;\">"+value.regdate+"</th>"
						temp+="<th style=\"width:13%;\">"
						for(var i=0;i<value.grade;i++){
							temp+="<img alt=\"\" src=\"assets/images/star-fill.png\" width=\"20px\"/>";
						}
						temp+="</th>";
						temp+="</tr>";
						temp+="</thead>";
						temp+="<tbody>";
						temp+="<tr>";
						temp+="<td colspan=\"2\">"+value.contents+"</td>";
						if(value.id=="${sessionScope.id}"){ //작성자가 로그인한 아이디와 일치하는 리뷰는 수정 가능하게
							temp+="<td><br>By &nbsp"+value.username+"&nbsp&nbsp&nbsp&nbsp<img onclick=\"updateReview(\'"+value.title+'\',\''+value.contents+'\',\''+value.no+"\')\"  style=\"cursor:pointer; transform:translate(0%,-15%);\" src=\"assets/images/pencil.png\" alt=\"\" width=\"18px\"/></td>";							
						
						}else{
							temp+="<td><br>By &nbsp"+value.username+"&nbsp&nbsp&nbsp&nbsp</td>";
						}
						temp+="</tr>";
						temp+="</tbody>";
						temp+="</table>";
						temp+="</div>"
					});
					$("#showReviewAll").html(temp);
				}
			});
			
		});
		
		
	});
	
	
	//리뷰 별점 별 계산
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
	
	//하트 클릭시
	function clickHeart(){
		if(${sessionScope.id==null||sessionScope.password==null}){
			alert("로그인 후 이용해 주세요");
			document.location.href="login.jsp";
		}else{
			if(($("#heartImg").attr("src"))=="assets/images/heart.png"){ //빈 하트이면 likemoive에 inert하고 빨간하트로
				$.ajax({
					url:"likeMovieInsert.do",
					data:{id:"${sessionScope.id}", movieCd:movieCd},
					success:function(v){
						$("#heartImg").attr("src", "assets/images/heart-fill.png");
						
					}
				});				
			}else{ //빨간하트면 likemovie에서 값 지우고 빈하트로
				$.ajax({
					url:"likeMovieDelete.do",
					data:{id:"${sessionScope.id}", movieCd:movieCd},
					success:function(v){
						$("#heartImg").attr("src", "assets/images/heart.png");
					}
				});
				
			}
		}
	}
	
	//리뷰 수정시
	function updateReview(title,contents,no){
		$("#titleUpdate").val(title);
		$("#contentsUpdate").val(contents);
		$("#popupWritingUpdate").show();
		$("body").append("<div class='backgroungGray'></div>");
		
		//수정한 리뷰 제출
		$("#submitReviewUpdate").click(function(){
			$.ajax({
				url:"reviewFormUpdate.do",
				type:'get',
				data:{no:no, title:$("#titleUpdate").val(), contents:$("#contentsUpdate").val(), grade:$("#countStarUpdate").val()},
				success:function(v){
					console.log(v);
				}
			});
		});
	}
	
	//수정 리뷰 별점 별 계산
	var count2=0;
	function clickStar2(number){
		if($("#u"+number).attr("src")=="assets/images/star-fill.png"){
			count--;
			$("#u"+number).attr("src","assets/images/star.png")
		}else{
			count++;
			$("#u"+number).attr("src","assets/images/star-fill.png")
		}
		$("#countStarUpdate").val(count);
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
                                    <h2 class="movieNm">영화제목</h2>
                                    <p id=discrip></p>
                                </div>
                                <hr />
                                <div class="person_details m-top-40">
                                    <div class="row">
                                        <div class="col-md-5 text-left">

                                            <p>개봉일:</p>
                                            <p>제작 국가:</p>
                                            <p>영화 유형:</p>
                                            <p>영화 장르:</p>
                                            <p>관람 등급:</p>
                                            <p>영화 감독:</p>
                                            <p>상영 시간:</p>
                                            <p>대표 출연진:</p>
                                        </div>
                                        <div class="col-md-7 text-left">
                                            <p id="openDt"></p>
                                            <p id="nationAlt"></p>
                                            <p id="typeNm"></p>
                                            <p id="genreAlt"></p>
                                            <p id="watchGradeNm"></p>
                                            <p id="peopleNm"></p>
                                            <p id="showTm"></p>
                                            <p id="actorsNm"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-top-60">
                                <span id="popupWritingBtn" style="margin-right: 50px; cursor:pointer;"><img src="assets/images/pen.png" alt="" width="25px" style="transform:translate(0%,-10%);  margin-right: 10px;"/><font size="4px" style="color:black;">리뷰 작성</font></span>
                                <span id="showReviewBtn" style="margin-right: 50px; cursor:pointer;"><img src="assets/images/writing.png" alt="" width="25px" style="transform:translate(0%,-10%);  margin-right: 10px;"/><font size="4px" style="color:black;" >전체 리뷰</font></span>
                                <span onclick="clickHeart()" style="cursor:pointer;"><img id="heartImg" src="assets/images/heart.png" alt="" width="25px" style="transform:translate(0%,-10%);  margin-right: 10px;"/><font size="4px" style="color:black;" >찜하기</font></span>
                                </div>
                            </div><!--영화정보  -->


                        </div>
                    </div><!-- End off row -->
                </div> <!-- End off container -->
            </section> <!-- End off Model Details Section -->




			<!--리뷰작성-->
			<div id="popupWriting" >
			<div class="close m-top-10 m-r-15">close</div>
				<div class="m-top-60 m-l-70 m-bottom-30 m-r-100">
					<font size="6em">Review : </font><font class="movieNm" size="6em"></font></div>
				<div class="m-l-40 m-r-40 ">
					<form id="reviewForm">
						<div class="row" style="justify-content: space-between;">
							<div class="col-sm-6">
								<div class="form-group">
									<label>제목</label> <input name="title"
										type="text" class="form-control" required="">
								</div>
							</div>
							<div class="col-sm-3  m-l-100">
								<div class="form-group">
									<label>평점</label>
									<div>
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="1" onclick="clickStar(1)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="2" onclick="clickStar(2)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="3" onclick="clickStar(3)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="4" onclick="clickStar(4)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="5" onclick="clickStar(5)">
										<input id="countStar" name="grade" type="hidden"
											class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div>
									<label>내용</label>
									<div>
										<textarea name="contents" class="form-control noresize" rows="10"
											style="width: 920px"></textarea>
									</div>
								</div>
								<input type="hidden" name="id" value="${sessionScope.id}">
								<input type="hidden" name="movieCd" value="" id="movieCd">
								<div class="form-group m-top-40 m-r-40" style="float:right;">
									<button id="submitReview" class="btn btn-default">
										리뷰 작성<i class="fa fa-long-arrow-right"></i>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--End off Contact Section-->
			
			<!--리뷰수정  -->
		<div id="popupWritingUpdate" >
			<div class="close m-top-10 m-r-15">close</div>
				<div class="m-top-60 m-l-70 m-bottom-30 m-r-100">
					<font size="6em">작성한 리뷰 수정</font></div>
				<div class="m-l-40 m-r-40 ">
					<form id="reviewFormUpdate">
						<div class="row" style="justify-content: space-between;">
							<div class="col-sm-6">
								<div class="form-group">
									<label>제목</label> <input id="titleUpdate" name="title"
										type="text" class="form-control" required="">
								</div>
							</div>
							<div class="col-sm-3  m-l-100">
								<div class="form-group">
									<label>평점</label>
									<div>
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="u1" onclick="clickStar2(1)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="u2" onclick="clickStar2(2)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="u3" onclick="clickStar2(3)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="u4" onclick="clickStar2(4)">
										<img alt="" src="assets/images/star.png" width="20px"
											style="cursor: pointer" id="u5" onclick="clickStar2(5)">
										<input id="countStarUpdate" name="grade" type="hidden"
											class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div>
									<label>내용</label>
									<div>
										<textarea id="contentsUpdate" name="contents" class="form-control noresize" rows="10"
											style="width: 920px"></textarea>
									</div>
								</div>
								<input type="hidden" name="id" value="${sessionScope.id}">
								<input type="hidden" name="movieCd" value="" id="movieCdUpdate">
								<div class="form-group m-top-40 m-r-40" style="float:right;">
									<button id="submitReviewUpdate" class="btn btn-default">
										리뷰 수정<i class="fa fa-long-arrow-right"></i>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>


			<!--리뷰보기-->
            <div id="showReview"  class="contact" >
                <div class="container ">
                    <div class="row">
                        <div class="main_contact p-top-100 p-bottom-100">
	                    <div class="said_post">
	                        <h4 class="m-bottom-40 m-l-30 text-uppercase">전체 리뷰</h4>
	                        </div>
                            <div id="showReviewAll"></div>
                        </div>
                    </div><!--End off row -->
                </div><!--End off container -->
            </div>


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