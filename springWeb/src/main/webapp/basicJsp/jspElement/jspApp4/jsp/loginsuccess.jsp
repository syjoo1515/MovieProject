<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<c:if test="${id eq null or id eq ''}"> <!--servlet에서 지정한 시간이 지나면 id가 null이 되어서 login페이지로 들어감  -->
	<c:redirect url="/basicJsp/jspElement/jspApp4/jsp/adminLogin.jsp"></c:redirect>
</c:if>

<body>
${id} 님 로그인 success
</body>
</html>