<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
   //request , response ,session,application 
   String id="BLUE";
   String pass="1234";
   request.setAttribute("id", id);
   request.setAttribute("pass", pass);   
  
/*    session: 값이 넘어갈 수 있음. */
   session.setAttribute("id", id);
   session.setAttribute("pass", pass);
   
   HashMap<String,String>map=new HashMap<String,String>();
   map.put("id", id);
   map.put("pass", pass);
   
   request.setAttribute("rqMap", map);
   session.setAttribute("simap", map);
   
   /* applicaiton:서버가 살아 있으면 계속 유지됨. objectEx4_1만 따로 가져가도 유지 */
   application.setAttribute("aMap", map);
   
%>
<body>
  <button onclick="document.location.href='objectEx4_1.jsp'">REDIRECT1REQUEST</button>
</body>
</html>
