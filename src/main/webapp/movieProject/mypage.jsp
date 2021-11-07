<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="favicon.ico">

<!--Google Fonts link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">


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

<!-- <link rel="stylesheet" href="assets/css/login.css" /> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	
<style type="text/css">
.table > tbody > tr > td{
	padding:10px;
	line-height: 2;
}

</style>


<script type="text/javascript">
	$(function() {
		
		//페이지 로딩시 회원정보 가져옴
		$.ajax({
			url : "userInfo.do",
			data : {id : "${sessionScope.id}"},
			dataType : 'json',
			success : function(v) {

				$("#username").html(v.username);
				$("#phone").html(v.phone);
				$("#email").html(v.email);
				$("#regdate, #modRegdate").html(v.regdate);
				
				$("#modUsername").val(v.username);
				$("#modPhone").val(v.phone);
				$("#modEmail").val(v.email);
				$("#phone1").val((v.phone).split("-")[0]);
				$("#phone2").val((v.phone).split("-")[1]);
				$("#phone3").val((v.phone).split("-")[2]);
				$("#email1").val((v.email).split("@")[0]);
				$("#email2").val((v.email).split("@")[1]);
				

			},
			error:function(e){
				console.log(e);
			}
		});
		
		//버튼 클릭시 해당 내용 나오도록
		$("#info").click(function(){
			$("#infoDiv").attr('style','display:show');
			$("#updateDiv").attr('style','display:none');
			$("#writingDiv").attr('style','display:none');
			$("#likeDiv").attr('style','display:none');
			$("#deleteDiv").attr('style','display:none');
		});
		
		$("#writing").click(function(){
			$("#infoDiv").attr('style','display:none');
			$("#updateDiv").attr('style','display:none');
			$("#writingDiv").attr('style','display:show');
			$("#likeDiv").attr('style','display:none');
			$("#deleteDiv").attr('style','display:none');
		});		
		
		$("#like").click(function(){
			$("#infoDiv").attr('style','display:none');
			$("#updateDiv").attr('style','display:none');
			$("#writingDiv").attr('style','display:none');
			$("#likeDiv").attr('style','display:show');
			$("#deleteDiv").attr('style','display:none');
		});	
		
		$("#delete").click(function(){
			$("#infoDiv").attr('style','display:none');
			$("#updateDiv").attr('style','display:none');
			$("#writingDiv").attr('style','display:none');
			$("#likeDiv").attr('style','display:none');
			$("#deleteDiv").attr('style','display:show');
		});	
		
		
		

		//로그아웃
		$("#logout, #logout2").click(function() {
			var logout = confirm("로그아웃하시겠습니까?");
			if (logout) {
				alert("로그아웃 되었습니다")
				document.location.href = "logoutAction.do";
				return false;
			}
		});
		
		//정보 수정-비밀번호 일치 여부 확인, 화면 전환
		$("#modInfoButton").click(function(){
			if($("#modInfoInput").val()!="${sessionScope.password}"){
				$("#checkModinfoPw").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp비밀번호가 일치하지 않습니다</font>");
				$("#modInfoInput").val('');
				return false;
			}else{
 				$("#infoDiv").attr('style','display:none');
				$("#updateDiv").attr('style','display:show'); 
			}
		})
		
		
 		//정보 수정-입력값 확인
 		$("#modInfoForm").click(function(){
 			if($("#modPassword").val().length==0||$("#modPassword-confirm").val().length==0||$("#modUsername").val().length==0||
 				$("#phone1").val().length==0||$("#phone2").val().length==0||$("#phone3").val().length==0||$("#email1").val().length==0||$("#email2").val().length==0){
				alert("입력하지 않은 내용이 있습니다");
				return false;
 			}
 			alert("회원정보가 수정되었습니다");
 			
 		});
 		
		//정보 수정-비밀번호 정규식 확인
 		$("#modPassword").blur(function(){
			var reg1=/[0-9]/g
			var reg2=/[a-z]/gi
			var reg3=/[0-9a-z]{8,20}/gi
			if(reg1.test($("#modPassword").val())&& reg2.test($("#modPassword").val()) && reg3.test($("#modPassword").val())){
				$("#checkModPw").html("&nbsp");
				return false;
			}else{
				$("#checkModPw").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp비밀번호는 영문,숫자를 포함하여 8~20자리로 입력해야 합니다</font>");
				$("#modPassword").val('');
				return false;
			}
		}); 
 		
		//정보 수정-비밀번호 일치 여부 확인
 		$("#modPassword-confirm").blur(function(){
 			if($("#modPassword").val()!=$("#modPassword-confirm").val()){
 				$("#checkModPwDismatch").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp비밀번호가 일치하지 않습니다</font>");
 				$("#modPassword").val('');
 				$("#modPassword-confirm").val('');
 				return false;
 			}else{
 				$("#checkModPwDismatch").html("");
 			}
 		});
		
 		//정보 수정-전화번호 입력후 커서 넘어가면 입력값 체크 후hidden으로 값 보냄
		function phoneCheck(a, b){
			a.blur(function(){
				if(b==1) var reg=/^\d{2,3}$/g;
				else if(b==2) var reg=/^\d{3,4}$/g;
				else if(b==3) var reg=/^\d{4}$/g;
				if(reg.test(a.val())){
					$("#checkModPhone").html("&nbsp");
				}else{
					$("#checkModPhone").html("<font color='red'>전화번호 입력값이 올바르지 않습니다</font>");
					a.val('');
					return false;
				}
				$("#modPhone").val($("#phone1").val()+'-'+$("#phone2").val()+'-'+$("#phone3").val());
			}); 
		}
 		phoneCheck($("#phone1"), 1);
 		phoneCheck($("#phone2"), 2);
 		phoneCheck($("#phone3"), 3);
 		
		
		//정보 수정-이메일 입력후 넘어가면 hidden으로 값 보냄
		$("#email1").blur(function(){
			$("#modEmail").val($("#email1").val()+'@'+$("#email2").val());
		});
		$("#email2").blur(function(){
			$("#modEmail").val($("#email1").val()+'@'+$("#email2").val());
		});
 		

		//회원탈퇴
		$("#deleteUserButton").click(function() {
			if($("#deleteUserInput").val()!="${sessionScope.password}"){
				$("#checkDeleteUserPw").html("<font color='red'>&nbsp&nbsp&nbsp&nbsp비밀번호가 일치하지 않습니다</font>");
				$("#deleteUserInput").val('');
				return false;
			}
			$("#checkDeleteUserPw").html("");
			var deleteUserButton = confirm("회원 탈퇴하시겠습니까?");
			if (deleteUserButton) {
				alert("탈퇴되었습니다");
				document.location.href = "deleteAction.do";
			}
		});	
		
		//찜환 영화 출력
		$.ajax({
			url:"likeMovieSelect.do",
			data:{id:"${sessionScope.id}"},
			success:function(v){
				//console.log(v);
				var temp="";
				$.each(v,function(index,value){
					temp+="<tr>";
					temp+="<td class=\"hidden-xs\">"+(index+1)+"</td>";
					temp+="<td>"+value.movieNm+"</td>";
					temp+="<td>"+value.regdate+"</td>";
					temp+="<td align=\"center\" width=\"100px\"><a class=\"btn btn-danger\"><em class=\"fa fa-trash\"></em></a></td>";
					temp+="</tr>";
					$("#likeMovieTbody").html(temp);
					
				});
			}
		});
		
		//작성한 리뷰 출력
		$.ajax({
			url:"writingMovieSelect.do",
			data:{id:"${sessionScope.id}"},
			success:function(v){
				console.log(v);
				var temp="";
				$.each(v,function(index,value){
					temp+="<tr style=\"cursor:pointer;\" onclick=\"clickReview("+value.movieCd+")\">";
					temp+="<td>"+index+"</td>";
					temp+="<td>"+value.movieNm+"</td>";
					temp+="<td>"+value.title+"</td>";
					temp+="<td>"
						for(var i=0;i<value.grade;i++){
							temp+="<img alt=\"\" src=\"assets/images/star-fill.png\" width=\"20px\"/>";
						}
					temp+="</td>";
					temp+="<td>"+value.regdate+"</td>";
					temp+="<td align=\"center\" width=\"100px\"><a class=\"btn btn-info\"><em class=\"fa fa-pencil\"></em></a> <a class=\"btn btn-danger\"><em class=\"fa fa-trash\"></em></a></td>";
					temp+="</tr>";
				});
					$("#writingMovieTbody").html(temp);
			}
		});

	});
		
		function clickReview(movieCd){
			document.location.href="movieDetails.jsp?movieCd="+movieCd;
		}
</script>
</head>
<body data-target=".navbar-collapse">


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
	</div>
	<!--End off Preloader -->


	<div class="culmn">
		<!--Home page style-->

		<jsp:include page="navbar.jsp"></jsp:include>


		<!--Home Sections-->

		<section id="hello" class="about-banner bg-mega" style="height: 300px;">
			<div class="overlay"></div>
			<div class="container" style="height: 300px;">
				<div class="row">
					<div class="main_home text-center" style="padding-top: 130px;padding-bottom: 50px;">
						<div class="about_text">
							<h1 class="text-white text-uppercase">My Page</h1>
							<ol class="breadcrumb">
								<li><a href="#">Home</a></li>
								<li class="active"><a href="#">About Us</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Home Sections-->






		<div class="container">
			<div class="row">
				<!--버튼  -->
				<div class="main-gallery main-model roomy-80">
					<div class="col-md-12 m-bottom-60">
						<div class="filters-button-group sm-text-center">
							<button class="button is-checked" id="info">회원정보</button>
							<button class="button" id="writing">작성한 리뷰</button>
							<button class="button" id="like">찜한 영화</button>
							<button class="button" id="delete">회원 탈퇴</button>
						</div>
					</div>
				</div>

								<!-- 회원정보 -->
							<div id="infoDiv" style="display:show">
								<div class="col-md-12">
									<h1>회원정보</h1>
									<p>회원정보를 변경하려면 비밀번호 입력 후 정보 수정 버튼을 클릭하시길 바랍니다</p>
									<p>&nbsp</p>
								</div>
								
								
								<div class="col-md-12">
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-6">
													<h3 class="panel-title"></h3>
												</div>
												<div class="col col-xs-6 text-right">
													<button type="button" class="btn btn-default" id="logout">로그아웃</button>

												</div>
											</div>
										</div>
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
								</div>
							</div>
							
						<!-- 회원정보 수정-->
							<div id="updateDiv" style="display:none">
								<div class="col-md-12">
									<h1>회원정보 변경</h1>
									<p>변경하려는 내용을 수정 후 정보 수정 버튼을 클릭하시길 바랍니다</p>
									<p>&nbsp</p>
								</div>
								
								
								<div class="col-md-12">
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-6">
													<h3 class="panel-title"></h3>
												</div>
												<div class="col col-xs-6 text-right">
													<button type="button" class="btn btn-default" id="logout2">로그아웃</button>

												</div>
											</div>
										</div>
										<div class="panel-body">
										<form action="updateAction.do" method="post">
											<table class="table table-bordered table-list">
												<tbody>
													<tr>
														<td class="hidden-xs" style="width:20%;">아이디</td>
														<td>${sessionScope.id} <input type="hidden" name="id" value="${sessionScope.id}"></td>
													</tr>
													<tr>
														<td class="hidden-xs">비밀번호</td>
														<td><input type="password" id="modPassword" name="password" class="form-control30"  placeholder="Password" value="" style="height: 28px;"><span id="checkModPw"></span></td>
													</tr>
													<tr>
														<td class="hidden-xs">비밀번호 확인</td>
														<td><input type="password" id="modPassword-confirm" class="form-control30"  placeholder="Password" value="" style="height: 28px;"><span id="checkModPwDismatch"></span></td>
													</tr>
													<tr>
														<td class="hidden-xs">닉네임</td>
														<td><input type="text" id="modUsername" name="username" class="form-control30"  placeholder="Password" value="" style="height: 28px;"></td>
													</tr>
													<tr>
														<td class="hidden-xs">전화번호</td>
														<td>
														<input type="text"  id="phone1"  class="form-control20" placeholder="Phone" value="" style="height: 28px;">&nbsp-&nbsp
														<input type="text"  id="phone2" class="form-control20" placeholder="Phone" value="" style="height: 28px;">&nbsp-&nbsp
														<input type="text"  id="phone3" class="form-control20" placeholder="Phone" value="" style="height: 28px;">
														<input type="hidden" name="phone" id="modPhone" class="form-control46" value="">
														<span id="checkModPhone"></span>
														</td>
													</tr>
													<tr>
														<td class="hidden-xs">Email</td>
														<td>
														<input type="text"  id="email1"  class="form-control20" placeholder="Email" value="" style="height: 28px;">&nbsp&nbsp&nbsp@&nbsp&nbsp&nbsp
														<input type="text"  id="email2" class="form-control20" placeholder="Email" value="" style="height: 28px;">
														<input type="hidden"  name="email" id="modEmail" class="form-control46" value="">
														</td>
													</tr>
													<tr>
														<td class="hidden-xs">가입일</td>
														<td id="modRegdate"></td>
													</tr>
													<tr>
														<td class="hidden-xs">정보 수정</td>
														<td> <button type="submit" class="btn btn-dark"
																id="modInfoForm">정보 수정</button></td>
													</tr>
												</tbody>
											</table>
											</form>
										</div>
									</div>
								</div>
							</div>

						<!--작성 글 보기  -->
						<div id="writingDiv" style="display:none">
								<div class="col-md-12">
									<h1>작성한 리뷰</h1>
									<p>작성글어쩌구  </p>
									<p>&nbsp</p>
								</div>
				
								<!--작성글 테이블  -->
								<div class="col-md-12">
				
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-6">
													<h3 class="panel-title"></h3>
												</div>
												<div class="col col-xs-6 text-right">
													<button type="button" class="btn btn-sm btn-primary btn-create">전체삭제</button>
												</div>
											</div>
										</div>
										<div class="panel-body">
											<table class="table table-striped table-bordered table-list">
												<thead>
													<tr>
														<th style="width:7%;">No</th>
														<th style="width:20%;">영화명</th>
														<th style="width:20%;">제목</th>
														<th style="width:20%;">평점</th>
														<th style="width:20%;">등록일</th>
														<th style="width:13%;"><em class="fa fa-cog"></em></th>
													</tr>
												</thead>
												<tbody id="writingMovieTbody">
												</tbody>
											</table>
				
										</div>
										<div class="panel-footer">
											<div class="row">
												<div class="col col-xs-4">Page 1 of 5</div>
												<div class="col col-xs-8">
													<ul class="pagination hidden-xs pull-right">
														<li><a href="#">1</a></li>
														<li><a href="#">2</a></li>
														<li><a href="#">3</a></li>
														<li><a href="#">4</a></li>
														<li><a href="#">5</a></li>
													</ul>
													<ul class="pagination visible-xs pull-right">
														<li><a href="#">«</a></li>
														<li><a href="#">»</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
				
								</div>
							</div>

						<!-- 찜한 영화 -->
						<div id="likeDiv" style="display:none">
						<div class="col-md-12">
									<h1>찜한 영화</h1>
									<p>찜한영화어쩌고  </p>
									<p>&nbsp</p>
								</div>
				
								<!--찜한영화 테이블  -->
								<div class="col-md-12">
				
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-6">
													<h3 class="panel-title"></h3>
												</div>
												<div class="col col-xs-6 text-right">
													<button type="button" class="btn btn-sm btn-primary btn-create">전체삭제</button>
												</div>
											</div>
										</div>
										<div class="panel-body">
											<table class="table table-striped table-bordered table-list">
												<thead>
													<tr>
														<th class="hidden-xs">No</th>
														<th>영화 제목</th>
														<th>찜한 일자</th>
														<th><em class="fa fa-cog"></em></th>
													</tr>
												</thead>
												<tbody id="likeMovieTbody">
													<tr>
														<td class="hidden-xs">1</td>
														<td>John Doe</td>
														<td>johndoe@example.com</td>
														<td align="center" width="100px"><a class="btn btn-danger"><em
																class="fa fa-trash"></em></a></td>
													</tr>
												</tbody>
											</table>
				
										</div>
										<div class="panel-footer">
											<div class="row">
												<div class="col col-xs-4">Page 1 of 5</div>
												<div class="col col-xs-8">
													<ul class="pagination hidden-xs pull-right">
														<li><a href="#">1</a></li>
														<li><a href="#">2</a></li>
														<li><a href="#">3</a></li>
														<li><a href="#">4</a></li>
														<li><a href="#">5</a></li>
													</ul>
													<ul class="pagination visible-xs pull-right">
														<li><a href="#">«</a></li>
														<li><a href="#">»</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
				
								</div>

						</div>
						
						<!-- 회원 탈퇴 -->
						<div id="deleteDiv" style="display:none">
								<div class="col-md-12">
									<h1>회원탈퇴</h1>
									<p>회원정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다</p>
									<p>&nbsp</p>
								</div>
				
								<div class="col-md-12" style="margin-bottom: 100px;">
									Password : <input type="password" name="password"
															id="deleteUserInput" tabindex="2" class="form-control30"
															placeholder="비밀번호를 입력해주세요" value="" style="height: 28px;">
															<button type="button" class="btn btn-dark"
																id="deleteUserButton">회원 탈퇴</button> <span id="checkDeleteUserPw"></span>
															
				
								</div>
							</div>

				</div>
</div>
				


			


		<!--Company section-->

		<section id="company" class="company bg-light">
			<div class="container">
				<div class="row">
					<div class="main_company roomy-100 text-center">
						<h3 class="text-uppercase">pouseidon.</h3>
						<p>7th floor - Palace Building - 221b Walk of Fame - London-
							United Kingdom</p>
						<p>(+84). 123. 456. 789 - info@poiseidon.lnk</p>
					</div>
				</div>
			</div>
		</section>


		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->


		<footer id="footer" class="footer bg-mega">
			<div class="container">
				<div class="row">
					<div class="main_footer p-top-40 p-bottom-30">
						<div class="col-md-6 text-left sm-text-center">
							<p class="wow fadeInRight" data-wow-duration="1s">
								Made with <i class="fa fa-heart"></i> by <a target="_blank"
									href="http://bootstrapthemes.co">Bootstrap Themes</a> 2016. All
								Rights Reserved
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

	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>