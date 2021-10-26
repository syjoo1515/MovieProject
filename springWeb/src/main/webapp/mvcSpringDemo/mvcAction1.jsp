 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
   $("button").click(function(){
      if(this.id=='btn1')
      document.location.href='/Web/buttonList.do';
      else if(this.id=='btn2')
         document.location.href='/Web/buttonSet.do';
      else if(this.id=='btn3')
         document.location.href='/Web/buttonMap.do';
   });
});
</script>
</head>
<body>

<button id="btn1">ListData</button>
<button id="btn2">SetData</button>
<button id="btn3">MapData</button>
</body>
</html>