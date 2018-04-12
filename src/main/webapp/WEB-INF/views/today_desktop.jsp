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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=5">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_timeplan.js?var=2"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_insert.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar_s.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_size.js?var=3"></script>
<script type="text/javascript">
	$(function(){
		var date = new Date();
		var baseDate = date;
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var pageLoadControl = 0;

		// 페이지 최초 로드시 달력 자동 생성
		if(pageLoadControl == 0){
			cal_create(year, month, day, pageLoadControl);
			cal_s_create(year, month, day, pageLoadControl);
			pageLoadControl = 1;
			draw_time();
			
			// 크기 재조절 구역
			resize_insertbox();
		}
		
		// 달력 년,월 컨트롤
		$("#prevkey").on("click", function(){
			if(month > 1){
				month--;
			}
			else{
				year--;
				month = 12;
			}
			cal_create(year, month, day, pageLoadControl);
		});
		$("#nextkey").on("click", function(){
			if(month < 12){
				month++;
			}
			else{
				year++;
				month = 1;
			}
			cal_create(year, month, day, pageLoadControl);
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
		$("#calendar").on("click","td",function(){
			var target = $(this).parent().parent();
			var sYear = $(target).find(".cal_year").html();
			var sMonth = $(target).find(".cal_month").html();
			var sDay = $(this).html();
			// 달력 선택정보 저장
			cal_save_select.setFullYear(sYear, sMonth-1, sDay);
			$("#calendar").find(".cal_select").removeClass("cal_select");
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
		
		// 마우스가 올라갈 시 시각효과를 위해 CSS 재 적용(선택)
		$("#today_time").on("mouseover","div",function(){
			$(this).find("hr").addClass("hr_over");
		});
		// 마우스가 벗어날 시 시각효과를 위해 CSS 재 적용(선택해제)
		$("#today_time").on("mouseout","div",function(){
			$(this).find("hr").removeClass("hr_over");
		});
		// 선택한 시간을 컨트롤창의 입력창에 적용
		$("#today_time").on("click","div",function(){
			var checker = $("#today_time").find(".hr_select");			
			// 시작시간이 존재할 경우 종료시간으로 설정
			if(checker.size()>0){
				var end = $(this).find("p").text();
				var start = $("#time_start").val();
				
				// 시작시간보다 더 이른경우일 때 예외처리 필요
				if(time_compare_string(start, end)){
					var target = $(this);
					insert_end(target);
					$("#time_end").val(end);
				}
				else{
					alert("종료시간이 시작시간보다 빠릅니다.");
					$("#time_start").val("");
					$("#time_end").val("");
				}
			}
			// 시작시간이 존재하지않을 경우 시작시간으로 설정 && 작성중인 계획 미 존재 시
			else if($(this).parent().find("div").hasClass("ing_plan") == false){
				var start = $(this).find("p").text();
				var target = $(this);
				insert_start(target);
				$("#time_start").val(start);
			}
			// 작성중인 계획표 존재 시
			else{
				alert("이미 작성중인 계획이 존재합니다.\n작성중인 계획을 완료해주시거나, 초기화버튼을 눌러주세요.")				
			}
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
						<li><a href="diarytest">DIARY</a></li>
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
				<div>
					임시 메뉴공간 확보하는 구역
				</div>
			</div>
			<div class="row">
				<div id="insert_box">
					<form action="${pageContext.request.contextPath}/repeat/insert" method="post">
						<label class="guide">카테고리</label>
						<select>
							<option>휴식</option>
							<option>공부</option>
							<option>운동</option>
							<option>기타</option>
						</select>
						<br>
						<label class="guide">제목</label>
						<input type="text" class="title" placeholder="화면에 표시될 제목을 입력해주세요.">
						<br>
						<label class="guide">내용</label>
						<input type="text" class="content" placeholder="세부내용을 입력해 주세요">
						<br>
						<label class="guide">날짜</label>
						<input type="text" placeholder="달력에서 선택해주세요." readonly="readonly">
						<br>
						<label class="guide">시작시간</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_start">
						<br>
						<label class="guide">종료시간</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_end">
						<br>
						<input type="submit" value="계획추가">
						<input type="reset" value="초기화">
					</form>
				</div>
				<div id="calendar_box">
					<div id="prevkey">
						<img src="${pageContext.request.contextPath}/resources/left.png">
					</div>
					<div id="calendar">
					
					</div>
					<div id="nextkey">
						<img src="${pageContext.request.contextPath}/resources/right.png">
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
					<div id="today_time">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>