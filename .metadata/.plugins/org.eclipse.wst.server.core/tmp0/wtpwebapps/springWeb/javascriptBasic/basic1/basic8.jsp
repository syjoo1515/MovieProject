<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* 	function sayMessage(base, height){ //�����Լ�
			return base*height/2
		}
	console.log(sayMessage(100,5)); */

/* 	var sayMessage=function(base, height){ //�͸��Լ�
		return base*height/2;
	}
	console.log(sayMessage(100,5)); */
	
	var sayMessage=new Function('base','height','return base*height/2;'); //function�� ��üȭ��Ų ���. �̷������ε� ��������
	console.log(sayMessage(100,5)); 
	
/* 	var param='height, width';
	var formula='return height*width/2';
	var diamond=new Function(param, formula);  //function�� ��üȭ��Ų ���. �̷������ε� ��������22
	console.log(diamond(100, 5)); */
 	function showMessage(value){
		if(arguments.length!=showMessage.length) //�Ķ���Ϳ� �ƱԸ�Ʈ ���� ���� �ٸ���� �Ʒ� ���� �ֿܼ� ���� alert ����
			throw new Error('�μ��� ���� �ٸ���  '+arguments.length);
		alert('showMessage');
	}
	showMessage(); 
	
</script>
</head>
<body>

</body>
</html>