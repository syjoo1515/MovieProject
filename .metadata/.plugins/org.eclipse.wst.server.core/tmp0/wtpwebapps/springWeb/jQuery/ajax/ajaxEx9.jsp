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
function ajaxProc(url,type,dataType){
  $.ajax({
           url:url,
           type:type,
           dataType:dataType,
           success:function(v){
             console.log(v);
           }
  });
}
  $(function(){
     $("button#ajax1").click(function(){
    	 ajaxProc('/Web/ajaxMessage.do','GET','text');
     });
     $("button#ajax2").click(function(){
    	 ajaxProc('/Web/ajaxAlert.do','GET','script');
     });
     $("button#ajax3").click(function(){
    	 ajaxProc('/Web/ajaxJson.do','GET','json');
     });
     
  });
</script>  
</head>
<body>
   <button id="ajax1">Ajax1</button>
   <button id="ajax2">Ajax2</button>
   <button id="ajax3">Ajax3</button>
</body>
</html>


