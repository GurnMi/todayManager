<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=4">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/today_calendar.css?var=5">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=2"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar_s.js?var=3"></script>
<style>
	
</style>
<script type="text/javascript">

	var date = new Date();
	var baseDate = date;
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	var pageLoadControl = 0;
	
	$(function(){
		// 페이지 최초 로드시 달력 자동 생성
		if(pageLoadControl == 0){
			cal_create(year, month, day, pageLoadControl);
			cal_s_create(year, month, day, pageLoadControl);
			pageLoadControl = 1;
		}
		
		// 달력 년,월 컨트롤
		$(".date_slick").on("afterChange", function(event, slick, currentSlide, nextSlide){
			if($(".arrow_left").attr("aria-disabled") == "true"){
				if(month > 1){
					month--;
				}
				else{
					year--;
					month = 12;
				}
				cal_create(year, month, day, pageLoadControl);
			}
			if($(".arrow_right").attr("aria-disabled") == "true"){
				if(month < 12){
					month++;
				}
				else{
					year++;
					month = 1;
				}
				cal_create(year, month, day, pageLoadControl);
			}
		});
		// 소형달력 년,월 컨트롤
		$(".s_date_slick").on("afterChange", function(event, slick, currentSlide, nextSlide){
			var tables = $(this).find(".s_calendar_table");
			var t_year = null;
			var t_month = null;
			var t_day = null;
			if($(".s_arrow_left").attr("aria-disabled") == "true"){
				t_year = Number($(tables).eq(0).find(".s_cal_year").html());
				t_month = Number($(tables).eq(0).find(".s_cal_month").html());
				t_day = Number($(tables).eq(0).find("tr").eq(3).find("td").eq(0).html());
				cal_s_create(t_year, t_month, t_day, pageLoadControl);
			}
			if($(".s_arrow_right").attr("aria-disabled") == "true"){
				t_year = Number($(tables).eq(2).find(".s_cal_year").html());
				t_month = Number($(tables).eq(2).find(".s_cal_month").html());
				t_day = Number($(tables).eq(2).find("tr").eq(3).find("td").eq(0).html());
				cal_s_create(t_year, t_month, t_day, pageLoadControl);
			}
		});
		
		// 달력 일 선택
		$(".date_slick").on("click","td",function(){
			var target = $(this).parent().parent();
			var sYear = $(target).find(".cal_year").html();
			var sMonth = $(target).find(".cal_month").html();
			var sDay = $(this).html();
			// 달력 선택정보 저장
			s_cal_save_select.setFullYear(sYear, sMonth-1, sDay);
			$(".date_slick").find(".cal_select").removeClass("cal_select");
			$(this).addClass("cal_select");
		});
		
		// 소형달력 일 선택
		$(".s_date_slick").on("click","td",function(){
			var target = $(this).parent().parent();
			$(target).find(".s_cal_month").html(cal_s_change_string($(this).attr("value")));
			
			var sYear = $(target).find(".s_cal_year").html();
			var sMonth = $(target).find(".s_cal_month").html();
			var sDay = $(this).html();
			// 달력 선택정보 저장
			s_cal_save_select.setFullYear(sYear, sMonth-1, sDay);
			$(".s_date_slick").find(".s_cal_select").removeClass("s_cal_select");
			$(this).addClass("s_cal_select");
		});
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
		<div id="today_container">
			<div class="row">
				<div id="calendar-zone">
					<div id="day_slick">
						<ul>
							<li class="arrow_left"><img src="${pageContext.request.contextPath}/resources/left.png"></li>
							<li>
								<ul class="date_slick"></ul>
							</li>
							<li class="arrow_right"><img src="${pageContext.request.contextPath}/resources/right.png"></li>
						</ul>
					</div>
				</div>
				<div id="s_calendar_zone">
					<div id="s_day_slick">
						<ul>
							<li class="s_arrow_left"><img src="${pageContext.request.contextPath}/resources/left.png"></li>
							<li>
								<ul class="s_date_slick"></ul>
							</li>
							<li class="s_arrow_right"><img src="${pageContext.request.contextPath}/resources/right.png"></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="timetable_box">
					<div id="week_time">
						<div><p>00:00</p><hr></div>
						<div><p>00:30</p><hr></div>
						<div><p>01:00</p><hr></div>
						<div><p>01:30</p><hr></div>
						<div><p>02:00</p><hr></div>
						<div><p>02:30</p><hr></div>
						<div><p>03:00</p><hr></div>
						<div><p>03:30</p><hr></div>
						<div><p>04:00</p><hr></div>
						<div><p>04:30</p><hr></div>
						<div><p>05:00</p><hr></div>
						<div><p>05:30</p><hr></div>
						<div><p>06:00</p><hr></div>
						<div><p>06:30</p><hr></div>
						<div><p>07:00</p><hr></div>
						<div><p>07:30</p><hr></div>
						<div><p>08:00</p><hr></div>
						<div><p>08:30</p><hr></div>
						<div><p>09:00</p><hr></div>
						<div><p>09:30</p><hr></div>
						<div><p>10:00</p><hr></div>
						<div><p>10:30</p><hr></div>
						<div><p>11:00</p><hr></div>
						<div><p>11:30</p><hr></div>
						<div><p>12:00</p><hr></div>
						<div><p>12:30</p><hr></div>
						<div><p>13:00</p><hr></div>
						<div><p>13:30</p><hr></div>
						<div><p>14:00</p><hr></div>
						<div><p>14:30</p><hr></div>
						<div><p>15:00</p><hr></div>
						<div><p>15:30</p><hr></div>
						<div><p>16:00</p><hr></div>
						<div><p>16:30</p><hr></div>
						<div><p>17:00</p><hr></div>
						<div><p>17:30</p><hr></div>
						<div><p>18:00</p><hr></div>
						<div><p>18:30</p><hr></div>
						<div><p>19:00</p><hr></div>
						<div><p>19:30</p><hr></div>
						<div><p>20:00</p><hr></div>
						<div><p>20:30</p><hr></div>
						<div><p>21:00</p><hr></div>
						<div><p>21:30</p><hr></div>
						<div><p>22:00</p><hr></div>
						<div><p>22:30</p><hr></div>
						<div><p>23:00</p><hr></div>
						<div><p>23:30</p><hr></div>
						<div><p>24:00</p><hr></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>