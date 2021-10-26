<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="copyright" content="Copyright 2009 @ high1 all rights reserved" />
<link href="/web/basicJsp/jspElement/jspApp/css/contents.css" rel="stylesheet" type="text/css" />
<script src="/web/basicJsp/jspElement/jspApp/script/jquery-1.7.2.js"></script>

<!--쿠키는 브라우저에 심어지는 개념이라 url이 변경되어도 계속 살아있다  -->
<%
String id="";
Cookie[]cookarray=request.getCookies();
if(cookarray!=null && cookarray.length>0){
 for(int i=0;i<cookarray.length;i++){
    if(cookarray[i].getName().equals("id")){
       id=cookarray[i].getValue(); 
    }
 }
}

%>


<script type="text/javascript">
	function sendID(){ //id,pass모두 입력 시 loginAction.jsp으로 넘어감
			var obj=document.login;
			if(!obj.id.value||!obj.pass.value){
				alert('ID or PassCheck');
				return false;
			}
			obj.submit(); //입력값 있으면 제출
		}


</script>
</head>
<body>
<form name="login" method="post" action="loginAction.jsp">
 <div id="loginWrapper">
  <div class="loginForm">
   <fieldset>
    <legend>관리자 시스템 로그인</legend>
    <dl>
     <dt><img src="/web/basicJsp/jspElement/jspApp/img/common/th_id.gif" alt="아이디" /></dt>
     <dd><input type="text" name="id" class="text" id="user_id" value="<%=id%>"/></dd>

     <dt><img src="/web/basicJsp/jspElement/jspApp/img/common/th_pw.gif" alt="비밀번호" /></dt>
     <dd><input type="password" name="pass" class="text" id="user_passwd" /></dd>
    </dl>
    <div class="btn">
     <img id="btnSubmit" src="/web/basicJsp/jspElement/jspApp/img/button/btn_login.gif" alt="LOGIN" title="LOGIN" onclick="sendID()" />
    </div>

    
    <div class="saveId"><input type="checkbox" id="checker" name="checker" /> 
     <img src="/web/basicJsp/jspElement/jspApp/img/common/save_id.gif" alt="아이디 저장" />
    </div>
   </fieldset>
  </div>
 </div>
</form>
</body>
</html>