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
<body>
<c:set var="i" value="${message}"></c:set>
<c:out value="${i}"></c:out>
<c:set var="msg" value="${f:split(i,'#')}"></c:set>
<ul>
	<c:forEach var="j" items="${msg}">
	<li>${j}</li>
	</c:forEach>
</ul>

<!--count: index에서 +1한 값  -->
<c:forTokens items="${i}" delims="#" varStatus="status">
	<h3>${status.index} ${status.count} : ${status.current}</h3>

</c:forTokens>
</body>
</html>