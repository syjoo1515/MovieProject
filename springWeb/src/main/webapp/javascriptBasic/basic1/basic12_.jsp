<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
/* 	var array=[10,'string',10.5, null, new Date(),function(){alert(alert('testAction'))},
		{관심:[{title:'java',contents:['variable','operator','control']}]},'oracle','xml','spring','python','android'];
	console.log(array); */
	var objectType1=function(){
		var h2=document.getElementById("title");
		h2.innerHTML="StudentTable Action";
		function Student(name,eng,mat,kor){//함수일 수도 있고 클래스일 수도 있음-?
			//alert('function Student(name,eng,mat,kor)');
		this.name=name; 
		this.국어=kor; //국어라는 메모리가 자동으로 생성되어 json의 키값이 된다. 받은 인자(kor)가 value에 들어감
		this.eng=eng;
		this.수학=mat;
		this.getTotal=function(){
			return this.국어+this.eng+this.수학;
		};
		this.getAvg=function(){
			return this.getTotal()/3;
		};
		this.toString=function(){
			return this.name+' '+this.국어+' '+this.eng+' '+this.수학+' '+this.getTotal()+' '+this.getAvg();
		};
		}
		var students=[];
		var student1=new Student('민지',100,90,80); //클래스와 같이 new해서 호출 가능
		var student2=new Student('일원',100,100,80); 
		var student3=new Student('미래',90,80,80); 
		var student4=new Student('우진',80,90,80);
		//console.log(student1.name+' '+student1.국어+' '+student1.eng+' '+student1.수학);
		students.push(student1);
		students.push(student2);
		students.push(student3);
		students.push(student4);
		
/* 		for(var i in students){
			alert(students[i].toString()); //여기서 .toString 했을 때 toString함수가 실행되는 원리? 가 이해가 안됨ㅠ
		} */

	}
	

	var objectType2=function(){
		var h2=document.getElementById("title");
		var trhead=document.getElementById("emphead");
		var head=['EMPNO','ENAME','SAL','JOB','HIREDATE','DEPTNO'];  //ctrl+shift+x:문자열 upper
		
		for(var i=0;i<head.length;i++){
			th=document.createElement("th"); //이렇게 하면 하나의 <th>가 만들어짐
			 contents=document.createTextNode(head[i]);
				th.appendChild(contents);
				trhead.appendChild(th);
				console.log(th);
			
// 			this.appendChild(head[i]); //th에 head요소들을 for문을 통해 모두 넣음
//			trhead.appendChild(th); //tr에 th넣음 
		}

		
		h2.innerHTML="EmpTable Action";  //이거 왜한거?
		function Emp(empno,ename,sal,job,hiredate,deptno){
			this.사번=empno;
			this.이름=ename;
			this.연봉=sal;
			this.직업=job;
			this.입사일=hiredate;
			this.부서=deptno;
		}
		var emps=[new Emp(7788,'이지수',8000,'의사','2020/05/01',10),
				  new Emp(7789,'태라',9000,'간호사','2001/05/01',20),
				  new Emp(7789,'경진',9000,'간호사','2001/05/01',20),
				  new Emp(7789,'유주',9000,'간호사','2001/05/01',20)];
		console.log(emps);
		tbody=document.getElementById("body");
		for(var i in emps){
			tr=document.createElement("tr");
			for(var j in emps[i]){
				console.log(j+":"+emps[i][j]);
				var td=document.createElement("td");
				var textnode=document.createTextNode(emps[i][j]); //td안에 textnode 들어감
				td.appendChild(textnode);
				tr.appendChild(td);
			}
			tbody.appendChild(tr);
		}
	}
 	var objectType2_1=function(){
		document.getElementById("emphead").innerHTML=null;
		document.getElementById("body").innerHTML=null;
	} 
</script>

</head>
<body>
<button onclick="objectType1()">Student</button>
<button onclick="objectType2()" ondblclick="objectType2_1()">Emp</button><br><br><br>
<div class="container">
  <h2 id="title">Table</h2> <!-- h2가 뭐지 -->
  <p>The .table-hover class enables a hover state on table rows within a tbody:</p>                              
  <table class="table table-hover">
    <thead>
      <tr id="emphead">
      
      </tr>
      
      
    </thead>
    <tbody id="body">
<!--       <tr>
        <td>1</td>
        <td>Anna</td>
      </tr> -->
      
    </tbody>
  </table>
</div>

</body>
</html>