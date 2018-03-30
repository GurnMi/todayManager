<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.main_intro{
			width:100%;
			height:500px;
			background:skyblue;
			margin-top:50px;
		}
	@media(min-width:768px){
		.main_intro{
			width:100%;
			height:500px;
			background:red;
			margin-top:50px;
		}
		#wheater_box{
		
		}
	}
	@media(min-width:960px){
		.main_intro{
			width:100%;
			height:500px;
			background:gray;
			margin-top:50px;
		}
	}	
	
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">SUPPORTER</a>
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
		<div class="main_intro">
			<div class="row" id="wheater_box">
				<div class="col-xs-12 text-center">
					<img src="${pageContext.request.contextPath}/resources/0600010001182.jpg">
					<p>2018.03.30</p>
					<p>WHEATER</p>
					<p>ETC
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					A
				</div>
				<div class="col-sm-4 col-xs-12">
					B
				</div>
				<div class="col-sm-4 col-xs-12">
					C
				</div>
			</div>
		</div>
	</div>
</body>
</html>