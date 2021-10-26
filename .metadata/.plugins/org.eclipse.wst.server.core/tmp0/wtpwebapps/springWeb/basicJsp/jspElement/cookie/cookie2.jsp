<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	String color="white";
	Cookie[] cookarray=request.getCookies(); //getCookies:쿠키를 배열형태로 리턴
	if(cookarray!=null && cookarray.length>0){
		for(int i=0;i<cookarray.length;i++){
			if(cookarray[i].getName().equals("color")){
				color=cookarray[i].getValue();
			}
		}
	}
%>
</head>
<body bgcolor="<%=color%>">
	<h1>COOKIE2.JSP</h1>
</body>
</html>