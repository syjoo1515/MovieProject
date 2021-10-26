<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	div{
		background-color: blue;
		border: solid 2px  white;
		width:200px;
		height:100px;
		float: left; /* 옆으로 정렬됨 */
		color: white;
	}
</style>
<script type="text/javascript">
	var domFunction1=function(){
		var div=document.getElementsByTagName("div") /*getElementsByTagName:nodelist. s 붙이면 여러개 의미. element: node의 확장된 의미 */
		//div[0].innerHTML='<B>TestDomDiv</B>';
		for (var i = 0; i < div.length; i++) {
			div[i].innerHTML='DivElement+(i+1)';
			//div[i].firstChild.nodeValue='DivElement+(i+1)';
			console.log(div[i].nodeValue);
		}
	}
	
	var domFunction2=function(){
		var p1=document.getElementById("p1");
		var pNodeList=document.getElementsByTagName("p");
		console.log(p1==pNodeList[0]);
		console.log(p1);
		console.log(pNodeList[0]);
	}
</script>

</head>
<body>
<!-- 	<div></div>
	<div></div>
	<div></div>
	<div></div> -->
	<p id="p1">pElement1</p><br>
	<p id="p2">pElement2</p><br>
	<p id="p3">pElement3</p><br>
	<p id="p4">pElement4</p><br>
	<input type="button" value="click" onclick="domFunction1()">
	<input type="button" value="click2" onclick="domFunction2()">
</body>
</html>