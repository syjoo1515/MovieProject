<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>



</head>
<body>
	<input type="button" value="click1" onclick="clickk()">
	<input type="button" value="click2" onclick="clickk()">
</body>
<script type="text/javascript">
	var str=new Date();
	function clickk(){  //�����Լ� //���ϰ� ���� �����൵ ��-�ڹٽ�ũ��Ʈ�� variable�̶�
		alert('click1');
		return 10+50;
	}
	var num=clickk();//�̰� ���� ���� �����-�������� ������ �ڹٽ�ũ��Ʈ�κ��� ���� ���� ����ǳ���
	alert(num); 
	
 	var click2=function(){ //�͸��Լ�. click�� function�� �ּ� �����
		alert('click2');
		return function(){
			alert('return1 function');
			return function(){
				alert('return2 function');
			}
		}
	}  
/*  	click2(); //alert('click2');��������
 	click2()(); //alert('return1 function');��������
 	click2()()(); //alert('return2 function');�������� */
 	
 	
 	  var type1='hello';
 	  var type2=100;
 	  var type3=function (){};
 	  var type4={'lesson':'javaScipt'};   //json {key,value}
 	  console.log(typeof(type1)=='string');
 	  console.log(typeof(type2)=='number');
 	  console.log(typeof(type3)=='function');
 	  console.log(typeof(type4)=='object');
 	  console.log(type4.lesson+' '+type4['lesson']); 
 	  //JSON ������ ����- ������.����Ű �Ǵ� ������['����Ű']
 	
</script>
</html>