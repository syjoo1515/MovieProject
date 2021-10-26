<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var showObject=function(){
		var person={name:'유주',
					addr:['서울',['해운대','광안리','태종대'],'전주'],
					eat:function(food){
						alert(this.name+'가 '+this.addr[1][parseInt(Math.random()*3)]+'에서 '+food+'를 먹어요');
						
					}//eat:function의 괄호
					
		
		}; //showObject function의 괄호
		person.eat('만두');
	}
	function showStudent(){
		var students=[{name:'운영',kor:95,eng:85,mat:100, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'유주',kor:75,eng:100,mat:100, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'래현',kor:100,eng:85,mat:90, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'형권',kor:65,eng:90,mat:70, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}},
					 {name:'형권',kor:100,eng:100,mat:65, avg:function(){retrun (this.kor+this.eng+this.mat)/3.0}}
					]; 

		var body="";
		for(var i in students){ //in 연산자: 배열 안에 있는 모든 요소들 반복(0~4)
		console.log(students[i].avg()); //이거 왜 안됨?ㅠㅠ
			body+="<tr><td>"+students[i].name+"</td><td>"+students[i].kor+"</td><td>"+students[i].eng+"</td><td>"+students[i].mat+"</td><td>"+students[i].avg+"</td></tr>";
					//왜 "" 하는건지
			
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
	lesson.addr='강남';
	console.log(lesson.time+' '+lesson['time']); */
	
</script>
</head>
<body>
<input type="button" value="Person" ondblclick="showObject()">
<input type="button" value="Student" ondblclick="showStudent()">
<table border=1 id="tbl" style="visiblity:hidden">
	<tr>
		<th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th>
	</tr>
	<tbody id="tableStudent"></tbody>
</table>
</body>
</html>