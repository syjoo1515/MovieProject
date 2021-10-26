<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* 	function sayMessage(base, height){ //선언함수
			return base*height/2
		}
	console.log(sayMessage(100,5)); */

/* 	var sayMessage=function(base, height){ //익명함수
		return base*height/2;
	}
	console.log(sayMessage(100,5)); */
	
	var sayMessage=new Function('base','height','return base*height/2;'); //function을 객체화시킨 방식. 이런식으로도 구현가능
	console.log(sayMessage(100,5)); 
	
/* 	var param='height, width';
	var formula='return height*width/2';
	var diamond=new Function(param, formula);  //function을 객체화시킨 방식. 이런식으로도 구현가능22
	console.log(diamond(100, 5)); */
 	function showMessage(value){
		if(arguments.length!=showMessage.length) //파라미터와 아규먼트 인자 개수 다를경우 아래 에러 콘솔에 띄우고 alert 안함
			throw new Error('인수의 수가 다르다  '+arguments.length);
		alert('showMessage');
	}
	showMessage(); 
	
</script>
</head>
<body>

</body>
</html>