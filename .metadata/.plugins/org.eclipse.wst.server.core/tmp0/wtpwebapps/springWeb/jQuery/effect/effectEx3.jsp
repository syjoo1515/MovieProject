<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> <!--이 라이브러리 없으면 실행 안됨  -->
<script type="text/javascript">
  function callback(){
      setTimeout(function(){
        $("img#effects").show();  //1초 후에 img#effects를  보여줌 (이벤트가 적용되지 않은 기본 화면)
     },1000); 
    // alert('set');
  }
  $(function(){
    $("button").click(function(e){
       e.preventDefault(); //기본 설정되어있는 이벤트를 중지시킴	
      var selectedEffect=$("select#effectsType").val(); 
      $("img#effects").effect(selectedEffect,3000,callback);
      //effect()메소드: effect(효과,[옵션],[지속시간],[애니메이션이 완료되면 호출하는 함수])
    });
  });
 </script>
</head>
<body>
<div>
<img id="effects" alt="" src="/web/html/img/10.jpg">
</div><br>
<select name="effects" id="effectsType">
   <option value="blind">blind</option>
   <option value="bounce">bounce</option>
   <option value="clip">clip</option>
   <option value="drop">drop</option>
   <option value="explode">explode</option>
   <option value="fade">fade</option>
   <option value="puff">puff</option>
   <option value="pulsate">pulsate</option>
   <option value="shake">shake</option>
</select><button id="button">Run Effect</button>
</body>
</html>

