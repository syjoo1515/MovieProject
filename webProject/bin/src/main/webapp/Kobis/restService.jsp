<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var dt=new Date(); //현재날짜&시간
	var m=dt.getMonth()+1; //월은 0부터 시작해서 1 더해줘야함
	if(m<10){
		var month="0"+m;
	}else{
		var month=m;
	}
	
	var d=dt.getDate()-1; //하루전꺼 검색
	if(d<10){
		var day="0"+d;
	}else{
		var day=d;
	}
	
	var year=dt.getFullYear();

	var result=year+""+month+""+day;
	$(function(){
		$.ajax({
			url:"https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=12ff9134153dd158e068074390244746&targetDt="+result,
			dataType:"json",
			success:function(v){
				//console.log(v["boxOfficeResult"]["dailyBoxOfficeList"]);
				var movieData=v["boxOfficeResult"]["dailyBoxOfficeList"];
				//반복문 돌려서 데이터 10개 모두 출력함
				var temp="";
				$.each(movieData,function(index,value){
					//console.log(value.movieNm);
 					temp+="<td>"+value.rank+"</td><td>"+value.rankInten
 					+"</td><td>"+value.rankOldAndNew+"</td><td>"+value.movieCd+"</td><td>"+value.movieNm+"</td><td>"+value.openDt
 					+"</td><td>"+value.salesAmt+"</td><td>"+value.salesAcc+"</td><td>"+value.audiCnt+"</td><td>"+value.audiAcc+"</td>";
				console.log(temp);
				$("tr#movie"+index).html(temp);
				temp="";
				});
			},
			error:function(){
				alert("error!");
			}
		})
	});
</script>
</head>
<body>
<div class="container">
  <h2>일별 박스오피스</h2>
  <p>open API ajax로 파싱</p>            
  <table class="table">
    <thead>
      <tr>
        <th>rank</th>
        <th>rankInten</th>
        <th>rankOldAndNew</th>
        <th>movieCd</th>
        <th>movieNm</th>
        <th>openDt</th>
        <th>salesAmt</th>
        <th>salesAcc</th>
        <th>audiCnt</th>
        <th>audiAcc</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="i" begin="0" end="9">
    <tr id="movie${i}"></tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>