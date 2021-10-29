<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                            <li><a href="home.jsp">home</a></li> 
							<li><a href="service.jsp">about</a></li> 							                   
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
</body>
</html>