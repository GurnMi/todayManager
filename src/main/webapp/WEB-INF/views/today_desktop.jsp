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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=11">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=15">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_timeplan.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_insert.js?var=4"></script>
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
		var eventChecker = 0;

		// 페이지 최초 로드시 달력 자동 생성
		if(pageLoadControl == 0){
			cal_create(year, month, day, pageLoadControl);
			cal_s_create(year, month, day, pageLoadControl);
			pageLoadControl = 1;
			draw_time();
			
			var searchDate = year + "-";
			if(month < 10)
				searchDate += "0"+month+"-";
			else
				searchDate += month+"-";
			if(day < 10)
				searchDate += "0"+day;
			else
				searchDate += day;
			$("input[name='today']").val(searchDate);
			$.ajax({
				//해당 날짜로 값 가져오기
				url:"${pageContext.request.contextPath}/today/all/"+searchDate,
				type:"get",
				headers:{"Content-Type":"application/json"},
				dataType:"json",
				success:function(result){
					console.log(result);
					draw_getTime(result);
				}
			});
			
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
			if($(this).html() == "&nbsp;")
				return;
			
			var target = $(this).parent().parent();
			var sYear = $(target).find(".cal_year").html();
			var sMonth = $(target).find(".cal_month").html();
			var sDay = $(this).html();
			// 달력 선택정보 저장
			cal_save_select.setFullYear(sYear, sMonth-1, sDay);
			$("#calendar").find(".cal_select").removeClass("cal_select");
			$(this).addClass("cal_select");
			
			var searchDate = "";
			searchDate += sYear + "-";
			if(sMonth < 10)
				searchDate += "0"+sMonth+"-";
			else
				searchDate += sMonth+"-";
			if(sDay < 10)
				searchDate += "0"+sDay;
			else
				searchDate += sDay;
			$("input[name='today']").val(searchDate);
			$.ajax({
				//해당 날짜로 값 가져오기
				url:"${pageContext.request.contextPath}/today/all/"+searchDate,
				type:"get",
				headers:{"Content-Type":"application/json"},
				dataType:"json",
				success:function(result){
					console.log(result);
					$("div[class='load_plan']").remove();
					draw_getTime(result);
				},
				error:function(){
					console.log("error");
					$("div[class='load_plan']").remove();
				}
			});
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
			eventChecker = 0;
			var checker = $("#today_time").find(".hr_select");
			// LOAD PLAN 파악
			var loadCount = $(".load_plan").length;
			var loadPlan = new Array(loadCount);
			for(var i=0 ; i<loadCount ; i++){
				var targetPlan = new Array(2);
				targetPlan[0] = $(".load_plan").eq(i).attr("data-start");
				targetPlan[1] = $(".load_plan").eq(i).attr("data-end");
				loadPlan[i] = targetPlan;
			}
			// 시작시간이 존재할 경우 종료시간으로 설정
			if(checker.size()>0){
				var end = $(this).find("p").text();
				var start = $("#time_start").val();
				
				if(start == end){
					alert("동 시간은 선택할 수 없습니다.\n다시 선택해 주세요.");
					$("#today_time").find(".hr_select").removeClass("hr_select");
					startpos = 0;
					$("#time_start").val("");
					$("#time_end").val("");
					return;
				}
				
				// 시작시간보다 더 이른경우일 때 예외처리 필요
				if(time_compare_string(start, end)){
					var compareTime = new Array(2);
					compareTime[0] = start;
					compareTime[1] = end;
					var err_acc = 0;
					for(var i=0 ; i<loadCount ; i++){
						if(timeToTime_compare(compareTime,loadPlan[i]))
							err_acc += 0;
						else
							err_acc ++;
					}
					if(err_acc == 0 && !$(this).hasClass("load_plan")){
						var target = $(this);
						insert_end(target);
						$("#time_end").val(end);
					}
					else{
						alert("중복되는 시간이 존재합니다.\n시간을 재설정 해주세요.");
						$("#today_time").find(".hr_select").removeClass("hr_select");
						startpos = 0;
						$("#time_start").val("");
						$("#time_end").val("");
						eventChecker = 1;
					}
				}
				else{
					alert("종료시간이 시작시간보다 빠릅니다.");
					$("#today_time").find(".hr_select").removeClass("hr_select");
					startpos = 0;
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
				alert("작성중인 계획이 존재합니다.");				
			}
		});
		
		$(document).on("click",".load_plan",function(){
			var id = $(this).attr("id");
			if(eventChecker == 0){
				if(confirm("정말 삭제하시겠습니까?")){
		            $(location).attr('href', "${pageContext.request.contextPath}/today/delete?prino="+id);
		        }else{
		            return;
		        }
			}
		});
				
		$("#move_home").on("click",function(){
			location.href = "${pageContext.request.contextPath}/";
		});
		$("#move_home").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_home_over.png");
		});
		$("#move_home").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_home.png");
		});
		$("#move_today").on("click",function(){
			location.href = "${pageContext.request.contextPath}/today/todayview";
		});
		$("#move_today").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_today_over.png");
		});
		$("#move_today").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_today.png");
		});
		$("#move_diary").on("click",function(){
			location.href = "${pageContext.request.contextPath}/diary/";
		});
		$("#move_diary").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_diary_over.png");
		});
		$("#move_diary").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_diary.png");
		});
		$("#move_repeat").on("click",function(){
			location.href = "${pageContext.request.contextPath}/repeat/list";
		});
		$("#move_repeat").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_repeat_over.png");
		});
		$("#move_repeat").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_repeat.png");
		});
		
		$("input[type='reset']").on("click",function(){
			location.href = "${pageContext.request.contextPath}/today/todayview";
		});
	});
	
	function draw_getTime(result){
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
			
			draw_plan(stime , etime, plan_type, pri_no, plan_title,plan_content);
		}
		
	}
	
	function draw_plan(stime , etime, plan_type, pri_no, plan_title,plan_content){
		   var planstart = finder_timeposition(stime);
		   var planend = finder_timeposition(etime);
		   
		   
		   var tag = "<div class='load_plan' id='pri_no"+pri_no+"' data-start='"+stime+"' data-end='"+etime+"'>";
		   tag += "<span class='load_type'>["+plan_type+"]</span> <span class='load_title'>"+plan_title+"</span>";
		   //데이터 받아와서
		   tag += "</div>";
		   
		   $("#today_time").append(tag);
		   //style로 옮기기
		   $("#today_time").css("position","relative");
		   $("#pri_no"+pri_no+"").css("top",planstart+20);
		   
		   $("#pri_no"+pri_no+"").css("left","100px");
		   $("#pri_no"+pri_no+"").css("width","85%");
		   var height = (planend - planstart) + "px";
		   $("#pri_no"+pri_no+"").css("height",height);
		   if(plan_type == "공부"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,0,0,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "일"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,94,0,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "운동"){
			   $("#pri_no"+pri_no+"").css("background","rgba(255,228,0,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "취미"){
			   $("#pri_no"+pri_no+"").css("background","rgba(29,219,22,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "휴식"){
			   $("#pri_no"+pri_no+"").css("background","rgba(0,84,255,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "수면"){
			   $("#pri_no"+pri_no+"").css("background","rgba(1,0,255,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
		   }else if(plan_type == "기타"){
			   $("#pri_no"+pri_no+"").css("background","rgba(95,0,255,0.5)");
			   $("#pri_no"+pri_no+"").css("color","white");
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
</style>
</head>
<body>
	<div id="container">
		<div id="menu_container">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/menu_repeat.png" id="move_repeat">
				<img src="${pageContext.request.contextPath}/resources/images/menu_diary.png" id="move_diary">
				<img src="${pageContext.request.contextPath}/resources/images/menu_today.png" id="move_today">
				<img src="${pageContext.request.contextPath}/resources/images/menu_home.png" id="move_home">
			</div>
		</div>
		<div id="today_container">
			<div class="row">
				<div id="insert_box">
					<form action="${pageContext.request.contextPath}/today/today" method="post" id="insertForm">
						<br>
						
						
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
						<!-- <label class="guide">내용</label>
						<input type="text" class="content" placeholder="세부내용을 입력해 주세요" name="plan_content">
						<br> -->
						<label class="guide">날짜</label>
						<input type="text" placeholder="달력에서 선택해주세요." readonly="readonly" name="today">
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