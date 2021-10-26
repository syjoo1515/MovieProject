<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function sum(x,y,z,k,i){
	var result=0;
	for(var i=0; i<arguments.length;i++){
	//	alert(arguments[i]); //i가 지역변수로 정의됐기 때문에 파라미터로 받은 i값이 변경됨....지역변수가 우선순위 더 높아서...ㄴㅇㄱ
		var num=arguments[i];
		if(isNaN(num)){  //isNaN: 자바스크립트 기본제공함수. 숫자면 false, 아니면 true
			throw new Error('지정한 값은 숫자가 아닙니다 '+num);
		}//if
		result+=num;
	}//for
	return result;
}//function
console.log(sum(10,20,30,40,50));
</script>
</head>
<body>

</body>
</html>