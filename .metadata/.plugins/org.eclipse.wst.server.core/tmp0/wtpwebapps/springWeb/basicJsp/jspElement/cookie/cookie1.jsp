<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!--post: URL�� ���� �Ⱥ���.�������� �ȿ� �־ ����  get:URL���� ����-->
<form action="cookieProcess.jsp" method="post">
	<input type="radio" value="blue" name="color">blue
	<input type="radio" value="red" name="color">red
	<input type="radio" value="pink" name="color">pink
	<input type="radio" value="gray" name="color">gray
	<input type="submit" value="send">
</form>
</body>
</html>