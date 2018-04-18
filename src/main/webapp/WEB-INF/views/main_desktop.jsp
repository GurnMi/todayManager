<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>TODAY MANAGER MAIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=8">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.xdomainajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.xdomainajax.js"></script>
<script type="text/javascript">
	function loginSuccess(id){
		$("#id").val(id);
		$("#form").submit();
	}
	function weather_load(zone){
		$.ajax({
			url:"http://www.weather.go.kr/wid/queryDFSRSS.jsp?zone="+zone,
			type:"get",
			dataType:"xml",
			success:function(result){
				var now = $(result.responseText).find("data[seq='0']").find("wfkor").html();
				weather_background(now);
				weather_icon(now);
			}
		});
	}
	function weather_background(str){
		if(str == "맑음"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "구름 조금"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "구름 많음"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "흐림"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "비"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "눈/비"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "눈"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
	}
	function weather_icon(str){
		if(str == "맑음"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "구름 조금"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "구름 많음"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "흐림"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "비"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "눈/비"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "눈"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
	}
	
	$(function(){
		// 기본지역 : 대구광역시 남구 대명2동
		weather_load("2720057100");
		// 카카오 초기화
		Kakao.init('073bab6d5ebe961bfb1e314c96760511');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						console.log(res.kaccount_email);
		         		loginSuccess(res.kaccount_email);
		         	}
	    		})
	    	},
		    fail: function(err) {
		    	alert(JSON.stringify(err));
			}
		});
		
		// 날씨정보 위치
		$("#town_sido").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("시/도 불러오기 시작");
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/sido",
				type:"get",
				dataType:"text",
				success:function(result){
					$("#search_area1").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#select_sido").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("구/군 불러오기 시작");
			var sido = $("#search_area1").val();
			$("#search_area1").find("option[selected]").removeAttr("selected");
			$("#search_area1").find("option").each(function(index, obj){
				if($(obj).val() == sido){
					$(obj).attr("selected", "selected");
				}
			});
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/gungu?sido="+sido,
				type:"get",
				dataType:"text",
				success:function(result){
					console.log(result);
					$("#search_area2").empty();
					$("#search_area2").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#select_gugun").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("동 불러오기 시작");
			var sido = $("#search_area1").val();
			var gugun = $("#search_area2").val();
			$("#search_area2").find("option[selected]").removeAttr("selected");
			$("#search_area2").find("option").each(function(index, obj){
				if($(obj).val() == gugun){
					$(obj).attr("selected", "selected");
				}
			});
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/dong?sido="+sido+"&gugun="+gugun,
				type:"get",
				dataType:"text",
				success:function(result){
					console.log(result);
					$("#search_area3").empty();
					$("#search_area3").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#area_save").on("click",function(){
			var dong = $("#search_area3").val();
			$("#search_area3").find("option[selected]").removeAttr("selected");
			$("#search_area3").find("option").each(function(index, obj){
				if($(obj).val() == dong){
					$(obj).attr("selected", "selected");
				}
			});
			$("#town_sido").html($("#search_area1").find("option[selected]").text());
			$("#town_gungu").html($("#search_area2").find("option[selected]").text()+" "+$("#search_area3").find("option[selected]").text());
			
			console.log("XML 불러오기 시작");
			weather_load(dong);
		});
		
		$("#move_home").on("click",function(){
			location.href = "${pageContext.request.contextPath}/";
		});
		$("#move_today").on("click",function(){
			location.href = "today/";
		});
		$("#move_diary").on("click",function(){
			location.href = "diary/";
		});
	});
</script>
</head>
<body>
	<div id="set_area" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지역을 선택해주세요</h4>
				</div>
				<div class="modal-body" id="modal_body">
					<div id="loadingbar" class="container">
						<div>
							<div class="progress">
								<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
									LOADING...
								</div>
							</div>
						</div>
					</div>
					<select id="search_area1"></select>
					<button type="button" id="select_sido">검색</button>
					<br>
					<select id="search_area2">
						<option>---</option>
					</select>
					<button type="button" id="select_gugun">검색</button>
					<br>
					<select id="search_area3">
						<option>---</option>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="area_save">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="menu_container">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/diary_icon.png" id="move_diary">
				<img src="${pageContext.request.contextPath}/resources/images/today_icon.png" id="move_today">
				<img src="${pageContext.request.contextPath}/resources/images/home_icon.png" id="move_home">
			</div>
		</div>
		<div id="main_container">
			<div class="row">
				<div id="weather">
					<p id="day_info">Tuesday, 15 November</p>
					<img id="icon" src="${pageContext.request.contextPath}/resources/images/weather_sun.png">
					<p id="town_sido" data-toggle="modal" data-target="#set_area">대구광역시</p>
					<p id="town_gungu" data-toggle="modal" data-target="#set_area">남구 대명2동</p>
				</div>
			</div>
			<div class="row">
				<div id="login">
					<c:if test="${sessionScope.user.user_id==null}">
						<p>로그인 후 사용하실 수 있습니다.</p>
						<br>
						<a id="kakao-login-btn"></a>
					    <a href="http://developers.kakao.com/logout"></a>
					    <form action="${pageContext.request.contextPath}/login/" method="post" id="form">
					    	<input type="text" name="id" id="id" hidden="hidden">
					    </form>
					</c:if>
					<c:if test="${sessionScope.user.user_id!=null }">
						아이디 : ${sessionScope.user.user_id }<br>
						닉네임 : ${sessionScope.user.user_nick }님 로그인 되었습니다.
						<br>
						<a href="${pageContext.request.contextPath}/login/update">닉네임 변경</a>
						<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
						<a href="#" id="del">회원 탈퇴</a>
					</c:if>
				</div>
			</div>
			<div class="row">
				<c:if test="${sessionScope.user.user_id!=null}">
					<div id="notepad">
						<p>당신의 웹픽입니다. 무엇을 기억할까요?</p>
						<ul>
							<li>메모하자아아아아아아아아아아아</li>
							<li>메모하자아아아아아아아아아</li>
							<li>메모하자아아아아아아아</li>
							<li>메모하자아아아아아</li>
							<li>메모하자아아아</li>
						</ul>
						<input type="button" value="등록하기" id="add_memo">
					</div>
				</c:if>
				<c:if test="${sessionScope.user.user_id==null}">
					<div id="notepad_nouser">
						<img src="${pageContext.request.contextPath}/resources/images/webpick_icon.png">
						<p>웹픽 기능을 사용하시려면 로그인이 필요합니다.</p>
					</div>
				</c:if>
			</div>
			<c:if test="${sessionScope.user.user_id!=null}">
				<div class="row">
					<div id="notepad">
						<p>TODAY</p>
						<ul>
							<li>메모하자아아아아아아아아아아아</li>
							<li>메모하자아아아아아아아아아</li>
							<li>메모하자아아아아아아아</li>
							<li>메모하자아아아아아</li>
							<li>메모하자아아아</li>
							<li>메모하자아아아아아아아아아아아</li>
							<li>메모하자아아아아아아아아아</li>
							<li>메모하자아아아아아아아</li>
							<li>메모하자아아아아아</li>
							<li>메모하자아아아</li>
						</ul>
						<input type="button" value="게시판가기" id="add_memo">
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>