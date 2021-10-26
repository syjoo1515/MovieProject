<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 	$(function(){
		$("img").mousemove(function(e){
			$("p").text("x:"+e.pageX+" Y:"+e.pageY);
		});
 	});
	$(document).mousedown(function(e){
		//alert(e.which); //.which: 마우스 왼쪽/휠/오른쪽 중 언것 눌렀는지
/*  		if(e.which==1){
			$("img").animate({width:"1000px", heigth:"1000px"},3000);
		}
		else if(e.which==3){
			$("img").animate({width:"100px", heigth:"100px"},3000);
		}
		else if(e.which==2){
			$("img").attr({src:'/firstweb/board/img/back.jpg'});
		}  */
		
		$("p").click(function(){
			$("span").trigger('tig1');
			
		});
		$("pre").click(function(){
			$("span").trigger('tig2');
			
		});
		$("span").bind('tig1',function(){
			//alert($(this).text());
			$(this).html("<font size=6 color=red>jQuery</font>")
		});
		$("span").bind('tig2',function(){
			//alert($(this).text());
			$(this).html("<font size=6 color=blue>jQuery</font>")
		});
		
/* 		$(document).mousemove(function(e){
			$("img").attr({width:e.pageX, height:e.pageY});
			
		}); */
	});
</script>
</head>
<body>
<img src="/web/html/img/1.gif"><br>
<p></p>
<p>PtagClick</p>
<div>DivClick</div>
<pre>PreClick</pre>

<span id="s1">sp1</span>
<span id="s2">sp2</span>
<span id="s3">sp3</span>
</body>
</html>