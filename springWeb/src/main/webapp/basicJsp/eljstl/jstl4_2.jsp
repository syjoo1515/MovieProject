<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>DATA1: ${param.data1}</h2>
	<h2>DATA2: ${param.data2}</h2>
	
    <c:choose>
     <c:when test="${param.data1 ge 50 and param.data2 le 100}">
       <h1>50이상 100이하 </h1>
     </c:when>
     <c:when test="${param.data1 ge 101 and param.data2 le 200}">
       <h1>101이상 200이하 </h1>
     </c:when>
     <c:otherwise>
       <h3>otherwise</h3>
     </c:otherwise>
     </c:choose>

</body>
</html>