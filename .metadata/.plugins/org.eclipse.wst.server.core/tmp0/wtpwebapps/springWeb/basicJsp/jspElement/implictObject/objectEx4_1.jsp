<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- null나오는게 정상 -->
  <h1>ID(request):<%=request.getAttribute("id") %></h1>
  <h1>PW(request):<%=request.getAttribute("pass") %></h1>

<!-- 이건 null나오면 안되는데..   -->
  <h1>ID(session):<%=session.getAttribute("id") %></h1>
  <h1>PW(session):<%=session.getAttribute("pass") %></h1>
  
  <h3>REQUESTMAP:<%=request.getAttribute("rqMap") %></h3>
  <h3>SESSIONMAP:<%=session.getAttribute("simap") %></h3>
  
  <h3>ApplicationMAP:<%=application.getAttribute("aMap") %></h3>
  
</body>
</html>