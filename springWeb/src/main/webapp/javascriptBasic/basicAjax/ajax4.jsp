<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/firstweb/javascriptBasic/httpRequest.js"></script>
<!--�̰� alert�Ʒ������� alert�ȵ�(����httpRequest�� �����ȵż�), �̷��� �ؾ� js���ϰ� ������(?)  -->

<script type="text/javascript"> /* body�� ��������� ���� script�� ���� ����Ǽ� null��� */
alert(document.getElementById("bg"));
</script> 

<script type="text/javascript"> /* �Լ� ���� �� �����̰�, ���� �Լ� ������ body�±� �ȿ��� �̷�����⶧���� body object���������� ��� */
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