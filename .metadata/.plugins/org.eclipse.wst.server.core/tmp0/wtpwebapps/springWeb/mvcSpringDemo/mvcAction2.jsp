<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     $("button").click(function(){
       document.location.href='/Web/locationAction.do?id='+this.id; 
     });
     $("img").mouseover(function(){
    	 document.location.href='locationActionImg.do?alt='+this.alt; 
     });
  });
</script>  
</head>
<body>
  <button id="blue">blue</button>
  <button id="red">red</button>
  <button id="green">green</button>
  <button id="cyan">cyan</button><br>
  <img alt="blue" src="/Web/img/11.gif" width="50" height="50">
  <img alt="red" src="/Web/img/10.jpg" width="50" height="50">
  <img alt="green" src="/Web/img/12.gif" width="50" height="50">
  
</body>
</html>

