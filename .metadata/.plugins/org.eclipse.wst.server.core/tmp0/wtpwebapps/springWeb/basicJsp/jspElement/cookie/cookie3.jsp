<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
   function windowpopUp(){
      window.open("imgPop.jsp","id","left=100,top=100,width=400,height=460");
   }
</script>
</head>
<%
    String pop="";
    Cookie[]cookarray=request.getCookies();
    if(cookarray!=null && cookarray.length>0){
       for(int i=0;i<cookarray.length;i++){
          if(cookarray[i].getName().equals("pop")){
             pop=cookarray[i].getValue(); 
          }
       }
    }
%>
<%
  if(pop.length()==0){
%>
<body onload="windowpopUp()">
<%
  }else{
     %>
<body>     
     <%
  }
%>
</body>
</html>











