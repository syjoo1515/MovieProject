<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* var say='hi';
function showFun1(){
	console.log('showFun1');
	console.log(say); //say에 값 주지않고 찍으면 undifined 나옴
}
function showFun2(){
	cnt=50;  //var를 빼면 전역변수, var를 쓰면 지역변수 ((자바와 달리 함수안에서 전역변수 만들 수 있음))
	var cnt=90; //지역변수와 전언변수가 이름이 같을 경우 지역변수가 우선순위 더 높은-cnt는 지역변수가 되는것
	console.log('showFun2 cnt='+cnt);
	showFun3(); //만약 cnt가 지역변수이면 showFun3의 cnt값이 지정되지 않은것이기 때문에 에러남. 전역변수인 경우에만 에러가 안남 
}
function showFun3(){ //위 식에서 cnt가 전역변수이더라도 showFun3()만 호출할경우 cnt가 정의되지 않아서 에러남
	console.log('showFun3 cnt='+cnt); 
	console.log('showFun3 cnt2='+cnt2); //cnt2가 함수 바깥부분에 선언되어서 에러나지 않음(var이여도)
}
var cnt2=100;
showFun2();
showFun3(); */

 function showFunction(param){ //자바스크립트는 오버로드 안됨-마지막에 쓴 동명의 함수만 호출됨(파라미터에 따라 호출되는거 아님)
	alert('showFunction(param)');
} 
 function showFunction(){ //인자가 있어도 얘가 호출됨
	alert('showFunction'+arguments.length);
	for(i in arguments){
		console.log(arguments[i]); //argument가 object 형태로 되어있어 이런식으로 찍으면 인자 다 출력 가능
	}
} 
//그럼 자바스크립트에서는 굳이 파라미터 쓸 필요 없는건가?-아니지 파라미터로 뭔가를 도출하려면 써야지
showFunction(10);
showFunction(10,20);
showFunction(10,20,30, 3.5, 'hi',5>3);
</script>
</head>
<body>

</body>
</html>