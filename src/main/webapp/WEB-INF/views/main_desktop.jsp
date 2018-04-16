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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=2">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
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
						<li><a href="maintest">HOME</a></li>
						<li><a href="todaytest">TODAY</a></li>
						<li><a href="diarytest">DIARY</a></li>
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
				<div>
					Tuesday, 15 November<br>
					[그림]관악구<br>
					[그림]서울, 대한민국<br>
				</div>
			</div>
			<div class="row">
				<div id="login">
					<c:if test="${sessionScope.user.user_id==null }">
						로그인 후 사용해주세요
						<br>
						<a id="kakao-login-btn"></a>
					    <a href="http://developers.kakao.com/logout"></a>
					    
					    <form action="${pageContext.request.contextPath}/login/" method="post" id="form">
					    	<input type="text" name="id" id="id" hidden="hidden">
					    	<!-- <input type="button"  id="kakao-login-btn"/>
					    	<a href="http://developers.kakao.com/logout"></a> -->
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
				
				
					<!-- <p>로그인 후 사용할수 있습니다.</p><br><br>
					<input type="button" value="Login" id="add_memo"> -->
				</div>
			</div>
			<div class="row">
				<div id="notepad">
					<p>당신의 웹 해마입니다. 무엇을 기억할까요?</p>
					<ul>
						<li>메모하자아아아아아아아아아아아</li>
						<li>메모하자아아아아아아아아아</li>
						<li>메모하자아아아아아아아</li>
						<li>메모하자아아아아아</li>
						<li>메모하자아아아</li>
					</ul>
					<input type="button" value="등록하기" id="add_memo">
				</div>
			</div>
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
			<div class="row">
				<div id="slick_box">
					<ul>
						<li class="arrow_left"><img src="${pageContext.request.contextPath}/resources/left.png"></li>
						<li>
							<ul id="first_slick">
								<li>
									<div id="today">
										<div>
											<h1>TODAY</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="memo">
										<div>
											<h1>MEMO</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_a">
										<div>
											<h1>A</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_b">
										<div>
											<h1>B</h1>
										</div>
									</div>
								</li>
								<li>
									<div id="menu_c">
										<div>
											<h1>C</h1>
										</div>
									</div>
								</li>						
							</ul>
						</li>
						<li class="arrow_right"><img src="${pageContext.request.contextPath}/resources/right.png"></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(function(){
						$("#first_slick").slick({
							infinite: true,
							slidesToShow: 3,
							slidesToScroll: 1,
							arrows:true,
							prevArrow:'.arrow_left',
							nextArrow:'.arrow_right'
						});
					});
					
					//login
					//<![CDATA[
			        // 사용할 앱의 JavaScript 키를 설정해 주세요.
			        Kakao.init('073bab6d5ebe961bfb1e314c96760511');
			        // 카카오 로그인 버튼을 생성합니다.
			        Kakao.Auth.createLoginButton({
			          container: '#kakao-login-btn',
			          success: function(authObj) {
			        	//alert(JSON.stringify(authObj));
			        	 Kakao.API.request({
			
					       url: '/v1/user/me',
					
					       success: function(res) {
					             //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력	
					             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력		
					             //console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
					             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
					            // console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
					         	// res.properties.nickname으로도 접근 가능 )
					            // console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
								//location.href("result");	
					            
					            
					            loginSuccess(res.kaccount_email);
					            
					            
					           }
					
					       })
			          },
			          fail: function(err) {
			             alert(JSON.stringify(err));
			          }
			        });
			        
			        
			        function loginSuccess(id){
			        	$("#id").val(id);
			        	$("#form").submit();
			        	//$(location).attr("href","result?id="+id);
			        }
			        
				</script>
			</div>
		</div>
	</div>
</body>
</html>