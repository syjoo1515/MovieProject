<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie=new Cookie("pop","pop");
	cookie.setMaxAge(10);
	response.addCookie(cookie);
%>
<script type="text/javascript">
	self.close(); //self:내장객체

</script>

</body>
</html>