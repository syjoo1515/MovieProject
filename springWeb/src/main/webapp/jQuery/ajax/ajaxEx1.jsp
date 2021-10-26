<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  function nodeValue(obj){
	  alert(obj);
  }
  
  $( function() {
    $( "#accordion" ).accordion();
     $("h3").click(function(){
    	 $("p").eq(parseInt($(this).text().split(' ')[1])-1).fadeOut(100);
/*     	switch (parseInt($(this).text().split(' ')[1])) {
		case 1:
			nodeValue(1);
			break;
		case 2:
			nodeValue(2);
			break;
		case 3:
			nodeValue(3);
			break;
		case 4:
			nodeValue(4);
			break;
		default:
			break;
		} */
    }); 
  } );
  </script>
</head>
<body>
 
<div id="accordion" style="width: 200px;">
  <h3 class="s1">Section 1</h3>
  <div>
    <p>
    가나다
    </p>
  </div>
  <h3 class="s2">Section 2</h3>
  <div>
    <p>
    라마
    </p>
  </div>
  <h3 class="s3">Section 3</h3>
  <div>
    <p>
    아아
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3 class="s4">Section 4</h3>
  <div>
    <p>
으으
    </p>
    <p>
어어
    </p>
  </div>
</div>
 
 
</body>
</html>