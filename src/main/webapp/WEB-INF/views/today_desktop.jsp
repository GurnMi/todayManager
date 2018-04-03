<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=2"></script>
<style>
	#mid_day_slick{
		width:100%;
		margin:0 auto;
	}
	#mid_day_slick > ul{
		list-style:none;
		overflow:hidden;
		padding:0;
		margin:0;
	}
	.date_slick{
		padding:0;
		margin:0;
	}
	.calendar_table{
		width:95%;
		margin:0 auto;
	}
	.calendar_table th{
		text-align:center;
	}
	.calendar_table td{
		text-align:center;
	}
	#mid_day_slick > ul > li{
		float:left;
	}
	#mid_day_slick > ul > li:nth-child(1){
		width:10%;
	}
	#mid_day_slick > ul > li:nth-child(2){
		width:80%;
	}
	#mid_day_slick > ul > li:nth-child(3){
		width:10%;
	}
	.arrow_left > img{
		width:100%;
		height:50px;
	}
	.arrow_right > img{
		width:100%;
		height:50px;
	}
</style>
<script type="text/javascript">
	var pageLoadControl = 0; 
	$(function(){
		// 페이지 최초 로드시 달력 자동 생성
		if(pageLoadControl == 0){
			pageLoadControl = 1;
			var date = new Date();
			make_TagString(date.getFullYear(), date.getMonth());
			make_TagString(date.getFullYear(), date.getMonth()+1);
			make_TagString(date.getFullYear(), date.getMonth()+2);
			$("#mid_day_slick").find(".date_slick").slick({
				infinite:false,
				initialSlide:1,
				arrows:true,
				prevArrow:'.arrow_left',
				nextArrow:'.arrow_right'
			});
		}
	});
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
				<div id="calendar-zone">
					<div id="mid_day_slick">
						<ul id="test_slick">
							<li class="arrow_left"><img src="${pageContext.request.contextPath}/resources/left.png"></li>
							<li>
								<ul class="date_slick"></ul>
							</li>
							<li class="arrow_right"><img src="${pageContext.request.contextPath}/resources/right.png"></li>
						</ul>
					</div>
					
				</div>
				<div id="time-line">
					<div><p>00:00</p></div>
					<div><p>00:30</p></div>
					<div><p>01:00</p></div>
					<div><p>01:30</p></div>
					<div><p>02:00</p></div>
					<div><p>02:30</p></div>
					<div><p>03:00</p></div>
					<div><p>03:30</p></div>
					<div><p>04:00</p></div>
					<div><p>04:30</p></div>
					<div><p>05:00</p></div>
					<div><p>05:30</p></div>
					<div><p>06:00</p></div>
					<div><p>06:30</p></div>
					<div><p>07:00</p></div>
					<div><p>07:30</p></div>
					<div><p>08:00</p></div>
					<div><p>08:30</p></div>
					<div><p>09:00</p></div>
					<div><p>09:30</p></div>
					<div><p>10:00</p></div>
					<div><p>10:30</p></div>
					<div><p>11:00</p></div>
					<div><p>11:30</p></div>
					<div><p>12:00</p></div>
					<div><p>12:30</p></div>
					<div><p>13:00</p></div>
					<div><p>13:30</p></div>
					<div><p>14:00</p></div>
					<div><p>14:30</p></div>
					<div><p>15:00</p></div>
					<div><p>15:30</p></div>
					<div><p>16:00</p></div>
					<div><p>16:30</p></div>
					<div><p>17:00</p></div>
					<div><p>17:30</p></div>
					<div><p>18:00</p></div>
					<div><p>18:30</p></div>
					<div><p>19:00</p></div>
					<div><p>19:30</p></div>
					<div><p>20:00</p></div>
					<div><p>20:30</p></div>
					<div><p>21:00</p></div>
					<div><p>21:30</p></div>
					<div><p>22:00</p></div>
					<div><p>22:30</p></div>
					<div><p>23:00</p></div>
					<div><p>23:30</p></div>
					<div><p>24:00</p></div>
				</div>
				<div id="info-line">
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
					<div><div class="info-color"></div></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>