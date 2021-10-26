<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//모델1
	function sendAjax(){
		$.ajax({
			url: '/firstweb/ajaxInsert.do4?cmd=ajaxInsert',
			type:'POST',
			contentType:'application/x-www-form-urlencoded;charset=UTF-8',
			dataType:'json',
/* 			data:{name:$("input#name").val(),
				  email:$("input#email").val(),
				  pwd:$("input#pwd").val()
			}, */
			data:$("form#frm").serialize(), //serialize: form에 있는 데이터를 모두 직렬화해서 보낼 수 있음
			success:function(result){
				console.log(result); //result: 성공시 AjaxEx8Data
				$(result).each(function(index,dom){
					var tr=document.createElement("tr");
					for(var i in dom){
						var td=document.createElement("td");
						td.appendChild(document.createTextNode(dom[i]));
                        tr.appendChild(td);
					}
					document.getElementById("tb").appendChild(tr);
				});
			}
		});
	}
  $(function(){
     $("button").click(function(){
    	 sendAjax();
     });
  });
 </script> 
</head>
<body>

<div class="container">
  <h2>Ajax Form Insert</h2>
  <form enctype="application/x-www-form-urlencoded" name="frm" id="frm">
  <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    
    <button type="button" class="btn btn-default">Submit</button>
    <button type="button" class="btn btn-default"></button>
  </form>
</div>

<div class="container">
  <h2>Ajax</h2>
  <p>DB에 저장한 데이터 뿌리기</p>                              
  <table class="table table-hover">
    <thead>
      <tr>
        <th>NO</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>PWD</th>
        <th>REGDATE</th>
      </tr>
    </thead>
    <tbody id='tb'>
    </tbody>
  </table>
</div>

</body> 
</html>