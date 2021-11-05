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
	$("#button").click(function(){
		document.location.href="apiAction.do";
	});
	$("#button2").click(function(){
		$.ajax({ //db에 저장된 영화코드 가져오기
			url:"movieCdSelect.do",
			success:function(v){
				//console.log(v[1]);
				$.each(v,function(index,value){
					console.log(value)
					$.ajax({ //가져온 영화코드로 크롤링해서 영화 이미지 ,내용 가져오기
						url:"/webProject/movieImg.do",
						data:{moviecode: value},
						success:function(v){
							console.log(v.movieDiscrip);
							  $.ajax({ //크롤링한 데이터 DB에 insert
								url:"movieImgInsert.do",
								data:{moviecode: value, movieImg: v.movieImg, movieDiscrip: v.movieDiscrip},
								type: "POST",
								success:function(v){
									console.log(v);
								},
								error:function(request, status, error){
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

								}
							}); 
						}
					});
				});
			}
		});
	});
	
});
</script>
</head>
<body>
<button id="button">영화데이터</button>
<button id="button2">이미지크롤링</button>
</body>
</html>