<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
   var showObject=function(){
      var dog={name:'ġŸ', 
            addr:['����',['�ؿ��','���ȸ�','������'],'����'],
            eat:function(food) {
               alert(this.name+'�� '+this.addr[1][parseInt(Math.random()*3)]+'���� '+food+'�� �Ծ��');
            }
      }; // ��ü
      dog.eat('����');
   }
   function showStudent(){
      friends =[{name:'ġŸ',kor:100, eng:95, mat:90},
                 {name:'�丮',kor:90, eng:90, mat:100},
                 {name:'����',kor:80, eng:85, mat:85},
                 {name:'����',kor:85, eng:90, mat:95},
                 {name:'�κ�',kor:80, eng:95, mat:100},
                  ];
   for(var i in friends){ //in�� �����ʿ� �ּҰ�
      for(var j in friends[i]){ //json (name, kor, eg, mat)
         //console.log(j+':'+friends[i][j])
         
         } 
      }
   score(this);
   }
   
   function score(obj){
            var total=0; var avg=0;
            var body = "";
      for(var i in friends){
             total =friends[i].kor+friends[i].eng+friends[i].mat;
             avg=total/3;
            console.log(friends[i].name+'total: '+total+'avg:'+avg);
             body += "<tr><td>"+friends[i].name+"</td><td>"+total+"</td><td>"+avg+"</td></tr>";
            
      }
      var tb=document.getElementById("tfriends");
      var tbody=document.getElementById("tbody");
      tb.style.visibility='visible';
      var temp="<tr><th>name</th><th>total</th><th>avg</th></tr>";
      
      document.getElementById("th").innerHTML=temp;
      document.getElementById("tbody").innerHTML=body;   
   }
   
   
   function deleteStudent(){
      document.getElementById("th").innerHTML=null;
      document.getElementById("tbody").innerHTML=null;
      var tb=document.getElementById("tfriends");
      tb.style.visibility='hidden';
   }
   
</script>
</head>
<body>
<input type="button" value="Dog" ondblclick="showObject()">
<input type="button" value="Dog_friends" onclick="showStudent()" ondblclick="deleteStudent()">
<table id="tfriends" id="tb" bordercolor="coral" align="center"  border="1" width="80%" cellpadding="0" cellspacing="0" style="visibility: hidden;">
   <thead id="th">
   </thead>
   <tbody id="tbody">
   </tbody>

</table>