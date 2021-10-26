<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* document:전체 데이터를 가리킴(HTML문서) */

/*첫번째 방법  */
/* 	var img=document.createElement('img') //문서의 구조를 객체화시킨것: dom, img:노드의 주소
	var br=document.createElement('br') //br태그 만들어짐
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
	
/*두번째 방법  */
/* 	function hideImage(){
		document.getElementById("imgDiv").innerHTML="";
	}
	function showImage(){
		document.getElementById("imgDiv").innerHTML="<img src='../../html/img/1.gif'>";
	} */

	
/*세번재 방법  */
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