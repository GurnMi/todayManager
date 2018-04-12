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
		
	
		
		$.ajax({
			//해당 날짜로 값 가져오기
			url:"${pageContext.request.contextPath}/today/all/2018-04-12",
			type:"get",
			headers:{"Content-Type":"application/json"},
			dataType:"json",
			success:function(result){
				console.log(result);
				draw_getTime(result);
				
			}
		})
		
		
		$(document).on("click",".load_plan",function(){
			var id = $(this).attr("id");
			if(confirm("정말 삭제하시겠습니까?")){
	            //alert(path);
	            $(location).attr('href', "${pageContext.request.contextPath}/today/delete?prino="+id);
	         }else{
	            return;
	         }
		})
		
	});
	
	
	
	function draw_getTime(result){
		//console.log(result);
		/* var start_time;
		var end_time; */
		
		for(var i=0;i<result.length;i++){
			var start_time = new Date(result[i].start_date);
			var end_time = new Date(result[i].end_date);
			
			var shours = start_time.getHours();
			var sminute = start_time.getMinutes();
			
			if(shours==23 && sminute==59){
				var shours = "24";
				var sminute ="00";
			}else{
				if(shours< 10)
					shours = "0" + shours;
				if(sminute==0)
					sminute = "00"
			}
			
			var stime = shours +":" +sminute;
			
			var ehours = end_time.getHours();
			var eminute = end_time.getMinutes();
			
			if(ehours==23 && eminute==59){
				var ehours = "24";
				var eminute ="00";
			}else{
				if(ehours< 10)
					ehours = "0" + ehours;
				if(eminute==0)
					eminute = "00"
			}
			var etime = ehours +":" + eminute;
			
			var plan_type = result[i].plan_type;
			var pri_no = result[i].pri_no;
			var plan_title = result[i].plan_title;
			var plan_content = result[i].plan_content;
			
			
			draw_plan(stime , etime, plan_type, pri_no, plan_title,plan_content)
			//alert(stime);
		}
		//alert(start_time);
		
	}
	
	
	function draw_plan(stime , etime, plan_type, pri_no, plan_title,plan_content){
		   var planstart = finder_timeposition(stime);
		   var planend = finder_timeposition(etime);
		   
		   
		   var tag = "<div class='load_plan' id='pri_no"+pri_no+"'>";
		   tag += plan_type+"<br>"+ plan_title+"<br>"+plan_content;
		   //데이터 받아와서
		   tag += "</div>";
		   
		   $("#today_time").append(tag);
		   //style로 옮기기
		   $("#today_time").css("position","relative");
		   $("#pri_no"+pri_no+"").css("top",planstart+20);
		   
		   $("#pri_no"+pri_no+"").css("left","100px");
		   $("#pri_no"+pri_no+"").css("width","75%");
		   var height = (planend - planstart) + "px";
		   $("#pri_no"+pri_no+"").css("height",height);
		   if(plan_type == "공부"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,0,0,0.5)");
		   }else if(plan_type == "일"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,94,0,0.5)");
		   }else if(plan_type == "운동"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,228,0,0.5)");
		   }else if(plan_type == "취미"){
			   $("#pri_no"+pri_no+"").css("background","rgba(29,219,22,0.5)");
		   }else if(plan_type == "휴식"){
			   $("#pri_no"+pri_no+"").css("background","rgba(0,84,255,0.5)");
		   }else if(plan_type == "수면"){
			   $("#pri_no"+pri_no+"").css("background","rgba(1,0,255,0.5)");
		   }else if(plan_type == "기타"){
			   $("#pri_no"+pri_no+"").css("background","rgba(95,0,255,0.5)");
		   }
		 
		   
		   $("#pri_no"+pri_no+"").css("z-index",99);
		   $("#pri_no"+pri_no+"").css("position","absolute");
		  
		   
	}
	
	function finder_timeposition(time){
	   var times = $("#today_time").find("div");
	   for(var i=0 ; i<times.length ; i++){
	      if($(times[i]).find("p").text() == time)
	         return $(times[i]).position().top;
	   }
	}
</script>
<style type="text/css">
	#today_container #timetable_box #today_time{
		position: relative;
	}
	/* #today_container #timetable_box #today_time .load_plan{
      position : absolute;
      background : red;
      z-index:99;
      
   } */
	
</style>
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
					<form action="${pageContext.request.contextPath}/today/today" method="post">
						<label class="guide">카테고리</label>
						<select name="plan_type">
							<option value="수면">수면</option>
							<option value="휴식">휴식</option>
							<option value="일">일</option>
							<option value="공부">공부</option>
							<option value="운동">운동</option>
							<option value="취미">취미</option>
							<option value="기타">기타</option>							
						</select>
						<br>
						<label class="guide">제목</label>
						<input type="text" class="title" placeholder="화면에 표시될 제목을 입력해주세요." name="plan_title">
						<br>
						<label class="guide">내용</label>
						<input type="text" class="content" placeholder="세부내용을 입력해 주세요" name="plan_content">
						<br>
						<label class="guide">날짜</label>
						<input type="text" placeholder="달력에서 선택해주세요." readonly="readonly" value="2018-04-12" name="today">
						<br>
						<label class="guide">시작시간</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_start" name="time_start">
						<br>
						<label class="guide">종료시간</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_end" name="time_end">
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