<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>



</head>
<body>
	<input type="button" value="click1" onclick="clickk()">
	<input type="button" value="click2" onclick="clickk()">
</body>
<script type="text/javascript">
	var str=new Date();
	function clickk(){  //선언함수 //리턴값 지정 안해줘도 됨-자바스크립트는 variable이라서
		alert('click1');
		return 10+50;
	}
	var num=clickk();//이게 가장 먼저 실행됨-페이지가 열리면 자바스크립트부분이 가장 먼저 실행되나봄
	alert(num); 
	
 	var click2=function(){ //익명함수. click에 function의 주소 저장됨
		alert('click2');
		return function(){
			alert('return1 function');
			return function(){
				alert('return2 function');
			}
		}
	}  
/*  	click2(); //alert('click2');까지실행
 	click2()(); //alert('return1 function');까지실행
 	click2()()(); //alert('return2 function');까지실행 */
 	
 	
 	  var type1='hello';
 	  var type2=100;
 	  var type3=function (){};
 	  var type4={'lesson':'javaScipt'};   //json {key,value}
 	  console.log(typeof(type1)=='string');
 	  console.log(typeof(type2)=='number');
 	  console.log(typeof(type3)=='function');
 	  console.log(typeof(type4)=='object');
 	  console.log(type4.lesson+' '+type4['lesson']); 
 	  //JSON 데이터 접근- 변수명.접근키 또는 변수명['접근키']
 	
</script>
</html>