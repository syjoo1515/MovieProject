<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="a" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a:forEach var="i" begin="2" end="9" step="1"> <!--step:몇씩 증가할건지  -->
${param.cnt} X ${i} = ${param.cnt*i}<br>
</a:forEach>

<table>
<thead>
<td>
<a:forEach var="i" begin="2" end="9" step="1">${i}단
</a:forEach>
<td>
</thead>
</table>
<tr>

</tr>
</body>
</html>