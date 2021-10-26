<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
var httpRequest=null;
function getXmlHttpRequest(){
      if(window.ActiveXObject){            
            try {
            return new ActiveXObject("Msxml2.XMLHTTP");
           }catch (e) {
            // TODO: handle exception
          } 
      } else if(window.XMLHttpRequest){         
         return new XMLHttpRequest();
      } 
      
}//FUNCTION
function view(){
   if(httpRequest.readyState==4&&httpRequest.status==200){
       xmlDom=httpRequest.responseXML;
      //console.log(xmlDom);
      printInfo();
   }
}
var twitters=[];  //XML �����͸� JSON���·� ��ȯ�� ����  twitters�� ��������
function printInfo(){
   console.log(xmlDom);
   var status_list=xmlDom.getElementsByTagName("status"); //�� status�� ��ҷ� �� �迭 status_list ����
   for(var i=0;i<status_list.length;i++){
      var status_nodes=status_list[i].childNodes; //childNodes: �ڽĳ�带 ��帮��Ʈ�� ��ȯ�ϱ� ������ status_nodes�� status�� �ڽĳ��� ��-�ٵ� ���鵵 ��
      var twitter={};  
      for (var x=0;x<status_nodes.length;x++){
         var node=status_nodes[x];
         if(node.nodeType==1){  //nodeType 1: ��� ���. ���� �����ؼ� ����ϱ� ���� ����. (�ؽ�Ʈ/������ 3)
            var currentName=node.nodeName;            
            if(currentName=='created_at'||currentName=='id'||currentName=='text'){
              // console.log(currentName+' '+node.firstChild.nodeValue);
               twitter[currentName]=node.firstChild.nodeValue;
               //twitter[currentName]  twitter['created_at'] twitter.created_at
            }else if(currentName=='user'){
               var user_object=getUserObject(node.childNodes);
               //console.log(user_object);
               twitter['userId']=user_object.id;
               twitter['userName']=user_object.name;
               twitter['screen_name']=user_object.screen_name;
               twitter['location']=user_object['location'];            
            }
         }//if
         
      }//for
      twitters.push(twitter);
   }//for
   drawTwitters();

}
function drawTwitters(){
	//���̺� head�κп� twitters�� key�� �ֱ�
	var trhead=document.getElementById("head"); //���̺� head�κ� 
	var keyValue=Object.keys(twitters[0]); //Object.keys:json���� key���� �����ͼ� ����
	console.log(keyValue); //key�� ����Ȱ� Ȯ��
	for(var i=0;i<keyValue.length;i++){ 
		th=document.createElement("th"); //<th>�� ��������� ���� ����
		contents=document.createTextNode(keyValue[i]);
		th.appendChild(contents);
		trhead.appendChild(th);
	}
	
	//���̺� body�κп� twitters�� value�� �ֱ�
     for(var i in twitters){
     	tr=document.createElement("tr");
        for(var j in twitters[i]){
          // console.log(j+' '+twitters[i][j]);
           var td=document.createElement("td");
			var textnode=document.createTextNode(twitters[i][j]); //td�ȿ� textnode ��
			td.appendChild(textnode);
			tr.appendChild(td);
		}
		body.appendChild(tr);
     }
}


function getUserObject(user_nodes){
   var user_vo={};
   for(var i=0;i<user_nodes.length;i++){
      var node=user_nodes[i];
      if(node.nodeType==1){
         if(node.nodeName=='id' ||node.nodeName=='name'||node.nodeName=='screen_name'||node.nodeName=='location'){
            user_vo[node.nodeName]=node.firstChild.nodeValue;
         }//if
      }//if
   }//for
   return user_vo;
}
  function load(){
     httpRequest=getXmlHttpRequest();
     httpRequest.onreadystatechange=view;
     httpRequest.open('GET','twitter.xml',true);
     httpRequest.send(null);
  }
  
  function remove(){ //�ڽĳ�� ��� ����� ���
	  while ( head.hasChildNodes() ){
	  head.removeChild(head.firstChild);
	  }
	  while(body.hasChildNodes()){
	  body.removeChild(body.firstChild);
	  }
  }
  

</script>
</head>
<body>
<input type="button" value="Twitter" onclick="load()">
<input type="button" value="Twitterremove" onclick="remove()">

<div class="container">
  <h2 id="title">Twitter</h2> 
  <p>Ʈ���� ���� �ҷ�����</p>                              
  <table class="table table-hover">
    <thead>
      <tr id="head">
      
      </tr>
      
      
    </thead>
    <tbody id="body">

      
    </tbody>
  </table>
</div>
</body>
</html>
