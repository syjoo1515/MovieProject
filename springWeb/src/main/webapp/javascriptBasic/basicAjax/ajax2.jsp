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
		var httpRequest = null /*��������  */
		function getXmlHttpRequest() {
			if (window.ActiceXObject) { /*window:���尴ü  */
				try {
					return new ActiveXObject("Msxm12.XMLHTTP");
				} catch (e) {

				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest(); //������. XMLHttpRequest�� �ʱ�ȭ��. XMLHttpRequest:��� ������ �����͸� �޾ƿ� �� ����
			}
		}//function getXmlHttpRequest    --->������ �ļ��� ��ü�� �޾ƿ��� �Լ�

		
		function view() {
			var thtemp1 = "<tr>";
			var tbtemp1 = "<tr>";
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				console.log(JSON.parse(httpRequest.responseText));
				console.log(eval(httpRequest.responseText));

				console.log(Object.keys(JSON.parse(httpRequest.responseText)[0])); //Object.keys:json���� key���� ������
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

		//Json �Ľ�-�ؽ�Ʈ ����(?)
		var empShow = function() {
			httpRequest = getXmlHttpRequest();
			console.log(httpRequest);
			httpRequest.onreadystatechange = view;
			httpRequest.open('GET', 'empJson.jsp', true);
			httpRequest.send(null);
		} //function empShow

		//Xml �Ľ�
		var studentShow = function() {
			httpRequest = getXmlHttpRequest(); //���������� ������ü ����
			/* 	console.log(httpRequest); */

			httpRequest.onreadystatechange = viewStudent;
			httpRequest.open('GET', 'board.xml', true);
			httpRequest.send(null);
		}//function studentShow


		function viewStudent() { //�ݹ��Լ� 
			var thtemp2 = "<tr>";
			var tbtemp2 = "<tr>"; 
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				var xmlData = httpRequest.responseXML;
				enter = xmlData.getElementsByTagName("board"); //�� board�� �迭�� ��ҷ� �� �迭 enter ����
				//var array=new Array(enter.length);//board�� ���̸�ŭ �迭 ����

				for (var i = 0; i < enter.length; i++) {
					var enterChilds = enter[i].childNodes; //board�� �ڽĳ��� ��-�ٵ� ���鵵 ��
					//console.log(enterChilds+' '+enterChilds.length);
					for (var j = 0; j < enterChilds.length; j++) {
						//�������� ù��° ���
						var xmlNode = enterChilds[j].nodeType;
						if (xmlNode == 1) { //nodeType 1: ��� ���. ���� �����ؼ� ����ϱ� ���� ����.
							console.log(enterChilds[j].nodeName + ' '+ enterChilds[j].firstChild.nodeValue);
						if(i==0){
							thtemp2 += "<td>" + enterChilds[j].nodeName + "</td>";
						}
							tbtemp2 += "<td>"+ enterChilds[j].firstChild.nodeValue+ "</td>";
						} 
						//�������� �ι�° ���
						/*var xmlNode=enterChilds[j].childNodes[0];
						 if(xmlNode&&typeof(xmlNode)!="undefined") //���� �����ؼ� ����ϱ� ���� ����.
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
		<p>EMPNO-JSON �Ľ�</p>
		 <table class="table table-bordered">
			<thead id="th1">
			</thead>
			<tbody id="tb1">
			</tbody>
		</table>
		
		<h2>BOARD</h2>
		<p>BOARD-XML �Ľ�</p>
		  <table class="table table-bordered">
			<thead id="th2">
			</thead>
			<tbody id="tb2">
			</tbody>
		</table>
	</div>


</body>
</html>