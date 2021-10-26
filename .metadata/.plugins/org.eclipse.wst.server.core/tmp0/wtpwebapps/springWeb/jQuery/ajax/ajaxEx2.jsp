<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function ajaxProcess(url, dataType, type) {
			$.ajax({
				url : url,
				dataType : dataType,
				type : type,
				success : function(value) {
					if(dataType=='text')
					$("span#show").text(value);
					if(dataType=='json'){
						$(value).each(function(index,dom){  /*dom요소로 json객체 들어감  */
							console.log(index+' '+dom.empno+' '+dom['empno']);  /*json value가져오는 두 가지 방식  */
							console.log(index+' '+dom.ename);
							console.log(index+' '+dom.sal);
							console.log(index+' '+dom.job);
							
						});

						/* for(var i in value){
							for(var j in value[i]){
								console.log(j+' '+value[i][j]);
								$("span#show").append(j+' '+value[i][j]);
							}
						} */  /*이렇게 for문으로 가져오지 만고 위의  jQuery each문 활용하기  */
						
					}//if
				}
			})
	}
	
	function ajaxData(){
		
	}

	$(function() {
		$("button").click(function() {
				if (this.id == 'btn1') {
					ajaxProcess('/firstweb/jQuery/ajaxData/dataValue1.jsp','text', 'POST');
				} else if (this.id == 'btn2') {
					ajaxProcess('/firstweb/javascriptBasic/basicAjax/contents2.jsp','text', 'POST');
				} else if (this.id == 'btn3') {
					ajaxProcess('/firstweb/javascriptBasic/basicAjax/empJson.jsp','json', 'POST');
				}
		 });
	});
</script>
</head>
<body>
	<button id="btn1">Text1</button>
	<button id="btn2">Text2</button>
	<button id="btn3">Text3</button>
	<br>
	<span id="show"></span>
	
	<table></table>
</body>
</html>