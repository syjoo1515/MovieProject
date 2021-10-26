<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Start Simple Web</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/login.css" rel="stylesheet"> -->
<link href="css/clean-blog.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
   href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link
   href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
   rel='stylesheet' type='text/css'>
<link
   href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
   rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
     $(function(){
     	$("span#pass").click(function(){
     		if($("input[name='cp']").val().length==0){
    			alert('Current PassCheck');
    			return false;
    		}
    		$("form").submit(); 
    	});  
     });
    </script>
</head>
<body style="background-image: url(img/back.jpg)">

<jsp:include page="header.jsp"></jsp:include>

   <div class="container" style="margin-top: 120px">
      <div class="row">
         <div class="main">
            <h3>
               PASSWORD CHECK</a>
            </h3>

            <form method="post" action="/Web/passWordConfirm.do">
               <div class="form-group">
                  <input type="text" class="form-control" name="cp"
                     id="pass"/>
                  <input type="hidden" class="form-control" name="no" value="${param.no}"
                    />
                  <input type="hidden" class="form-control" name="job" value="${param.job}"
                   />
                  

               </div>
               
               <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12">
                     <a href="#" class="btn btn-sm btn-info btn-block"><span id="pass">PassCheck</span></a>
                  </div>
               </div>
              </form>      
         </div>
         
      </div>
   </div>
   </div>

</body>

</html>