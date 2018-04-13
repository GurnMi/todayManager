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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=9">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/diary_contents.js?var=4"></script>
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
			}
		});
		
		$("#mark img").on("click",function(){
			var target = $(this);
			mark_init();
			mark_apply(target);			
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
						<li><a href="maintest">HOME</a></li>
						<li><a href="todaytest">TODAY</a></li>
						<li><a href="diarytest">DIARY</a></li>
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
						<div id="contents">
							<div id="mark">
								<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="1">
								<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="2">
								<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="3">
								<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="4">
								<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="5">
							</div>
							<h3>${list}</h3>
							
							<c:if test="${Diary }">
								<c:forEach var="DiaryVO" items="${list }">
									<p>${DiaryVO.dia_no }</p>
									<p>${DiaryVO.diary_title }</p>
									<p>${DiaryVO.diary_content }</p>
									<p><fmt:formatDate value="${DiaryVO.diary_day }" pattern="yyyy-MM-dd"/></p>
									<p>${DiaryVO.diary_mark }</p>
									<p><a href="${pageContext.request.contextPath}/diary/delete?diano=${DiaryVO.dia_no }">삭제</a></p>
									<p><a href="${pageContext.request.contextPath}/diary/update?diano=${DiaryVO.dia_no }">수정</a></p>
								</c:forEach>
							</c:if>
							<c:if test="${!Diary }">
								<div id="title">
									<p>이곳은 제목입니다.</p>
									<input type="text" id="add_title" placeholder="제목을 입력하세요" name="diary_title">
								</div>
								<div id="content">
									
									<p>
										작성한 일기가 없습니다.<br>
										새로운 일기를 작성하시겠어요?
									</p>
									<p>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
										이곳은 내용을 넣을 곳입니다.<br>
									</p>
								</div>
							</c:if>
							<input type="button" value="추가" onclick="add_content()">
							<input type="button" value="수정" onclick="modify_content()">
							<input type="button" value="삭제">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>