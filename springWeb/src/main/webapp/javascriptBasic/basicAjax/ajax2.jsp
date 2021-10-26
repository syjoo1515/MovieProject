<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<button onclick="empShow()">EMP</button>
	<button onclick="studentShow()">BOARD</button>
	
	
	<script type="text/javascript">
		var httpRequest = null /*변수선언  */
		function getXmlHttpRequest() {
			if (window.ActiceXObject) { /*window:내장객체  */
				try {
					return new ActiveXObject("Msxm12.XMLHTTP");
				} catch (e) {

				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest(); //생성자. XMLHttpRequest를 초기화함. XMLHttpRequest:모든 종류의 데이터를 받아올 수 있음
			}
		}//function getXmlHttpRequest    --->브라우저 파서를 객체로 받아오는 함수

		
		function view() {
			var thtemp1 = "<tr>";
			var tbtemp1 = "<tr>";
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				console.log(JSON.parse(httpRequest.responseText));
				console.log(eval(httpRequest.responseText));

				console.log(Object.keys(JSON.parse(httpRequest.responseText)[0])); //Object.keys:json에서 key값을 가져옴
				for ( var i in Object.keys(JSON.parse(httpRequest.responseText)[0])) {
					console.log(Object.keys(JSON.parse(httpRequest.responseText)[0])[i]);
					thtemp1 += "<td>"+ Object.keys(JSON.parse(httpRequest.responseText)[0])[i]+ "</td>";
				}
				thtemp1 += "</tr>";
				document.getElementById("th1").innerHTML = thtemp1;

				console.log(Object.values(JSON.parse(httpRequest.responseText)));

				for ( var i in (JSON.parse(httpRequest.responseText))) {
					for ( var j in (JSON.parse(httpRequest.responseText))[i]) {
						console.log((JSON.parse(httpRequest.responseText))[i][j]);
						tbtemp1 += "<td>"+ (JSON.parse(httpRequest.responseText))[i][j]+ "</td>";
					}
					tbtemp1 += "</tr><tr>"
				}
				tbtemp1 += "</tr>";
				document.getElementById("tb1").innerHTML = tbtemp1;
			}
		}//function view

		//Json 파싱-텍스트 형태(?)
		var empShow = function() {
			httpRequest = getXmlHttpRequest();
			console.log(httpRequest);
			httpRequest.onreadystatechange = view;
			httpRequest.open('GET', 'empJson.jsp', true);
			httpRequest.send(null);
		} //function empShow

		//Xml 파싱
		var studentShow = function() {
			httpRequest = getXmlHttpRequest(); //브라우저에서 엔진객체 얻어옴
			/* 	console.log(httpRequest); */

			httpRequest.onreadystatechange = viewStudent;
			httpRequest.open('GET', 'board.xml', true);
			httpRequest.send(null);
		}//function studentShow


		function viewStudent() { //콜백함수 
			var thtemp2 = "<tr>";
			var tbtemp2 = "<tr>"; 
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				var xmlData = httpRequest.responseXML;
				enter = xmlData.getElementsByTagName("board"); //각 board가 배열의 요소로 들어간 배열 enter 생성
				//var array=new Array(enter.length);//board의 길이만큼 배열 생성

				for (var i = 0; i < enter.length; i++) {
					var enterChilds = enter[i].childNodes; //board의 자식노드들 들어감-근데 공백도 들어감
					//console.log(enterChilds+' '+enterChilds.length);
					for (var j = 0; j < enterChilds.length; j++) {
						//공백제거 첫번째 방법
						var xmlNode = enterChilds[j].nodeType;
						if (xmlNode == 1) { //nodeType 1: 요소 노드. 공백 제거해서 출력하기 위해 쓴다.
							console.log(enterChilds[j].nodeName + ' '+ enterChilds[j].firstChild.nodeValue);
						if(i==0){
							thtemp2 += "<td>" + enterChilds[j].nodeName + "</td>";
						}
							tbtemp2 += "<td>"+ enterChilds[j].firstChild.nodeValue+ "</td>";
						} 
						//공백제거 두번째 방법
						/*var xmlNode=enterChilds[j].childNodes[0];
						 if(xmlNode&&typeof(xmlNode)!="undefined") //공백 제거해서 출력하기 위해 쓴다.
						 console.log(xmlNode); */
					}//for
					tbtemp2+="<tr></tr>"
				}//for
 				thtemp2 += "</tr>";
				document.getElementById("th2").innerHTML = thtemp2;
				tbtemp2 += "</tr>"
				document.getElementById("tb2").innerHTML = tbtemp2; 
			}
		} //function viewStudent
	</script>
	<div class="container">
		<h2>EMPNO</h2>
		<p>EMPNO-JSON 파싱</p>
		 <table class="table table-bordered">
			<thead id="th1">
			</thead>
			<tbody id="tb1">
			</tbody>
		</table>
		
		<h2>BOARD</h2>
		<p>BOARD-XML 파싱</p>
		  <table class="table table-bordered">
			<thead id="th2">
			</thead>
			<tbody id="tb2">
			</tbody>
		</table>
	</div>


</body>
</html>