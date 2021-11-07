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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">


        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />
        
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style type="text/css">
a{
	color:#ee997b;
}

</style>
<script type="text/javascript">


	$(function(){
		//로그인/회원가입 선택하면 화면 바뀌는 부분
	    $('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
	 		$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
	 		$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		
			/* 로그인 */
		//로그인 버튼 클릭시 값 입력 여부 확인
		$("#login-submit").click(function(){
			if($("#loginid").val().length==0||$("#loginpassword").val().length==0){
				alert("값을 입력해주세요");
				$("#loginid").val('');
				$("#loginpassword").val('');
				return false;
			}
		});
		
		//쿠키 확인 후 저장된 id값이 있으면 가져온다
		$.ajax({
			url:"loginRemember.do",
			dataType:"text",
			success:function(v){
				//console.log(v);
				$("#loginid").val(v);
				if(v!=""){
					$("#remember").prop("checked",true);
				}
			}
		});
		
			/* 회원가입 */
		//회원가입 버튼 클릭시 값 입력여부 확인
		$("#register-submit").click(function(){
			if($("#registerid").val().length==0||$("#registerpassword").val().length==0||$("#confirm-password").val().length==0||$("#username").val().length==0||
				$("#phone1").val().length==0||$("#phone2").val().length==0||$("#phone3").val().length==0||$("#email1").val().length==0||$("#email2").val().length==0){
				alert("입력하지 않은 내용이 있습니다");
/* 				$("#registerid").val('');
				$("#registerpassword").val('');
				$("#confirm-password").val('');
				$("#username").val('');
				$("#phone1").val('');
				$("#phone2").val('');
				$("#phone3").val('');
				$("#email1").val('');
				$("#email2").val(''); */
				return false;
			}

			if($("#idDuplicate").html()!=$("#registerid").val()+"는 사용 가능한 ID 입니다"){
				alert("아이디 중복체크를 해주세요");
				return false;
			}
				alert("회원가입이 완료되었습니다. 로그인 해 주시길 바랍니다");

		});
			
		//아이디 중복체크
		$("#idDuplicateCheck").click(function(){
			$.ajax({
				url:"idCheck.do",
				data: {id : $("#registerid").val()},
				dataType:"text",
				success:function(v){
					console.log(v);
					if(v=='true'){
						$("#idDuplicate").html($("#registerid").val()+"는 이미 존재하는 ID입니다");
						$("#idDuplicate").css("color", "red");
						$("#registerid").val('');
					}else{
						$("#idDuplicate").html($("#registerid").val()+"는 사용 가능한 ID 입니다");
						$("#idDuplicate").css("color","blue");
					}
					console.log($("#idDuplicate").html());
				}
			})
		});
		
		//비밀번호는 영문,숫자를 포함하여 8~20자리로 입력하도록
 		$("#registerpassword").blur(function(){
			var reg1=/[0-9]/g
			var reg2=/[a-z]/gi
			var reg3=/[0-9a-z]{8,20}/gi
			if(reg1.test($("#registerpassword").val())&& reg2.test($("#registerpassword").val()) && reg3.test($("#registerpassword").val())){
				$("#passwordCheck1").html("&nbsp");
			}else{
				$("#passwordCheck1").html("<font color='red'>비밀번호는 영문,숫자를 포함하여 8~20자리로 입력해야 합니다</font>");
				$("#registerpassword").val('');
			}
		}); 
		
		//비밀번호 입력 후 커서 넘어가면 일치여부 체크
		$("#confirm-password").blur(function(){
			if($("#registerpassword").val()!=$("#confirm-password").val()&&$("#registerpassword").val()!=''){
				$("#passwordCheck2").html("<font color='red'>비밀번호가 일치하지 않습니다 </font>");
				$("#registerpassword").val('');
				$("#confirm-password").val('');		
				return false;
			}else{
				$("#passwordCheck2").html("<font color='red'> &nbsp </font>");
			}
		});
		
		//전화번호 입력후 커서 넘어가면 입력값 체크 후hidden으로 값 보냄
 		$("#phone3").blur(function(){
			var reg1=/^\d{2,3}$/g;  //숫자 2~3자리면 true
			var reg2=/^\d{3,4}$/g;
			var reg3=/^\d{4}$/g;
			if(reg1.test($("#phone1").val())&&reg2.test($("#phone2").val())&&reg3.test($("#phone3").val())){
				$("#phoneCheck").html("&nbsp");
			}else{
				$("#phoneCheck").html("<font color='red'>전화번호 입력값이 올바르지 않습니다</font>");
				$("#phone1").val('');
				$("#phone2").val('');
				$("#phone3").val('');
				return false;
			}
			$("#phone").val($("#phone1").val()+'-'+$("#phone2").val()+'-'+$("#phone3").val());
		}); 
		
		//이메일 입력후 넘어가면 hidden으로 값 보냄
		$("#email2").blur(function(){
			$("#email").val($("#email1").val()+'@'+$("#email2").val());
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

            <section id="hello" class="contact-banner bg-mega">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="main_home text-center">
 <div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							
							<!-- login form start -->
								<form id="login-form" action="loginAction.do" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="id" id="loginid" tabindex="1" class="form-control" placeholder="ID" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="loginpassword" tabindex="2" class="form-control" placeholder="Password" value="">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember ID</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
									<!-- login form end  -->
									
									<!-- register form start -->
								<form id="register-form" action="joinAction.do" method="post" role="form" style="display: none;">
								
									<div class="form-group0">
										<input type="text" name="id" id="registerid" tabindex="1" class="form-control80" placeholder="ID" value="">
										<button type="button" class="btn btn-default" id="idDuplicateCheck">중복체크 <i class="fa fa-long-arrow-right"></i></button>
										<span><font id="idDuplicate">&nbsp</font></span>
									</div>
									<div class="form-group0">
										<input type="password" name="password" id="registerpassword" tabindex="2" class="form-control" placeholder="Password" value="">
										<span id="passwordCheck1">&nbsp</span> 
									</div>
									<div class="form-group0">
										<input type="password"  id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password" value="">
										<span id="passwordCheck2">&nbsp</span> 
									</div>
									<br><br>
									
									<div class="form-group0">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
										<span id="usernameCheck">&nbsp</span>
									</div>
									<div class="form-group0">
										<input type="text"  id="phone1"  class="form-control31" placeholder="Phone" value="">&nbsp-&nbsp
										<input type="text"  id="phone2" class="form-control31" placeholder="Phone" value="">&nbsp-&nbsp
										<input type="text"  id="phone3" class="form-control31" placeholder="Phone" value="">
										<input type="hidden" name="phone" id="phone" class="form-control46" value="">
										<span id="phoneCheck">&nbsp</span> 
									</div>
									<div class="form-group0">
										<input type="text"  id="email1"  class="form-control46" placeholder="Email" value="">&nbsp&nbsp&nbsp@&nbsp&nbsp&nbsp
										<input type="text"  id="email2" class="form-control46 m-bottom-20" placeholder="Email" value="">
										<input type="hidden"  name="email" id="email" class="form-control46" value="">
									</div>
									<div class="form-group0">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
								<!-- register form end -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
            
    



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








        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>