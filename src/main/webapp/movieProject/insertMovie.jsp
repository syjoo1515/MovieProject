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
	
	$("#button3").click(function(){
		$.ajax({ //영화코드 가져오기
			url:"movieCdSelect.do",
			success:function(v){
				//console.log(v)
				$.each(v,function(index,value){
					var movieCd=value; 
					$.ajax({  //API 파싱해서 데이터 추출
						url:"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=627d009b87dbb1f6973ced4e2bb53cfd&movieCd="+movieCd,
						success:function(v){
							//console.log((v.movieInfoResult.movieInfo.actors).length);
							var actors=v.movieInfoResult.movieInfo.actors;
							var actorsNm="";
							$.each(actors,function(index,value){
								actorsNm+=value.peopleNm+"#";
							});    //배우명 저장
							var showTm=v.movieInfoResult.movieInfo.showTm;
							var movieNmEn=v.movieInfoResult.movieInfo.movieNmEn;
							var watchGradeNm=v.movieInfoResult.movieInfo.audits[0].watchGradeNm;
							 $.ajax({ //추출한 데이터 DB에 insert
								url:"movieDetailInsert.do",
								data:{movieCd:movieCd, movieNmEn:movieNmEn,showTm:showTm, actorsNm:actorsNm, watchGradeNm:watchGradeNm},
								success:function(v){
									console.log(v);
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
<button id="button3">영화상세정보데이터</button>
</body>
</html>