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
	cookie.setMaxAge(30); //���ʵ��� ��Ű�� ��ȿ����
	response.addCookie(cookie); //������ ��Ű�� ���� ����(key,value,��ȿ�ð���)�� �������� �ɾ�д�
	response.sendRedirect("cookie2.jsp"); //cookie2.jsp url �Ѿ
%>

<body>
<%=color %>
</body>
</html>