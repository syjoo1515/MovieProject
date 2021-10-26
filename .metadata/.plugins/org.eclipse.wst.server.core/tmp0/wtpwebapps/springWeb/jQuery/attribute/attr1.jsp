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
<script type="text/javascript">
  $(function(){
   /*  alert($("div").length); 
    alert($("div").attr("id")); */
    /* $("div").attr("lang",function(i,data){
       alert(i+' '+data);
    }); */
    
     $("div").attr("id",function(i,data){
         //return data+"-"+i;         
         return "div-id-"+i;
     }).each(function(i2,dom){
        //alert("i2="+i2+' '+dom.id+' '+this.id);
        //alert("i="+i+" i2="+i+" "+this.id);
        $("span",this).html("(ID='<B>"+this.id+"</B>')");
     });
    //alert($($("img")[0])).attr("alt",$($("img")[0])).attr("src"));
       /*  for(var i=0;i<$("img").length;i++){
       $($("img")[i]).attr("title",($($("img")[i]).attr("src")));
        } */
        
        $("div").eq(0).click(function(){
           $("img").attr("src",function(index,data){
               return "/web/html/img/7.gif";
            }).each(function(index2,dom){
               //alert(dom.src);
               //$(this).attr("title",dom.src);
               this.title=$(dom).attr("src");
            });   
        });
        
  });
 </script>
</head>
<body>
   <div id="d1" lang="show1" >ZERO-TH<span></span></div>
   <div id="d2" lang="show2">FIRST<span></span></div>
   <div id="d3" lang="show3">SECOND<span></span></div>
   <img  src="/web/html/img/1.gif">
   <img  src="/web/html/img/8.gif">
   <img  src="/web/html/img/9.gif">
</body>
</html>


