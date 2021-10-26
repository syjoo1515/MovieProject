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
    $("div:first").click(function(){
      //alert($(this).html()+' '+this.innerHTML);
      $(this).html('One Click');
      alert('EventClick');
      $(this).unbind();
    });
    $("div:last").one('click',function(){
         //alert($(this).html()+' '+this.innerHTML);
         $(this).html('One Click');
         alert('EventClickLast');
    });
    $("h1").click(function(){
       $(this).html(function(index,html){
         return html+'★'; 
       }); 
    });//click
    setInterval(function(){
      $("h1").trigger('click'); 
    },1000);
  });
 </script>
</head>
<body>
  <div>JQuery-0</div>
  <div>JQuery-1</div>
  <div>JQuery-2</div>
  <div>JQuery-3</div>
  <h1>Start:</h1>
  <h1>Start:</h1>  
  
</body>
</html>
