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
var a=100;
var b=96.9;
var c='abc';
var d=[10,20,30,40,50];
var e=['aaa',10,[1,2,3]];
var f=5>3;
var g=function(){};

for(var i=0;i<e.length;i++){
	   //console.log(e[i]+' '+typeof e[i]);
	   if(typeof(e[i])=='object' && Array.isArray(e[i])){
	      //console.log(e[i]);
	      for(var j=0;j<e[i].length;j++){
	         console.log(e[i][j]+100);
	      }
	   }else{
	      console.log(e[i]);
	   }
	}


document.writeln(a+": "+typeof a+"<br>");
document.writeln(b+": "+typeof b+"<br>");
document.writeln(c+": "+typeof c+"<br>");
document.writeln(d+": "+typeof d+"<br>");
document.writeln(e+": "+typeof e+"<br>");
document.writeln(e[0]+": "+typeof e[0]+"<br>");
document.writeln(e[1]+": "+typeof e[1]+"<br>");
document.writeln(e[2]+": "+typeof e[2]+"<br>");
document.writeln(d+": "+typeof f+"<br>");
document.writeln(e+": "+typeof g+"<br>");
</script>
</body>
</html>