<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">



/* 	var num=100, su=50;; //var �����ϰ� �ʱⰪ ���ָ� console���� undefined�� ����, var������ num is not defined
	console.log(num);
	if(!(num>=100 && su<=50)){
		document.writeln('else');  //�ڹٽ�ũ��Ʈ�� ����Ͽ� ������ �ش� ���ڿ��� ����Ѵ�.

	}else{
		document.writeln('(num>=100 && su<=50)');
	} */
	var name;
/* 	while(true){
		name=window.prompt('LessonItem','javaScript');  //prompt('����','�Է�â') �Լ��� ����ڿ��� ������ â�� ��� �����͸� �Է¹��� �� �ִ� �Լ�
		if(name=='javaScript'){ //�ڹٽ�ũ��Ʈ�� ����� ==����
			window.alert('javaScriptChoice');  //alert('����') �ش� ������ â�� ���
		}
		else if(name=='oracle'){
			window.alert('oracleChoice');
		}else{
			window.alert('OtherChoice');
			break;
		}
	} */
/* 	do{
		name=window.prompt('LessonItem','javaScript');
		alert(name);
		if(name=='quit')
			break;
	}while(true); */
	var array=[10,20,null,5>3,[50,90]];
/* 	for(var i=0;i<array.length;i++){
		console.log(array[i]);
	} */
/* 	for(var i in array){  //i�� array�� �ε��� ��ȯ
		if(i%2==0)
		console.log(i+" :"+array[i]);
	} */
/* 	var obj={'name':'���¶�','addr':'�Ǳ�','major':'�ɸ�'};
	console.log(obj.name+' '+obj.addr); */
	var objArray=[{'name':'���¶�','addr':'�Ǳ�','major':'�ɸ�'}, // Dictionary: �����͸� key�� value�� �����ϴ� �ڷᱸ�� [{key:value,key:value},{key:value,key:value}]
				{'name':'������','addr':'����','major':'�İ�'},
				{'name':'������','addr':'����','major':'�İ�'},
				{'name':'�ּҿ�','addr':'��õ','major':'���'}];
/* 	for(var i=0;i<array.length;i++){
		for(var key in objArray[i]){
			alert(key+":"+objArray[i][key]);
		}
	}
	 */
	for(var i in objArray){
		for(var key in objArray[i]){
			alert(key+":"+objArray[i][key]);
		}
	}

	
	
</script>
</head>
<body>

</body>
</html>