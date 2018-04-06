<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TODAY MANAGER MAIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=2">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">HOME</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="maintest">HOME</a></li>
						<li><a href="todaytest">TODAY</a></li>
						<li><a href="#tour">DIARY</a></li>
						<li><a href="#contact">BOARD</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">SETTING
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">SET1</a></li>
								<li><a href="#">SET2</a></li>
								<li><a href="#">SET3</a></li> 
							</ul>
						</li>
						<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="main_container">
			<div class="row">
				<div id="top_box">
					
				</div>
			</div>
			<div class="row">
				<div>
					Tuesday, 15 November<br>
					[그림]관악구<br>
					[그림]서울, 대한민국<br>
				</div>
			</div>
			<div class="row">
				<div id="login">
					<p>로그인 후 사용할수 있습니다.</p><br><br>
					<input type="button" value="Login" id="add_memo">
				</div>
			</div>
			<div class="row">
				<div id="notepad">
					<p>당신의 웹 해마입니다. 무엇을 기억할까요?</p>
					<ul>
						<li>메모하자아아아아아아아아아아아</li>
						<li>메모하자아아아아아아아아아</li>
						<li>메모하자아아아아아아아</li>
						<li>메모하자아아아아아</li>
						<li>메모하자아아아</li>
					</ul>
					<input type="button" value="등록하기" id="add_memo">
				</div>
			</div>
			<div class="row">
				<div id="notepad">
					<p>TODAY</p>
					<ul>
						<li>메모하자아아아아아아아아아아아</li>
						<li>메모하자아아아아아아아아아</li>
						<li>메모하자아아아아아아아</li>
						<li>메모하자아아아아아</li>
						<li>메모하자아아아</li>
						<li>메모하자아아아아아아아아아아아</li>
						<li>메모하자아아아아아아아아아</li>
						<li>메모하자아아아아아아아</li>
						<li>메모하자아아아아아</li>
						<li>메모하자아아아</li>
					</ul>
					<input type="button" value="게시판가기" id="add_memo">
				</div>
			</div>
			<div class="row">
				<div id="slick_box">
					<ul>
						<li class="arrow_left"><img src="${pageContext.request.contextPath}/resources/left.png"></li>
						<li>
							<ul id="first_slick">
								<li>
									<div id="today">
										<div>
											<h1>TODAY</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="memo">
										<div>
											<h1>MEMO</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_a">
										<div>
											<h1>A</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_b">
										<div>
											<h1>B</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_c">
										<div>
											<h1>C</h1>
										</div>
									</div>
								</li>						
							</ul>
						</li>
						<li class="arrow_right"><img src="${pageContext.request.contextPath}/resources/right.png"></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(function(){
						$("#first_slick").slick({
							infinite: true,
							slidesToShow: 3,
							slidesToScroll: 1,
							arrows:true,
							prevArrow:'.arrow_left',
							nextArrow:'.arrow_right'
						});
					});
				</script>
			</div>
		</div>
	</div>
</body>
</html>