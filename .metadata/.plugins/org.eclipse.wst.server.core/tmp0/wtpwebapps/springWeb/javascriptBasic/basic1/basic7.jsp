<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
/* var say='hi';
function showFun1(){
	console.log('showFun1');
	console.log(say); //say�� �� �����ʰ� ������ undifined ����
}
function showFun2(){
	cnt=50;  //var�� ���� ��������, var�� ���� �������� ((�ڹٿ� �޸� �Լ��ȿ��� �������� ���� �� ����))
	var cnt=90; //���������� ���𺯼��� �̸��� ���� ��� ���������� �켱���� �� ����-cnt�� ���������� �Ǵ°�
	console.log('showFun2 cnt='+cnt);
	showFun3(); //���� cnt�� ���������̸� showFun3�� cnt���� �������� �������̱� ������ ������. ���������� ��쿡�� ������ �ȳ� 
}
function showFun3(){ //�� �Ŀ��� cnt�� ���������̴��� showFun3()�� ȣ���Ұ�� cnt�� ���ǵ��� �ʾƼ� ������
	console.log('showFun3 cnt='+cnt); 
	console.log('showFun3 cnt2='+cnt2); //cnt2�� �Լ� �ٱ��κп� ����Ǿ �������� ����(var�̿���)
}
var cnt2=100;
showFun2();
showFun3(); */

 function showFunction(param){ //�ڹٽ�ũ��Ʈ�� �����ε� �ȵ�-�������� �� ������ �Լ��� ȣ���(�Ķ���Ϳ� ���� ȣ��Ǵ°� �ƴ�)
	alert('showFunction(param)');
} 
 function showFunction(){ //���ڰ� �־ �갡 ȣ���
	alert('showFunction'+arguments.length);
	for(i in arguments){
		console.log(arguments[i]); //argument�� object ���·� �Ǿ��־� �̷������� ������ ���� �� ��� ����
	}
} 
//�׷� �ڹٽ�ũ��Ʈ������ ���� �Ķ���� �� �ʿ� ���°ǰ�?-�ƴ��� �Ķ���ͷ� ������ �����Ϸ��� �����
showFunction(10);
showFunction(10,20);
showFunction(10,20,30, 3.5, 'hi',5>3);
</script>
</head>
<body>

</body>
</html>