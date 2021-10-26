<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			path="";
			if(this.id=='h1'){
				path='/Web/headerEx1.do';
			}
			if(this.id=='h2'){
				path='/Web/headerEx2.do';
			}
			if(this.id=='null'){
				path='/Web/nullPoint.do?no='+this.lang;
			}
			if(this.id=='cast'){
				path='/Web/cast.do';
			}
			if(this.id=='NumberFormat'){
				path='/Web/numberFormat.do';
			}
			document.location.href=path;
		});
	});
</script>
</head>
<body>
	<button id="h1">HEADER1</button>
	<button id="h2">HEADER2</button>
	<button id="null" lang="5">nullPoint5</button>
	<button id="null" lang="50">nullPoint50</button>
	<button id="cast">cast</button>
	<button id="NumberFormat">NumberFormat</button>
</body>
</html>