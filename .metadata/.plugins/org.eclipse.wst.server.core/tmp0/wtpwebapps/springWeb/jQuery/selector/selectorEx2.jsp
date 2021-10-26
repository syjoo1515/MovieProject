<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	/* attr: 요소의 속성값 반환 or 변경
	 * each: 매개변수로 받은 것을 사용해 반복문, 배열 검사// 첫번째 매개변수: 배열/객체, 두번째 매개변수:콜백함수
	 */

	$(function() {
		console.log($("img").length);
		console.log($($("img")[0]).attr("src"));
		/* 		$($("img")[0]).click(function(){
		 this.width=200;
		 $(this).attr("height",500);
		 }); */
		/* 		$("img").eq(1).click(function(){
		 $('img').hide(1000).show(1000).slideUp(1000).slideDown(1000);
		 }); */
		/* 		$('img').click(function(){ 
		 $(this).attr("src","/myPage/img/1.gif");
		 $(this).attr({"src":"/myPage/img/1.gif",width:200, height:200});  //JSON형태로 
		 }); */
		$('img').click(function() {
			var cnt = $('img').length;
			for (var i = 0; i < cnt; i++) {
				$($('img')[i]).attr("src", "/myPage/img/1.gif");
			}
			$("img").each(function(index, dom) {  //for문과 비슷한 기능. 첫번째 img: index 0
				//alert(index+' '+$(dom).attr("src"));
				switch (index) {
				case 0:
					$(this).attr("width", 200);
					break;
				case 1:
					$(this).attr("width", 250);
					break;
				case 2:
					$(this).attr("width", 300);
					break;
				case 3:
					$(this).attr("width", 350);
					break;
 				case 4:
					$(this).attr("width", 450);
					break; 
				}

			});
		});
	});
</script>
</head>
<body>
	<img src="/myPage/img/101.png" width="100px" height="100px">
	<img src="/myPage/img/102.jpg" width="100px" height="100px">
	<img src="/myPage/img/103.jpg" width="100px" height="100px">
	<img src="/myPage/img/104.png" width="100px" height="100px">
	<img src="/myPage/img/101.png" width="100px" height="100px">
</body>
</html>