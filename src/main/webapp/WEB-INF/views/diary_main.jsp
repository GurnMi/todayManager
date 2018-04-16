<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=6">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=3">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/diary_contents.js?var=5"></script>
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
				
				//해당 날짜로 값 가져오기
				$.ajax({
					url:"${pageContext.request.contextPath}/diary/?today="+load_diary,
					type:"post",
					dataType:"json",
					success:function(result){
						console.log(list);
						$("#diary_box").empty();
					
						var str = "";
						str += "<div id='day'>";
						str += "<p id='d'></p>";
						str += "<p id='m'></p>";
						str += "</div>";
						str += "<div id='contents'>";
						str += "<input type='hidden' value='${"+result.dia_no+"}'>";
						str += "<div id='mark'>";
						for(var i=0 ; i<result[0].diary_mark ; i++){
							if(result[0].diary_mark >= i)
								str += "<img src='${pageContext.request.contextPath}/resources/images/diary_star_select.png' data-value='${" + i + "}''>";
							else
								str += "<img src='${pageContext.request.contextPath}/resources/images/diary_star.png' data-value='${" + i + "}'>";
						}
						str += "</div>";
						str += "<div id='title'>";
						str += "<p>${list[0].diary_title}</p>";
						str += "</div>";
						str += "<div id='content'>";
						str += "<p>${list[0].diary_content}</p>";
						str += "</div>";
						str += "<div id='btn'>";
						str += "<button type='button' class='btn' id='btn_insert'>수정</button>";
						str += "<button type='button' class='btn' id='btn_cancle'>삭제</button>";
						str += "</div>";
						str += "</div>";
						
						$("#diary_box").append(str);
					},
					error:function(){
						console.log("error");
						$("#diary_box").empty();
						
						var str = "";
						str += "<div id='day'>";
						str += "<p id='d'></p>";
						str += "<p id='m'></p>";
						str += "</div>";
						str += "<div id='contents_empty'>";
						str += "해당 날짜에 존재하는 일기가 없습니다.<br>";
						str += "일기를 작성하시겠어요?<br><br>";
						str += "<button type='button' class='btn' id='btn_insert'>작성</button>";
						str += "</div>";
					}
				})
			}
		});
		
		$("#btn_insert").on("click", function(){
			location.href = "register";
		});
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">DIARY</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath}/maintest">HOME</a></li>
						<li><a href="${pageContext.request.contextPath}/todaytest">TODAY</a></li>
						<li><a href="${pageContext.request.contextPath}/diarytest">DIARY</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="diray_container">
			<div class="row">
				<div>
					임시 메뉴공간 확보하는 구역
				</div>
			</div>
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
									<button type="button" class="btn" id="btn_insert">수정</button>
									<button type="button" class="btn" id="btn_cancle">삭제</button>
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