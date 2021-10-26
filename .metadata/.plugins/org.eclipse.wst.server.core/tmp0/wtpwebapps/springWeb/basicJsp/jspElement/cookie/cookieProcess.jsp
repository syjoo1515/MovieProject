<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String color=request.getParameter("color");
	Cookie cookie=new Cookie("color",color);
	cookie.setMaxAge(30); //몇초동안 쿠키가 유효할지
	response.addCookie(cookie); //생성한 쿠키에 대한 내용(key,value,유효시간등)을 브라우저에 심어둔다
	response.sendRedirect("cookie2.jsp"); //cookie2.jsp url 넘어감
%>

<body>
<%=color %>
</body>
</html>