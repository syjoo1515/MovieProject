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
		$("input[type='button']").eq(0).click(function(){
			document.location.href='/Web/Java.do';
		});
		$("input[type='button']").eq(1).click(function(){
			document.location.href='/Web/Xml.do';
		});
		$("input[type='button']").eq(2).click(function(){
			document.location.href='/Web/Oracle.do';
		});
	});
</script>
</head>
<body>
	<input type="button" value="click1">
	<input type="button" value="click2">
	<input type="button" value="click3">
	
	<form action="/Web/modelArgDemo.do">
	  <input type="text" name="no">
	  <input type="text" name="id">
	  <input type="text" name="scrapno">
	  <input type="submit" name="Send">
	</form>
</body>
</html>