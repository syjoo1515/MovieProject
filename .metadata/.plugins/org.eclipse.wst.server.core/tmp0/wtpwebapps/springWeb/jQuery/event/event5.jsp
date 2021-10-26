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
 .reverse{
    color: red;
    font-size: 20px;
  /*  background: blue; */
 }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//자바스크립트에서 키:value 구분할 때 콜론 ㅅ
  $(function(){
    $("p").bind('click',function(){
      //alert($(this).html());
      //$(this).html("<b>"+$(this).html()+"</b>");
      $(this).html(function(index,html){
         //alert(index+' '+html);
         return html+ '+';
      });
    });//pTag
    $("p").bind('mouseenter',function(){
        // console.log($(this).text()+'enter');
         $(this).addClass('reverse');
         },
          'mouseleave',function(){
             //console.log($(this).text()+'leave')
             $(this).removeClass('reverse');
             },
          'click',function(){console.log($(this).text()+'click')},
          'dblclick',function(){console.log($(this).text()+'dblclick')}
);
    $("h1").hover(function(){
       $(this).addClass('reverse');
    },function(){
       $(this).removeClass('reverse'); 
    });
    $("h1[lang='h2']").click(function(){
      $(this).html(function(index,html){
         return html+'★';
      }); 
    });
    
    $("h1[lang='h1']").click(function(){
         $(this).html(function(index,html){
            return '★'+html;
         }); 
       });
    
  });
 </script>
</head>
<body>
   <p>Element-0</p>
   <p>Element-1</p>
   <p>Element-2</p>
   <p>Element-3</p>
   
   <h1 lang="h1">Header-0</h1>
   <h1 lang="h2">Header-1</h1>
   <h1>Header-2</h1>
   <h1>Header-3</h1>
</body>
</html>


