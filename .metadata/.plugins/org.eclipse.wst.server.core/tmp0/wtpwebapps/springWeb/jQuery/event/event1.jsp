<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.question{
	color:white;
	background: gray;
	font-size: 20px;
}
.answer{
	color:white;
	background: pink;
	font-size: 20px;

}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(function(){
    $(".question").css("cursor",'pointer');
    $(".answer").hide();
    $(".question").each(function(index){
      $(this).click(function(){
         //alert($(this).html()+' '+index);
         //$(".answer").eq(index).show(1000).slideUp(1000).slideDown(1000).fadeOut(1000).fadeIn(1000);
         $(".answer").eq(index).show(1000);
      }); 
      $(this).dblclick(function(){
         //alert($(this).html()+' '+index);
         $(".answer").eq(index).hide(1000);
      }); 
    });
  });
 </script>

</head>
<body>
	<table align="center" cellpadding="10" cellspacing="0" border="1" width="70%">
		<tr align="center">
		<td colspan="2">ShowHide</td>
		</tr>
		<tr class="question">
		 <td>어제 점심 메뉴는?</td>
		</tr>
		<tr class="answer">
		 <td>수제비</td>
		</tr>
		<tr class="question">
		 <td>어제 저녁 메뉴는?</td>
		</tr>
		<tr class="answer">
		 <td>막창</td>
		</tr>
	</table>
</body>
</html>