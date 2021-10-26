<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
   <form id="ajaxForm" name="ajaxForm" method="POST">
      <fieldset class="fld_cmt">
         <legend class="screen_out">댓글 작성</legend>
         <textarea id="txnew" name="contents" class="tf_cmt" cols="90" rows="5" title="한줄 토크를 달아주세요">한줄 토크를 달아주세요! (300자)</textarea>
         <!-- <button type="submit" class="img_sample btn_cmt">등록</button> -->
         <input type="hidden" name="id" value="${id}">
         <input type="hidden" name="job" value="new">
         <input id="send" type="button" value="등록" style="position: absolute;top: 50px; width: 100px; height: 54px;">
         <p class="info_append">
            <span class="screen_out">입력된 바이트 수 : </span>
            <span class="txt_byte">0</span> /10자
            <span class="txt_bar">|</span>
            <a href="#none">댓글 운영원칙</a>
         </p>
      </fieldset>
   </form>
</body>
</html>