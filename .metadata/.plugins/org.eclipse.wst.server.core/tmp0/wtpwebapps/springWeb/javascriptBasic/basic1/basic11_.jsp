<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var showObject=function(){
		var person={name:'����',
					addr:['����',['�ؿ��','���ȸ�','������'],'����'],
					eat:function(food){
						alert(this.name+'�� '+this.addr[1][parseInt(Math.random()*3)]+'���� '+food+'�� �Ծ��');
						
					}//eat:function�� ��ȣ
					
		
		}; //showObject function�� ��ȣ
		person.eat('����');
	}
	function showStudent(){
		var students=[{name:'�',kor:95,eng:85,mat:100, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'����',kor:75,eng:100,mat:100, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'����',kor:100,eng:85,mat:90, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'����',kor:65,eng:90,mat:70, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'����',kor:100,eng:100,mat:65, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}}
					]; 

		var body="";
		for(var i in students){ //in ������: �迭 �ȿ� �ִ� ��� ��ҵ� �ݺ�(0~4)
		console.log(students[i].avg()); //�̰� �� �ȵ�?�Ф�
			body+="<tr><td>"+students[i].name+"</td><td>"+students[i].kor+"</td><td>"+students[i].eng+"</td><td>"+students[i].mat+"</td><td>"+students[i].avg+"</td></tr>";
					//�� "" �ϴ°���
			
			//				console.log(j+' '+students[i][j]+' '+typeof(students[i][j]));
		}
		document.getElementById("tbl").style.visibility='visible';
		document.getElementById("tableStudent").innerHTML=body;
	}
	function avgStudent(){
		
		
	}
/* 	var lesson={};
	lesson.time=8;
	lesson.title='javaLesson';
	lesson.addr='����';
	console.log(lesson.time+' '+lesson['time']); */
	
</script>
</head>
<body>
<input type="button" value="Person" ondblclick="showObject()">
<input type="button" value="Student" ondblclick="showStudent()">
<table border=1 id="tbl" style="visiblity:hidden">
	<tr>
		<th>�̸�</th><th>����</th><th>����</th><th>����</th><th>���</th>
	</tr>
	<tbody id="tableStudent"></tbody>
</table>
</body>
</html>