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
   /* $('<img/>',{
      src:'/web/imgBook/01TCSC2005.jpg',
      width:350,
      height:200
   }).appendTo('body');
   $("<img/>").attr('src','/web/imgBook/01TCSC2005.jpg').appendTo('span'); */
   
   /* var h1='<h1>Java</h1>';
   var h2='<h2>Oracle</h2>';
   $('body').append(h1,h2,h1,h2,h1,h2); */
   
   var content=[
      {name:'java',since:1990,price:5000},
      {name:'oracle',since:1950,price:15000},
      {name:'spring',since:1960,price:35000},
      {name:'xml',since:1970,price:45000}
      
   ];
   $("span").append(function(index){
      var item=content[index];
      var ouput='';
      ouput+='<h1>'+item.name+'</h1>';
      ouput+='<h2>'+item.since+'</h2>';
      ouput+='<h3>'+item.price+'</h3>';
       return ouput;          
   });
  });
 </script>
</head>
<body>
<span></span>
<span></span>
<span></span>
<span></span>
</body>
</html>




