<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Student Classes</h2>
  <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
  <table class="table">  
    <thead>    
      <tr>
        <th>NO</th>
        <th>STUDNO</th>
        <th>NAME</th>
        <th>USERID</th>
        <th>GRADE</th>
        <th>IDNUM</th>
        <th>BIRTHDATE</th>
        <th>TEL</th>
        <th>HEIGHT</th>        
      </tr>
    </thead>
    <tbody>   
      <c:forEach var="i" items="${student}" varStatus="cnt" >
        <c:choose>
          <c:when test="${cnt.count mod 2 eq 0 }">
        <tr class="success">
         <td>${cnt.count}</td>
         <td>${i.studno }</td>
         <td>${i.name }</td>
         <td>${i.userid }</td>
         <td>${i.grade }</td>
         <td>${i.idnum }</td>
         <td>${i.birthdate }</td>
         <td>${i.tel }</td>
         <td>${i.height }</td>
        </tr> 
        </c:when>
        <c:otherwise>
        <tr >
         <td>${cnt.count}</td>
         <td>${i.studno }</td>
         <td>${i.name }</td>
         <td>${i.userid }</td>
         <td>${i.grade }</td>
         <td>${i.idnum }</td>
         <td>${i.birthdate }</td>
         <td>${i.tel }</td>
         <td>${i.height }</td>
        </tr> 
        
        </c:otherwise>
        </c:choose>
      </c:forEach>                  
     
       </tbody>
  </table>
</div>

</body>
</html>