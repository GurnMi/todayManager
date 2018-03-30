<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.content_box{
		width:100%;
		height:500px;
		background:skyblue;
		margin-top:50px;
	}
	#carousel_list{
		list-style:none;
	}
	.todayrow{
		border-top:1px solid black;
		border-bottom:1px solid black;
	}
	@media(min-width:768px){
		.content_box{
			width:100%;
			height:500px;
			background:red;
			margin-top:50px;
		}
	}
	@media(min-width:960px){
		.content_box{
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
<script type="text/javascript">
	function make_str_calendar(){
		var appendStr = "";
		// 요일 출력을 위한 DATE객체 생성
		var findDay = new Date(year, month-1);
		// 요일 배열 생성
		var arrDays = new Array("SUN","MON","TUE","WED","THU","FRI","SAT");
		// 문자열 생성 및 조합
		appendStr += "<li>";
		appendStr += "<span id='text_year'>"+year+"</span><br>";
		if(month<10)
			appendStr += "0";
		appendStr += "<span id='text_month'>"+month+"</span>/";
		appendStr += "<span id='text_day'>";
		if(day<10)
			appendStr += "0";
		appendStr += day+"</span><br>";
		findDay.setDate(day);
		appendStr += "<span class='text_weekday'>"+arrDays[findDay.getDay()]+"</span>";
		appendStr += "</li>";
		
		switch(mode){
			case 0:
				$("#slider_slick").prepend(appendStr);
				return;
			case 1:
				// DAYTEXT 문자열 추가
				$("#slider_slick").append(appendStr);
				return;
		}
	}


	$(function(){
		// BOOTSTRAP_CAROUSEL SLIDE 정지
		$("#myCarousel").carousel("pause");
		// 페이지 최초 로드 시 현재날짜 SET
	})	
</script>
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
		<div class="content_box">
			<div class="row">
				<div class="col-sm-3">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ul class="carousel" id="carousel_list">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ul>
						<div class="carousel-inner">
							<div class="item active" id="date_prev">
								
							</div>
							<div class="item" id="date_now">
								
							</div>
							<div class="item" id="date_next">
								
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-sm-9">
					<p class="todayrow">테스트 / 00:00</p>
					<p class="todayrow">테스트 / 00:30</p>
					<p class="todayrow">테스트 / 01:00</p>
					<p class="todayrow">테스트 / 01:30</p>
					<p class="todayrow">테스트 / 02:00</p>
					<p class="todayrow">테스트 / 02:30</p>
					<p class="todayrow">테스트 / 03:00</p>
					<p class="todayrow">테스트 / 03:30</p>
					<p class="todayrow">테스트 / 04:00</p>
					<p class="todayrow">테스트 / 04:30</p>
					<p class="todayrow">테스트 / 05:00</p>
					<p class="todayrow">테스트 / 05:30</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>