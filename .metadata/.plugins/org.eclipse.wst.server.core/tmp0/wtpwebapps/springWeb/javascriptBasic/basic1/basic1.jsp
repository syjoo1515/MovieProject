<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
 //	console.log('start1'); 
	console.log(document);
	document.writeln('hi1<br>');
	document.writeln('hi2<br>');
	alert('Aleret');
	document.writeln(100+200+"<br>");
	document.writeln(100>200); 
	
//	var:데이터가 들어가는 시점에 해당 데이터에 관한 타입 정의됨 (console.log로 확인가능)
/* 	var v_test;
	console.log(v_test);
	v_test=100;
	console.log(v_test+200);
	v_test="100";
	console.log(v_test+200); */
	
	document.writeln("100: "+typeof 100+"<br>");
	document.writeln("3.14: "+typeof 3.14+"<br>");
	document.writeln("java: "+typeof 'java'+"<br>");
	document.writeln("정의되지 않은 변수: "+typeof sum+"<br>");
	document.writeln("true: "+typeof true+"<br>");
	document.writeln("function(){}: "+typeof function(){}+"<br>");
	document.writeln("[1,2,3]: "+typeof [1,2,3]+"<br>");
	document.writeln("new Object(): "+ typeof new Object()+"<br>");
	var result;
	document.writeln("초기화되지 않은 변수 : "+ typeof result+"<br>");

	//document: 현재 문서에 있는 객체를 레퍼런스화
</script>
<!-- <script type="text/javascript">
	console.log('start2');
</script>
<script type="text/javascript">
	console.log('start3');
</script> -->
</head>
<body>
	
</body>
</html>