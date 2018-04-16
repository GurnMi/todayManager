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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=4">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=5">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function loginSuccess(id){
		$("#id").val(id);
		$("#form").submit();
	}
	
	$(function(){
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
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">HOME</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath}/">HOME</a></li>
						<li><a href="${pageContext.request.contextPath}/today/">TODAY</a></li>
						<li><a href="${pageContext.request.contextPath}/diary/">DIARY</a></li>
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
		<div id="main_container">
			<div class="row">
				<div id="top_box">
					
				</div>
			</div>
			<div class="row">
				<div id="weather">
					<p id="day_info">Tuesday, 15 November</p>
					<img src="${pageContext.request.contextPath}/resources/images/weather_sun.png">
					<p id="town_sido">Seoul, Republic Of Korea</p>
					<p id="town_gungu">Gwanak-gu</p>
					<br>
					<br>
					<button id="find">시도찾기</button>
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