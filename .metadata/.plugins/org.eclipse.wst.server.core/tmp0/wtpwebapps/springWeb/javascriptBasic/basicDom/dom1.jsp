<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* document:��ü �����͸� ����Ŵ(HTML����) */

/*ù��° ���  */
/* 	var img=document.createElement('img') //������ ������ ��üȭ��Ų��: dom, img:����� �ּ�
	var br=document.createElement('br') //br�±� �������
	img.src='../../html/img/1.gif';
	img.width=300;
	img.height=300;
	
	function hideImage(){
		document.body.removeChild(br);
		document.body.removeChild(img);
		
	}
	function showImage(){
		document.body.appendChild(br);
		document.body.appendChild(img);
	} */
	
/*�ι�° ���  */
/* 	function hideImage(){
		document.getElementById("imgDiv").innerHTML="";
	}
	function showImage(){
		document.getElementById("imgDiv").innerHTML="<img src='../../html/img/1.gif'>";
	} */

	
/*������ ���  */
	function hideImage(){
	document.getElementById("imgDiv").style.visibility='hidden';
}
	function showImage(){
	document.getElementById("imgDiv").style.visibility='visible'
} 
	
</script>
</head>
<body>

	<input type="button" value="hideImage" onclick="hideImage()">
	<input type="button" value="showImage" onclick="showImage()"><br>
	<!-- <div id="imgDiv"></div> -->
	<img id="imgDiv" alt="" src="../../html/img/1.gif" style="visibility:hidden;">
	<table border="1">
		<tr><td><img alt="" src="../../html/img/1.gif" width="100"></td><td><img alt="" src="../../html/img/2.jpg" width="100"></td></tr>
		<tr><td><img alt="" src="../../html/img/4.jpg" width="100"></td><td><img alt="" src="../../html/img/5.jpg" width="100"></td></tr>
</table>
</body>
</html>