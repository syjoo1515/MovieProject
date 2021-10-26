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
		String checker = request.getParameter("checker");
		Cookie cookie = null;
		String id = request.getParameter("id");
		cookie = new Cookie("id", id);
		cookie.setMaxAge(checker!=null?60:0); //60초동안 살아있음
/* 		if (checker != null) {
			cookie.setMaxAge(60);
		} else {
			cookie.setMaxAge(0);
		} */
		response.addCookie(cookie);
	%>
</body>
</html>