<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/firstweb/javascriptBasic/httpRequest.js"></script>
<!--이게 alert아래있으면 alert안됨(변수httpRequest가 지정안돼서), 이렇게 해야 js파일과 연동됨(?)  -->

<script type="text/javascript"> /* body가 만들어지기 전에 script가 먼저 실행되서 null뜬다 */
alert(document.getElementById("bg"));
</script> 

<script type="text/javascript"> /* 함수 선언만 한 상태이고, 실제 함수 실행은 body태그 안에서 이루어지기때문에 body object정상적으로 뜬다 */
	function show(){
		alert(document.getElementById("bg"));
	}
</script>

<script type="text/javascript">
function showData(url,params,callback,method){
    sendRequest(url,params,callback,method);
 }
 var view=function (){
    if(httpRequest.readyState==4&&httpRequest.status==200){
       alert(httpRequest.responseText);
    }
 }

</script>
</head>
<body id="bg" onload="show()">
	<button onclick="showData('contents2.jsp',null,view,'GET')">Click1</button> 

</body>
</html>