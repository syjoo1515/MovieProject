<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var httpRequest=null /*��������  */
	function getXmlHttpRequest(){
		if(window.ActiceXObject){ /*window:���尴ü  */
			try{
				return new ActiveXObject("Msxm12.XMLHTTP");
			}catch (e){
				
			}
		}
		else if(window.XMLHttpRequest){
		 	return new XMLHttpRequest(); //������. XMLHttpRequest�� �ʱ�ȭ��. XMLHttpRequest:��� ������ �����͸� �޾ƿ� �� ����
		}
	}//function
	function viewMessage(){
		console.log(httpRequest.readyState+' '+httpRequest.status);
		if(httpRequest.readyState==4&&httpRequest.status==200){  //httpRequest.readyState/status : ppt 52p Ȯ��
			document.getElementsByTagName("div")[0].innerHTML="<B>"+httpRequest.responseText+"</B>"
			//httpRequest.responseText:��û�� ���� ������ �ؽ�Ʈ�� ���� DOMString �� ��ȯ�մϴ�. ��û�� �������� ���߰ų� ���� ���۵��� �ʾ��� ��� null �� ��ȯ�մϴ�.
		}
	}
	function load(url){
		httpRequest=getXmlHttpRequest(); /*���������� ������ü ����  */
		console.log(httpRequest); /* new XMLHttpRequest()����  */
 		httpRequest.onreadystatechange=viewMessage;  /*������ ���� ���ִ� �޼ҵ带  �������ִ� �ݹ� �Լ�. viewMessage�� �ּ��̱� ������ '' �Ⱦ�*/
		/*�� �ڵ�: �񵿱⿡ �ش��ϴ� �κ�. url(���⼭�� contents.jsp)�� ������ ������ ���� �۾��� ��ü��   XMLHTTP���� �����κ��� ������ ���� �� ���� ����ϰ� �ִٰ� �� �ǰ� �˷��ָ� �ݹ��Լ��� ȣ���ϰڴٴ� �ǹ�*/
 		/*readyState ��Ʈ����Ʈ�� ����ɶ����� ȣ��Ǵ� event handler. �̺�Ʈ�� �����ؼ� �ý����� ���ø����̼��� �θ��� �ݹ� �Լ�*/
 		
 		httpRequest.open('GET',url,true); /*�̺κ� ����....  */
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