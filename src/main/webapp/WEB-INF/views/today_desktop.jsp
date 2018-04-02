<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/slick.js"></script>
<!-- CUSTOM JS -->
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
				<div id="calendar-zone">
					TEST CALENDAR ZONE
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