<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=4">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=8">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/diary_contents.js?var=5"></script>
<script type="text/javascript">
	var setDate = "";
	
	$(function(){
		var date = new Date();
		var baseDate = date;
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var pageLoadControl = 0;
		
		setDate = year +"-"+ month +"-"+ day;

		// 페이지 최초 로드시 달력 자동 생성
		if(pageLoadControl == 0){
			cal_create(year, month, day, pageLoadControl);
			pageLoadControl = 1;
			$("#day #d").text(day);
			$("#day #m").text(year+"."+month);
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
				
		// 달력 일 선택
		$("#calendar").on("click","td",function(){
			if($(this).html() != "&nbsp;"){
				var target = $(this).parent().parent();
				var sYear = $(target).find(".cal_year").html();
				var sMonth = $(target).find(".cal_month").html();
				var sDay = $(this).html();
				// 달력 선택정보 저장
				cal_save_select.setFullYear(sYear, sMonth-1, sDay);
				$("#calendar").find(".cal_select").removeClass("cal_select");
				$(this).addClass("cal_select");
				// 일기 선택정보 반영
				$("#day #d").text(sDay);
				$("#day #m").text(sYear+"."+sMonth);
				
				var load_diary = "";
				load_diary += sYear;
				if(sMonth < 10)
					load_diary += "-"+"0"+sMonth;
				else
					load_diary += "-"+sMonth;
				
				if(sDay < 10)
					load_diary += "-"+"0"+sDay;
				else
					load_diary += "-"+sDay;
				
				setDate = load_diary;
				//차트 생성
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				//해당 날짜로 값 가져오기
				$.ajax({
					url:"${pageContext.request.contextPath}/diary/today/"+load_diary,
					type:"get",
					dataType:"json",
					success:function(result){
						console.log(result);
						$("#diary_box").empty();
						var str = "";
												
						if(result != ""){
							
							str += "<div id='day'>";
							str += "<p id='d'>"+cal_save_select.getDate()+"</p>";
							str += "<p id='m'>"+cal_save_select.getFullYear()+"."+(cal_save_select.getMonth()+1)+"</p>";
							str += "</div>";
							str += "<div id='contents'>";
							str += "<input type='hidden' value='"+result[0].dia_no+"'>";
							str += "<div id='mark'>";
							for(var i=0 ; i<5 ; i++){
								if(result[0].diary_mark > i)
									str += "<img src='${pageContext.request.contextPath}/resources/images/diary_star_select.png' data-value='" + i + "'>";
								else
									str += "<img src='${pageContext.request.contextPath}/resources/images/diary_star.png' data-value='" + i + "'>";
							}
							str += "</div>";
							str += "<div id='title'>";
							str += "<p>"+result[0].diary_title+"</p>";
							str += "</div>";
							str += "<div id='content'>";
							str += "<p>"+result[0].diary_content+"</p>";
							str += "</div>";
							str += "<div id='btn'>";
							str += "<button type='button' class='btn' id='btn_update'>수정</button>";
							str += "<button type='button' class='btn' id='btn_delete'>삭제</button>";
							str += "</div>";
							str += "</div>";
						}
						else{
							str += "<div id='day'>";
							str += "<p id='d'>"+cal_save_select.getDate()+"</p>";
							str += "<p id='m'>"+cal_save_select.getFullYear()+"."+(cal_save_select.getMonth()+1)+"</p>";
							str += "</div>";
							str += "<div id='contents_empty'>";
							str += "해당 날짜에 존재하는 일기가 없습니다.<br>";
							str += "일기를 작성하시겠어요?<br><br>";
							str += "<button type='button' class='btn' id='btn_insert'>작성</button>";
							str += "</div>";
						}						
						
						$("#diary_box").append(str);
					}
				});
			}
		});
		
		// 일기 추가
		$("#diary_box").on("click", "#btn_insert", function(){
			var targetDate = "";
			targetDate += cal_save_select.getFullYear();
			targetDate += ".";
			targetDate += (cal_save_select.getMonth()+1);
			targetDate += ".";
			targetDate += cal_save_select.getDate();
			location.href = "register?select="+targetDate;
		});
		
		// 일기 수정
		$("#diary_box").on("click", "#btn_update", function(){
			var no = $(this).parent().parent().find("input[type='hidden']").val();
			var targetDate = "";
			targetDate += cal_save_select.getFullYear();
			targetDate += ".";
			targetDate += (cal_save_select.getMonth()+1);
			targetDate += ".";
			targetDate += cal_save_select.getDate();
			location.href = "update?diano="+no+"&select="+targetDate;
		});
		
		// 일기 삭제
		$("#diary_box").on("click", "#btn_delete", function(){
			var no = $(this).parent().parent().find("input[type='hidden']").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/diary/delete?diano="+no,
				type:"get",
				success:function(result){
					alert("정상적으로 삭제되었습니다");
					location.replace("${pageContext.request.contextPath}/diary/");
				}
			});
		});
		
		$("#move_home").on("click",function(){
			location.href = "${pageContext.request.contextPath}/";
		});
		$("#move_today").on("click",function(){
			location.href = "${pageContext.request.contextPath}/today/";
		});
		$("#move_diary").on("click",function(){
			location.href = "${pageContext.request.contextPath}/diary/";
		});
		
		//차트 생성
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
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
	});
	
	function drawChart() {
		var data2 = "[['Task', 'Hours per Day'],";
		var dataArr = new Array();
		dataArr[0] = ['Task', 'Hours per Day'];
		$.ajax({
			//해당 날짜로 값 가져오기
			url:"${pageContext.request.contextPath}/history/all/" + setDate,
			type:"get",
			headers:{"Content-Type":"application/json"},
			dataType:"json",
			success:function(result){
				if(result.type == "dump")
					return;
				else{
					for(var i=0;i<result.min.length;i++){
						var dataArr1 = new Array();
						dataArr1[0] = result.type[i];
						dataArr1[1] = Number(result.min[i]);
						dataArr[i+1] = dataArr1;
						data2 += "['"+result.type[i]+"',"+Number(result.min[i])+"]";
						if(i+1<result.min.length){
							data2 += ",";	
						}
					}
					data2+= "]";
					console.log(data2+"//////////////");
					chart(dataArr);
				}
			}
		});
	}
	
	function chart(data2){
		var data = google.visualization.arrayToDataTable(data2);
		var options = {legend : {
			position : 'bottom'
		}};
		var chart = new google.visualization.PieChart(document.getElementById('chart'));
		
		chart.draw(data, options);
	}
</script>
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
		<div id="diray_container">
			<div class="row">
				<div class="col">
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
					<div id="chart_box">
						<div id="chart">
					
						</div>
					</div>
				</div>
				<div class="col">
					<div id="diary_box">
						<div id="day">
							<p id="d"></p>
							<p id="m"></p>
						</div>
						<c:if test="${Diary}">
							<div id="contents">
								<input type="hidden" value="${list[0].dia_no}">
								<div id="mark">
									<c:forEach var="count" begin="1" end="5" step="1">
										<c:if test="${list[0].diary_mark >= count}">
											<img src="${pageContext.request.contextPath}/resources/images/diary_star_select.png" data-value="${count}">
										</c:if>
										<c:if test="${list[0].diary_mark < count}">
											<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="${count}">
										</c:if>
									</c:forEach>
								</div>
								<div id="title">
									<p>${list[0].diary_title}</p>
								</div>
								<div id="content">
									<p>${list[0].diary_content}</p>
								</div>
								<div id="btn">
									<button type="button" class="btn" id="btn_update">수정</button>
									<button type="button" class="btn" id="btn_delete">삭제</button>
								</div>
							</div>
						</c:if>
						<c:if test="${!Diary}">
							<div id="contents_empty">
								해당 날짜에 존재하는 일기가 없습니다.<br>
								일기를 작성하시겠어요?<br><br>
								<button type="button" class="btn" id="btn_insert">작성</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>