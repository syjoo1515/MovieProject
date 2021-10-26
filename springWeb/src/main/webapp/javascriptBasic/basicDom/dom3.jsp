<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function eventAction(){
		var input=document.getElementsByTagName('input');
		var click=document.getElementsByName('click'); /*name속성이 있는 node들을 서로 타입이 달라도 묶을 수 있다  */
/* 		console.log(input);
		console.log(click); */
/* 		for(var i=0; i<input.length;i++){
			console.log(input[i].value);
			input[i].value='Event'+(i);
		} */
		for(var i=0; i<click.length;i++){
			console.log(input[i].value);
			input[i].value='Event'+(i);
		}
	}
</script>

</head>
<body>
<img alt="" src="../../html/img/1.gif" width="50" height="50" onclick="eventAction()">
<input type="button" value="Action1" name="click">
<input type="text" value="Action2" name="click">
<input type="password" value="Action3" name="click">

</body>
</html>