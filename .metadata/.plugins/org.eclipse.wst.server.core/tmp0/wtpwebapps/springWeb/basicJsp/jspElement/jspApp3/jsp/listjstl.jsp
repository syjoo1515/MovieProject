<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="/firstweb/basicJsp/jspElement/jspApp3/css/contents.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
<%-- 	${student!=null?student:professor!=null?professor:studentlist} --%> <!--setAttribute에서 변수명을 하나로 주면 이럴 필요 없음  -->
<%-- ${function:length(item) }  데이터길이
${item[0]}  첫번째데이터 --%>

<%-- <c:forEach var="a" items="${item}" varStatus="cnt">
 <c:forEach var="b" items="${a}">
 	${b.key}:${b.value}
 </c:forEach><br></br>
</c:forEach>
 --%>

	<div id="wrapper">
		<div id="header">
			<div class="topInfoWrap">
				<div class="topInfoArea clfix">
					<div class="loginWrap">
						<span class="fir">2012.05.17</span> <span>13:30:22</span> <span><em>OOO님</em>
							좋은 하루 되세요</span> <a href="" class="btnLogout"><img
							src="/firstweb/basicJsp/jspElement/jspApp3/img/common/btn_logout.gif"
							alt="로그아웃" /></a>
					</div>
				</div>
			</div>
			<div class="gnbSubWrap"></div>
		</div>
		<div id="container">
			<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<h1 class="title">게시판 리스트</h1>
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="#">검색</a></span>
							<span class="button"><a href="#">글쓰기</a></span>
						</span>
					</div>

					<table class="bbsWrite mgb35">
						<caption></caption>
						<colgroup>
							<col width="95" />
							<col width="395" />
							<col width="95" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>검색</th>
								<td><select>
										<option>선택하세요</option>
								</select> <input type="text" name="" class="inputText" size="30" /></td>
							</tr>
						</tbody>
					</table>
					<table class="bbsList">
						<colgroup>
							<c:forEach var="a" items="${item[0]}" varStatus="cnt">
							<col width="100"/>
							</c:forEach>
						</colgroup>
								<thead>
									<tr>
										<c:forEach var="a" items="${item[0]}" varStatus="cnt">
										<th scope="col" class="fir">${a.key}</th>
										</c:forEach>
									</tr>
								</thead>

								<tbody>
								<c:forEach var="a" items="${item}" varStatus="cnt">
										<tr>
										<c:forEach var="b" items="${a}">
										<td class="fir">${b.value}</td>
										
										</c:forEach>
										</tr>
								</c:forEach>
								</tbody>
								<thead>
									<tr>

									</tr>
								</thead>

								<tbody>

								</tbody>
					</table>
					
					<div class="paging">
						<a href="#"><img
							src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_first.gif"
							alt="처음페이지" /></a> <a href="#"><img
							src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_prev.gif"
							alt="이전" /></a> <span> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <strong>4</strong> <a href="#">5</a> <a href="#">6</a>
							<a href="#">7</a> <a href="#">8</a> <a href="#">9</a>
						</span> <a href="#"><img
							src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_next.gif"
							alt="다음" /></a> <a href="#"><img
							src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_last.gif"
							alt="마지막페이지" /></a>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>