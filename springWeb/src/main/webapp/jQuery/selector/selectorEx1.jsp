<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 아래 jquery 가져옴 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* 	$(function(){
		alert('ActionEx1');
	}); */
/* 	jQuery(function(){  위랑 동일한 코드
		alert('ActionEx2');
	}); */
	$(function(){
	/* 	$("button").click(function(){
			alert(this.firstChild.nodeValue);
			alert(this.innerHTML);
			alert($(this).html());
			alert($(this).text());
			
			this.firstChild.nodeValue=this.firstChild.nodeValue+'짱';
			this.innerHTML=this.innerHTML+'짱';
			$(this).html($(this).html()+'짱');
		}); */
		//document.getElementById('one').innerHTML='t';
		$("pre#one").click(function(){
			alert("hello");
		});
	});
</script>
</head>
<body>
<button id="one"><b>송인효</b></button><button>장호준</button>
<button>주소연</button><button>김소연</button>
<pre id="one">가나다라</pre>
</body>
</html>