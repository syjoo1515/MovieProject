<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var httpRequest=null /*변수선언  */
	function getXmlHttpRequest(){
		if(window.ActiceXObject){ /*window:내장객체  */
			try{
				return new ActiveXObject("Msxm12.XMLHTTP");
			}catch (e){
				
			}
		}
		else if(window.XMLHttpRequest){
		 	return new XMLHttpRequest(); //생성자. XMLHttpRequest를 초기화함. XMLHttpRequest:모든 종류의 데이터를 받아올 수 있음
		}
	}//function
	function viewMessage(){
		console.log(httpRequest.readyState+' '+httpRequest.status);
		if(httpRequest.readyState==4&&httpRequest.status==200){  //httpRequest.readyState/status : ppt 52p 확인
			document.getElementsByTagName("div")[0].innerHTML="<B>"+httpRequest.responseText+"</B>"
			//httpRequest.responseText:요청에 대한 응답을 텍스트로 갖는 DOMString 을 반환합니다. 요청이 성공하지 못했거나 아직 전송되지 않았을 경우 null 을 반환합니다.
		}
	}
	function load(url){
		httpRequest=getXmlHttpRequest(); /*브라우저에서 엔진객체 얻어옴  */
		console.log(httpRequest); /* new XMLHttpRequest()찍힘  */
 		httpRequest.onreadystatechange=viewMessage;  /*서버가 응답 해주는 메소드를  지정해주는 콜백 함수. viewMessage는 주소이기 때문에 '' 안씀*/
		/*위 코드: 비동기에 해당하는 부분. url(여기서는 contents.jsp)의 내용을 얻어오기 위해 작업의 주체인   XMLHTTP에게 서버로부터 응답을 받을 때 까지 대기하고 있다가 다 되고 알려주면 콜백함수를 호출하겠다는 의미*/
 		/*readyState 어트리뷰트가 변경될때마다 호출되는 event handler. 이벤트를 감지해서 시스템이 어플리케이션을 부르는 콜백 함수*/
 		
 		httpRequest.open('GET',url,true); /*이부분 뭐지....  */
		httpRequest.send(null); 
	}
	function checkView(){
		if(httpRequest.readyState==4&&httpRequest.status==200){
			console.log(httpRequest.responseText);
			var checkList=httpRequest.responseText.split(",");
			var temp="";
			for(var i=0;i<checkList.length;i++){
//			console.log(checkList) ;
			temp+="<input type='checkbox' value="+checkList[i]+" name='ck' onclick='showIndex(this)'>"+checkList[i];
			}
			document.getElementById("show").innerHTML=temp;
		}
	}
 	function showIndex(obj){
 	      console.log(obj.value+' '+obj.checked);
 	      if(obj.checked&& obj.value=='application'){
 	         document.getElementById("showSpan").innerHTML="<img src='../../html/img/1.gif'>";
 	      }else if(!obj.checked&& obj.value=='application'){
 	         document.getElementById("showSpan").innerHTML="";
 	      }
 	}
	function load2(url){
		httpRequest=getXmlHttpRequest();
		httpRequest.onreadystatechange=checkView;
		httpRequest.open('GET',url,true);
		httpRequest.send(null); 
	}
</script>
</head>
<body>

<input type="button" value="contents.jsp" onclick="load('contents.jsp?state=dom')"><br>
<input type="button" value="contents.jsp" onclick="load('contents.jsp?state=click')"><br>
<input type="button" value="contents2.jsp" onclick="load2('contents2.jsp')"><br>
<div id="show"></div>
</body>
</html>