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
	$.ajax({
		url:"http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12ff9134153dd158e068074390244746&curPage="+1,
		dataType:'json',
		success:function(v){
			var movieinfo=v["movieListResult"]["movieList"];
			$.each(movieinfo,function(index,value){
				$("#movieCd").val(value.movieCd);
				$("#movieNm").val(value.movieNm);
				$("#movieNmEn").val(value.movieNmEn);
				$("#prdtYear").val(value.prdtYear);
				$("#openDt").val(value.openDt);
				$("#typeNm").val(value.typeNm);
				$("#nationAlt").val(value.nationAlt);
				$("#genreAlt").val(value.genreAlt);
				$("#peopleNm").val((value["directors"][0]).peopleNm);
				$("#form").submit();
			});
			
			
			//document.location.href="movieInsert.do";
		}
			
	});
});
</script>
</head>
<body>
				<form id="form" action="movieInsert.do">
                    <input type="text" id="movieCd" name="movieCd" value="">
                    <input type="text" id="movieNm" name="movieNm" value="">
                    <input type="text" id="movieNmEn" name="movieNmEn" value="">
                    <input type="hidden" id="prdtYear" name="prdtYear" value="">
                    <input type="hidden" id="openDt" name="openDt" value="">
                    <input type="hidden" id="typeNm" name="typeNm" value="">
                    <input type="hidden" id="nationAlt" name="nationAlt" value="">
                    <input type="hidden" id="genreAlt" name="genreAlt" value="">
                  <input type="hidden" id="peopleNm" name="peopleNm" value="">
                </form>
</body>
</html>