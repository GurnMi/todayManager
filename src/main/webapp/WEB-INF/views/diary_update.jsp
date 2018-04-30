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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=2">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/today_calendar.js?var=5"></script>
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
			
			var strDate = "${select}";
			var strArr = strDate.split(".");
						
			cal_save_select.setFullYear(strArr[0], (strArr[1]-1), strArr[2]);
			$("#calendar").find(".cal_select").removeClass("cal_select");
			cal_load_date();
			
			$("#day #d").text(cal_save_select.getDate());
			$("#day #m").text(cal_save_select.getFullYear()+"."+(cal_save_select.getMonth()+1));
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
		
		// 평점 컨트롤
		$("#mark img").on("click",function(){
			var target = $(this);
			mark_init();
			mark_apply(target);			
		});
		
		// 달력 일 선택
		$("#calendar").on("click","td",function(){
			alert("날짜 선택 금지");
		});
		
		// DAIRY 내용 추가
		$("#btn_update").on("click",function(){
			// 날짜 확인
			if($("input[name='day']").val()==""){
				var arr = $("#day #m").text().split(".");
				var str = arr[0] + "-";
				if(arr[1] < 10)
					str += "0" + arr[1];
				else
					str += arr[1];
				str += "-" + $("#day #d").text();
				$("input[name='day']").val(str);
			}
			// 평점 확인
			if($("input[name='mark']").val()==""){
				if(confirm("평점항목이 선택되지 않았습니다.\n확인을 누르실 경우 0점으로 반영되며,\n평점을 선택하시려면 취소를 눌러주세요.")){
					$("input[name='mark']").val("0");
				}
			}
			// 제목 확인
			if($("input[name='diary_title']").val()==""){
				if(confirm("제목이 입력되지 않았습니다.\n확인을 누르실 경우 현재상태로 반영됩니다.\n제목을 입력하시려는 경우 취소를 눌러주세요.")){}
				else{return false;}
			}
			// 내용 확인
			if($("textarea[name='diary_content']").val()==""){
				if(confirm("내용이 입력되지 않았습니다.\n확인을 누르실 경우 현재상태로 반영됩니다.\n내용을 입력하시려는 경우 취소를 눌러주세요.")){}
				else{return false;}
			}
			$("form[name='f1']").submit();
		});
		
		$("#btn_cancle").on("click",function(){
			location.replace("${pageContext.request.contextPath}/diary/");
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
			location.href = "${pageContext.request.contextPath}/today/";
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
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="menu_container">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/menu_repeat.png" id="move_repeat">
				<img src="${pageContext.request.contextPath}/resources/images/menu_diary.png" id="move_diary">
				<img src="${pageContext.request.contextPath}/resources/images/menu_today.png" id="move_today">
				<img src="${pageContext.request.contextPath}/resources/images/menu_home.png" id="move_home">
			</div>
		</div>
		<div id="diray__insert_container">
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
							<form method="post" action="${pageContext.request.contextPath}/diary/update" name="f1">
								<input type="hidden" name="dia_no" value="${DiaryVO.dia_no}">
								<input type="hidden" name="day">
								<input type="hidden" name="mark" value="${DiaryVO.diary_mark}">								
								<div id="mark">
									<c:forEach var="count" begin="1" end="5" step="1">
										<c:if test="${DiaryVO.diary_mark >= count}">
											<img src="${pageContext.request.contextPath}/resources/images/diary_star_select.png" data-value="${count}">
										</c:if>
										<c:if test="${DiaryVO.diary_mark < count}">
											<img src="${pageContext.request.contextPath}/resources/images/diary_star.png" data-value="${count}">
										</c:if>
									</c:forEach>
								</div>
								<div id="title">
									<input type="text" id="add_title" placeholder="제목을 입력하세요" name="diary_title" value="${DiaryVO.diary_title}">
								</div>
								<div id="content">
									<textarea id="insert_content" name="diary_content">${DiaryVO.diary_content}</textarea>
								</div>
								<div id="btn">
									<button type="button" class="btn" id="btn_update">저장</button>
									<button type="button" class="btn" id="btn_cancle">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>