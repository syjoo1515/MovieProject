<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Start Simple Web</title>

<!-- Bootstrap Core CSS -->
<link href="/Web/boardMVC/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/Web/boardMVC/css/clean-blog.css" rel="stylesheet">
<link href="/Web/boardMVC/css/board.css" rel="stylesheet">
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

</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(function(){
       $("span#scrap").click(function(){      
      document.location.href='scrap.do?id=${id}&no=${info.no}'
    		  //alert('${id}'+' '+${info.no});
    });
       //이거 주석 안하면 왜 스크랩 눌러도 여기로 오는거지
/*        $(".btn.btn-default.btn-xs").click(function(){
    	  //alert($(this).text()+' '+this.lang+' '+${info.no}); 
    	  //자식글 있으면 삭제 불가능하게
    	  if(this.lang=='del' && '${info.reply}'>0){
    		  alert('답글이 있어 삭제가 불가능합니다');
    		  return false;
    	  }
    	  document.location.href='/Web/boardMVC/password.jsp?no='+${info.no}+'&job='+this.lang;
       }); */
   }); 
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>


	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('/Web/boardMVC/img/about-bg.jpg'); height: 200px">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading"
						style="margin-top: 10px; padding-top: 35px; padding-bottom: 35px">
						<h2>SAMPLE</h2>
						<span class="subheading">BULLETIN BOARD</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="board-field">
		<div class="list-group">
			<div class="list-group-item board-title">
				<div class="board-title">
					<span class="board-category">[JAVASCRIPT]</span><a href="#">
						${info.title} </a> 
				</div>
				<div class="board-meta"
					style="font-weight: 400; font-size: 1.2rem; color: #404040">
					<p>
						<i class="glyphicon glyphicon-user"></i> ${info.author} 님 
						<i class="glyphicon glyphicon-comment"></i> ${info.reply } 
						<i class="glyphicon glyphicon-ok"></i> ${info.hit }
						<i class="glyphicon glyphicon-time"></i> ${info.regdate }
					    <i class="glyphicon glyphicon-thumbs-up"></i> 0
						<i class="glyphicon glyphicon-thumbs-down"></i> 0
					</p>
				</div>
				<div class="clear"></div>
			</div>
			<div class="list-group-item">
				<span class="board-contents"> ${info.contents } 
				<img src='/Web/upload/${info.fileName}' width="100" height="100">
				</span>
				<p style="text-align: center; margin-top: 30px">
					<button class="btn btn-success">
						<i class="glyphicon glyphicon-thumbs-up"></i>공감
					</button>
					<button class="btn btn-warning">
						<i class="glyphicon glyphicon-thumbs-down"></i>비공감
					</button>
				</p>
			</div>
			<div class="bottom" style="margin: 10px;margin-top: 20px; text-align: right">
				<a href="/Web/boardMVC/boardList.do" class="btn btn-default btn-xs pull-left">목록으로</a> 
				<a href="#" class="btn btn-default btn-xs" lang="mod">수정</a> 
				<a href="#" class="btn btn-default btn-xs" lang="del">삭제</a> 
				<a href="/Web/boardMVC/write.jsp?job=reply&ref=${info.ref}&step=${info.step}&lev=${info.lev}&pnum=${info.no}" class="btn btn-default btn-xs">답글</a>
				<span class="btn btn-default btn-xs" id="scrap">스크랩</span> 
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<ul class="list-inline text-center">
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-home fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy;2016 SIST. All
						rights reserved | code by milib</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- jQuery -->
	<script src="/Web/boardMVC/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/Web/boardMVC/js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/Web/boardMVC/js/clean-blog.min.js"></script>
</body>

</html>
