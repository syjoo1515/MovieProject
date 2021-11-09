<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<nav
		class="navbar navbar-default navbar-fixed white no-background bootsnav text-uppercase">
		<!-- Start Top Search -->
		<div class="top-search">
			<div class="container">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-search"></i></span>
					<input type="text" class="form-control" placeholder="Search">
					<span class="input-group-addon close-search"><i
						class="fa fa-times"></i></span>
				</div>
			</div>
		</div>
		<!-- End Top Search -->

		<div class="container">

			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-menu">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="home.jsp"> 
					<img src="assets/images/logo.png" class="logo logo-display" alt="" style="width: 40px;">
					<img src="assets/images/logo-black.png" class="logo logo-scrolled" alt="" style="width: 40px;">
				</a>
			</div>
			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
					data-out="fadeOutUp">
					
					<c:choose>
					<c:when test="${sessionScope.id==null||sessionScope.password==null}">
					</c:when>
					<c:otherwise>
						<li><a><font color="#ee997b">${sessionScope.id}님 반갑습니다 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font></a></li>
					</c:otherwise>
					</c:choose>
					
					<li><a href="home.jsp">home</a></li>
					<li><a href="boxOffice.jsp">박스오피스</a></li>
					<li><a href="searchMovie.jsp">영화 검색</a></li>
					<c:choose>
						<c:when test="${sessionScope.id==null||sessionScope.password==null}">
							<li><a href="loginCheck.do" id="userState">로그인/회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="loginCheck.do" id="userState">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>


	</nav>



</body>
</html>