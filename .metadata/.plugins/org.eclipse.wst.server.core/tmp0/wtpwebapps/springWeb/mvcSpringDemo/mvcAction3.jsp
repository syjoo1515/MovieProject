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
        if($(this).text()!='LOGIN')
        document.location.href=$(this).text()+'.do';
        else if($(this).text()=='LOGIN')
        document.location.href=$(this).text()+'.do?state='+$(this).text()+'&id='+this.id;
     }); 
  });
</script>  
</head>
<body>
<button>EMPLIST</button><button>STUDENTLIST</button><button id="blue">LOGIN</button><button id="red">LOGIN</button>
</body>
</html>