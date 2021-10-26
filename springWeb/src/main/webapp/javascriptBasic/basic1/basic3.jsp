<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">



/* 	var num=100, su=50;; //var 선언하고 초기값 안주면 console에서 undefined로 나옴, var없으면 num is not defined
	console.log(num);
	if(!(num>=100 && su<=50)){
		document.writeln('else');  //자바스크립트를 사용하여 문서에 해당 문자열을 출력한다.

	}else{
		document.writeln('(num>=100 && su<=50)');
	} */
	var name;
/* 	while(true){
		name=window.prompt('LessonItem','javaScript');  //prompt('제목','입력창') 함수는 사용자에게 윈도우 창을 띄워 데이터를 입력받을 수 있는 함수
		if(name=='javaScript'){ //자바스크립트는 내용비교 ==으로
			window.alert('javaScriptChoice');  //alert('내용') 해당 내용의 창을 띄움
		}
		else if(name=='oracle'){
			window.alert('oracleChoice');
		}else{
			window.alert('OtherChoice');
			break;
		}
	} */
/* 	do{
		name=window.prompt('LessonItem','javaScript');
		alert(name);
		if(name=='quit')
			break;
	}while(true); */
	var array=[10,20,null,5>3,[50,90]];
/* 	for(var i=0;i<array.length;i++){
		console.log(array[i]);
	} */
/* 	for(var i in array){  //i에 array의 인덱스 반환
		if(i%2==0)
		console.log(i+" :"+array[i]);
	} */
/* 	var obj={'name':'김태라','addr':'판교','major':'심리'};
	console.log(obj.name+' '+obj.addr); */
	var objArray=[{'name':'김태라','addr':'판교','major':'심리'}, // Dictionary: 데이터를 key와 value로 저장하는 자료구조 [{key:value,key:value},{key:value,key:value}]
				{'name':'이지수','addr':'서울','major':'컴공'},
				{'name':'도경진','addr':'서울','major':'컴공'},
				{'name':'주소연','addr':'인천','major':'산업'}];
/* 	for(var i=0;i<array.length;i++){
		for(var key in objArray[i]){
			alert(key+":"+objArray[i][key]);
		}
	}
	 */
	for(var i in objArray){
		for(var key in objArray[i]){
			alert(key+":"+objArray[i][key]);
		}
	}

	
	
</script>
</head>
<body>

</body>
</html>