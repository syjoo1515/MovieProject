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
		{����:[{title:'java',contents:['variable','operator','control']}]},'oracle','xml','spring','python','android'];
	console.log(array); */
	var objectType1=function(){
		var h2=document.getElementById("title");
		h2.innerHTML="StudentTable Action";
		function Student(name,eng,mat,kor){//�Լ��� ���� �ְ� Ŭ������ ���� ����-?
			//alert('function Student(name,eng,mat,kor)');
		this.name=name; 
		this.����=kor; //������ �޸𸮰� �ڵ����� �����Ǿ� json�� Ű���� �ȴ�. ���� ����(kor)�� value�� ��
		this.eng=eng;
		this.����=mat;
		this.getTotal=function(){
			return this.����+this.eng+this.����;
		};
		this.getAvg=function(){
			return this.getTotal()/3;
		};
		this.toString=function(){
			return this.name+' '+this.����+' '+this.eng+' '+this.����+' '+this.getTotal()+' '+this.getAvg();
		};
		}
		var students=[];
		var student1=new Student('����',100,90,80); //Ŭ������ ���� new�ؼ� ȣ�� ����
		var student2=new Student('�Ͽ�',100,100,80); 
		var student3=new Student('�̷�',90,80,80); 
		var student4=new Student('����',80,90,80);
		//console.log(student1.name+' '+student1.����+' '+student1.eng+' '+student1.����);
		students.push(student1);
		students.push(student2);
		students.push(student3);
		students.push(student4);
		
/* 		for(var i in students){
			alert(students[i].toString()); //���⼭ .toString ���� �� toString�Լ��� ����Ǵ� ����? �� ���ذ� �ȵʤ�
		} */

	}
	

	var objectType2=function(){
		var h2=document.getElementById("title");
		var trhead=document.getElementById("emphead");
		var head=['EMPNO','ENAME','SAL','JOB','HIREDATE','DEPTNO'];  //ctrl+shift+x:���ڿ� upper
		
		for(var i=0;i<head.length;i++){
			th=document.createElement("th"); //�̷��� �ϸ� �ϳ��� <th>�� �������
			 contents=document.createTextNode(head[i]);
				th.appendChild(contents);
				trhead.appendChild(th);
				console.log(th);
			
// 			this.appendChild(head[i]); //th�� head��ҵ��� for���� ���� ��� ����
//			trhead.appendChild(th); //tr�� th���� 
		}

		
		h2.innerHTML="EmpTable Action";  //�̰� ���Ѱ�?
		function Emp(empno,ename,sal,job,hiredate,deptno){
			this.���=empno;
			this.�̸�=ename;
			this.����=sal;
			this.����=job;
			this.�Ի���=hiredate;
			this.�μ�=deptno;
		}
		var emps=[new Emp(7788,'������',8000,'�ǻ�','2020/05/01',10),
				  new Emp(7789,'�¶�',9000,'��ȣ��','2001/05/01',20),
				  new Emp(7789,'����',9000,'��ȣ��','2001/05/01',20),
				  new Emp(7789,'����',9000,'��ȣ��','2001/05/01',20)];
		console.log(emps);
		tbody=document.getElementById("body");
		for(var i in emps){
			tr=document.createElement("tr");
			for(var j in emps[i]){
				console.log(j+":"+emps[i][j]);
				var td=document.createElement("td");
				var textnode=document.createTextNode(emps[i][j]); //td�ȿ� textnode ��
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
  <h2 id="title">Table</h2> <!-- h2�� ���� -->
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