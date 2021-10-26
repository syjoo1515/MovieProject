<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .select{
    font-family: "궁서";
    background-color: red;
    font-size: 30px; 
 }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(function(){
    $("p").click(function(){
      /*  if(this.id=='ph'){
      $("p").addClass("select");
       }else if(this.id=='ph2'){
          $("p").removeClass("select");
       } */
       //$("p").toggleClass("select");
       $(this).toggleClass("select");
    });
  });
 </script>
</head>
<body>
<p id="ph"><b>Hello,</b><b>jQuery</b><b>Oracle</b></p>
<p class="select" id="ph2">Java</p>
<p>It's so Easy!</p>
<p>It's so Hard!</p>
</body>
</html>



