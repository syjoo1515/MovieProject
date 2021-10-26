<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function ajax(v){
		
	}

	function ajaxProc(url,type, dataType){
		$.ajax({
				url:url, type:type, dataType:dataType,
				success:function(v){
					$(v).each(function(index,dom){
						console.log(index+' '+dom);
					});
				}
				});

	}
	$(function(){
		$("BUTTON").dblclick(function(){
			//console.log(this.id,this.lang,this.name)
			ajaxProc(this.id,this.lang,this.name);
		});
	});
</script>
</head>
<body>
	<button id="/firstweb/student.do3?cmd=stud" lang="GET" name="text">STUDENT</button>
	<button id="/firstweb/professor.do3?cmd=professor" lang="GET" name="text">PROFESSOR</button>
	<br>
	<div></div>
	<table>
		<thead>
		<tr id="theadtr">
		</tr>
		</thead>
	
	</table>
	
</body>
</html>