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
      //alert($('.g1').html());
      //$('.g1').html('<h1>'+$("div").html()+'Method</h1>');
     /*  $('.g1').html('<h1>'+$("span").html()+'Method</h1>');
      $('.g2').text('<h1>'+$(this).html()+ 'Method</h1>'); */
      $("button#c1").click(function(){
          /* $("div").html(function(index,dom){
             return '<h2>DomEx'+index+'</h2>';
          });  */
          
        $("div.g1,span.g1,div.g2").html(function(index,dom){
          return '<h2>DomEx'+index+'</h2>';
       }); 
          
      });
      $("button#c2").click(function(e){
         if(e.pageX>90)
        $("div,span").empty();
         else{
            $("<h1>TestHTag</h1>").appendTo('pre');
         }
      });
      
  });
 </script>
</head>
<body>
 <button id="c1">Click1</button><button id="c2">Click2</button>
  <div class="g1">G1Text</div>
  <div class="g1">G1Text</div>
  <div class="g1">G1Text</div>
  <div class="g2">G2Text</div>
  <div class="g2">G2Text</div>
  <div class="g2">G2Text</div>
  <span class="g1">SpanText</span>
  <span class="g1">SpanText</span>
  <pre></pre>
</body>
</html>


