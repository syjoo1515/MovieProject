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
		$("button#all").click(function(){
			$("img").attr('width',function(index){
				return 100;
				
			});
		});
		//데이터를 json형태로
		$("button#all2").click(function(){
			$("img").attr({width:function(index){
				return 200;
				
			},
			height:function(index){
			return (index+1)*100;	
			}
			}//json
			);
		});
	$("img").click(function(){
		$(this).attr('width',function(index){   //index:모두 0-this로 접근했기 때문에. 이미지 한개 클릭하면 해당 이미지만 변함
		//$("img").attr('width',function(index){	 //index: 각각 0, 1, 2이고 이미지 한개만 클릭해도 모두 젼함
			return (index+1)*100;
			
		});
	});
	});
</script>
</head>
<body>
	<button id="all">AllImage</button>
	<button id="all2">AllImage2</button>
	<img alt="" src="/web/html/img/2.jpg">
	<img alt="" src="/web/html/img/4.jpg">
	<img alt="" src="/web/html/img/5.jpg">


</body>
</html>