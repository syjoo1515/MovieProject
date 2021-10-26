<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var array1=[];
	var array2=new Array();
	var array3=new Array(10);   //배열길이 10
	var array4=new Array(10,20,30,40,50);   //배열길이 5
	var array5=[10];  //길이 1
	var array6=[10,20,30];   //길이 3
 	
	document.writeln("<b>array1=</b>"+array1.length+'개 '+typeof(array1)+"<br>");
	document.writeln("<b>array2=</b>"+array2.length+'개 '+typeof(array2)+"<br>");
	document.writeln("<b>array3=</b>"+array3.length+'개 '+typeof(array3)+"<br>");
	document.writeln("<b>array4=</b>"+array4.length+'개 '+typeof(array4)+"<br>");
	document.writeln("<b>array5=</b>"+array5.length+'개 '+typeof(array5)+"<br>");
	document.writeln("<b>array6=</b>"+array6.length+'개 '+typeof(array6)+"<br>");

</script>

</body>
</html>