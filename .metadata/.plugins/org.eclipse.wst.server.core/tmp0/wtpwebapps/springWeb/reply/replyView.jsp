<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Web/reply/rss.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//로그인하자마자 데이터 출력되도록 (select를 별도로 뺴도 됨)
ajaxRequest('/Web/ajaxDelete.do',{no:0},'json')

	function ajaxReplyList(v){
		var temp="";
		$.each(v,function(index,dom){
               temp+="<div class=\"list_cmt\">";
			   temp+="<div class=\"reply"+dom.no+"\">"; //새로만듦
               temp+="<div class=\"cmt_head\"></div>";
               temp+="<div class=\"cmt_body\">";
               temp+="<span class=\"info_append\">";
               temp+="<span class=\"txt_name\">"+dom.id+"</span>";
               temp+="<span class=\"txt_bar\">|</span>";
               temp+="<span class=\"txt_time\">"+dom.regdate+"</span></span>";
               temp+="<p class=\"txt_desc\">"+dom.contents;
               temp+="</p>";
               temp+="</div>";
               temp+="<div class=\"cmt_foot\">";
               temp+="<a href=\"#none\">답글</a><span class=\"txt_bar\">|</span><a href='javascript:modFun("+dom.no+")'>수정</a><span class=\"txt_bar\">|</span><a href='javascript:delFun("+dom.no+")'>삭제</a><span class=\"txt_bar\">|</span><a href=\"#none\">신고</a>";
               temp+="</div>";
               temp+="</div>";
               temp+="</div>";

		});
		$("div#show").html(temp);
		$("textarea#txnew").val('');
		$("textarea#txnew").focus();
	}
	
	function ajaxRequest(url,data,dataType){
		 $.ajax({
			   url:url,
			//루트가 뭔지 모를때 ${pageConext.request.contextPath}씀. /Web 과 같은것 
			type:'POST',
			data:data,
			dataType:dataType,
			success:function(v){
				ajaxReplyList(v); //코드 밖으로 뺌
			},
			error:function(e){
				alert('error'+e);
			}
		 }); 
	}
	//삭제
	function delFun(no){
		ajaxRequest('/Web/ajaxDelete.do',{no:no},'json')
	}
	

	
	//수정
	function modFun(no){
		$("div.reply"+no).append("<jsp\:include page=\"inputReply.jsp\"/>");
	}

   $(function(){
	   //등록 누르면 DB에 입력되고 select해서 뿌려지는것
	   $("input#send").click(function(){
		   ajaxRequest('${pageContext.request.contextPath}/ajaxReplyInsert.do',$("form#ajaxForm").serialize(),'json')
	   });
	   
	   
	   
	   //textarea를 클릭했을 때
      $("textarea.tf_cmt").focus(function(){
        $(this).text(''); 
       if('${id}'==null||'${id}'==''){
          alert('LoginCheck!');
          $(this).blur(); //포커스를 이렇게 해야 루트를 돌지 않음
          document.location.href='/Web/springAjax/basic/signinajax.jsp';
       }
      });
	   //textarea에 입력할 때
      $("textarea.tf_cmt").keyup(function(){   
         if($("textarea").val().length>10){
            alert('10글자만 가능!');
            $("textarea.tf_cmt").val($("textarea.tf_cmt").val().substring(0,10));
         }
        $("span.txt_byte").text($("textarea").val().length);         
      });
   });
</script>
</head>
<body>
<div class="cmt_comm">
<jsp:include page="inputReply.jsp"/>
   <strong class="screen_out">전체 댓글</strong>
    <div id="show"></div>

</div>
</body>
</html>