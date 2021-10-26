<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>DATA1 ${param.data1}</h2>
	<h2>DATA2 ${param.data2} </h2>
	
		<!--JSP로 출력: name이 같은 형태일 때 getParameterValues를 이용해 배열로 받음  -->
	<ul>
	<%
		String[]res=request.getParameterValues("lesson");
		for(String item:res){
	%>
	<li><%=item%></li>
	<%} %>
	</ul>
	
	
	<!-- JSTL로 출력 -->
 	<ul>
<%-- 	<c:set var="array" value="${paramValues.lesson}" scope="page"></c:set>
	<c:set var="cnt" value="${f:length(paramValues.lesson)}" scope="page"></c:set> --%>
 	<c:forEach var="i" begin="0" end="${f:length(paramValues.lesson)-1}">
	<li>${paramValues.lesson[i]}</li>
	</c:forEach>
	</ul> 
	
	<ul>
	 <c:forEach var="i" items="${paramValues.lesson}" varStatus="cnt">
	<li>${i}</li>
	</c:forEach>
	</ul>
</body>
</html>