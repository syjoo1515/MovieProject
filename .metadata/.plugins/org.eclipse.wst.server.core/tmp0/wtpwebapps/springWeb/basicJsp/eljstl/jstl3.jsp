<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 30px;
}

tr#head {
	background-color: pink;
	color: white;
}
</style>
<!--변수선언  -->
<c:set var="j" value="9" scope="page"></c:set>
</head>
<body>
	<c:out value="${i}"></c:out>
	<!--내용 출력하는것. 그냥 ${i}쓰는거랑 다를 거 없는듯  -->
	<table cellpadding="0" cellspacing="0" border="1" width="100%">
		<thead>
			<tr id="head">
				<c:forEach var="h" begin="2" end="${j}" step="1">
					<th>${h}단</th>

				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" begin="1" end="${j}" step="1">
				<tr>
					<c:forEach var="b" begin="2" end="${j}" step="1">
						<th>${b}X${a}=${a*b}</th>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<br>
  <table cellpadding="10" cellspacing="0" border="1" width="50%" align="center" >
  <c:choose>
    <c:when test="${param.file eq 'img1' }">
    <thead>
    <tr>
      <th><c:import url="img.jsp"></c:import>  </th>
    </tr>
    </thead>
    </c:when>
    <c:otherwise>
      <tfoot>
     <tr>
       <th><c:import url="img2.jsp"></c:import></th>
     </tr>
    </tfoot>
    </c:otherwise>  
    
    
  </c:choose>   

  </table>
</body>

</html>