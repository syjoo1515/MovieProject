<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button#stud").click(function(){
/* 			$.ajax({
				url:'/Web/studentList.do',
				type:'POST',
				dataType:'json',
				success:function(v){
					$.each(v,function(index,dom){
 						$("tbody").append("<tr id="+index+">");
						$.each(dom,function(index2,item){
							$("tr#"+index).append("<td>"+item+"</td>");
						console.log(item);
						}); 
						$("tbody").append("</tr>");
					});
				},
				error:function(e){
					alert('error'+e);
				}
			}) */
			$.ajax({
				url:'/Web/studentList2.do',
				type:'POST',
				dataType:'json',
				success:function(v){
					$.each(v,function(index,dom){
 						$("tbody").append("<tr id="+index+">");
						$.each(dom,function(index2,item){
							$("tr#"+index).append("<td>"+item+"</td>");
						console.log(item);
						}); 
						$("tbody").append("</tr>");
					});
				},
				error:function(e){
					alert('error'+e);
				}
			})
		});
		$("button#emp").click(function(){
			$.ajax({
				url:'/Web/Emplist.do',
				type:'POST',
				dataType:'json',
				success:function(v){
					console.log(v);
				},
				error:function(e){
					alert('error'+e);
				}
			});
		});
		$("button#dept").click(function(){
			$.ajax({
				url:'/Web/DeptInfo.do',
				type:'POST',
				data:{no:10},
				dataType:'json',
				success:function(v){
					console.log(v);
				},
				error:function(e){
					alert('error'+e);
				}
			});
		});
	});
</script>
</head>
<body>
<button id="stud">Student</button>
<button id="emp">emp</button>
<button id="dept">dept</button>

<div class="container">
  <h2>Spring Ajax</h2>
  <p></p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>studno</th>
        <th>name</th>
        <th>userid</th>
        <th>grade</th>
        <th>idnum</th>
        <th>birthdate</th>
        <th>tel</th>
        <th>height</th>
        <th>weight</th>
        <th>deptno</th>
        <th>profno</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</body>
</html>