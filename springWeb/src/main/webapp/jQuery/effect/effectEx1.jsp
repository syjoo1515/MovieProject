<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
  #draggable { width: 150px; height: 150px; padding: 0.5em; background: url('/myPage/img/1.gif'); background-size: cover; }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $(".ui-widget-content").draggable();
    $(".ui-widget-content").mouseover(function(){
    	$(this).text('^0^')
    	$(this).css({"background":"url('/myPage/img/9.gif')","background-size":"cover"});
    	 $(".ui-widget-content").mouseout(function(){
    		 $(this).text('¤Ð0¤Ð')
    	    	$(this).css({"background":"url('/myPage/img/1.gif')","background-size":"cover"});
    	 });
    });
  } );
  </script>
</head>
<body>
 
<div id="draggable" class="ui-widget-content">
  <p>Drag me around1</p>
</div>

<div id="draggable" class="ui-widget-content">
  <p>Drag me around2</p>
</div>
 
 
</body>
</html>