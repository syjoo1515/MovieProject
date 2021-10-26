<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(function(){
    $("button").click(function(){
       if(this.id=='b1'){
       $("#d1").animate({width:"100%",height:"100%",fontSize:"10em",boardWidth:"1000px",opacity:0.4,marginLeft:"0.6in"},10000);
       }
       else{
          $("#d1").animate({width:"5%",height:"5%",fontSize:"1em",boardWidth:"1000px",opacity:1,marginLeft:"0.6in"},10000);    
       }
    });
  });
 </script>
</head>
<body>
<button id="b1">Click1</button>
<button id="b2">Click2</button>
<br><br><br>
<div id="d1">
 Hello
</div>
</body>
</html>