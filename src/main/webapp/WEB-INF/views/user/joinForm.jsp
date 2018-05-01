<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=10">
<style type="text/css">
	.error{
		color:red;
		display: none;
	}
	.success{
		color:green;
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		var nickCheck = false;
		var nick = "";
		
		
		$("#nick").click(function(){
			nick = $("input[name='user_nick']").val();
			if(nick==""){
				//$(".error").css("display","block");
				$(".success").css("display","none");
				$(".error").css("display","none");
				nickCheck = false;
				return false;
			}
			var regName =/^[a-zA-Z0-9ㄱ-힣]{2,10}$/;
			if(!regName.test(nick)){	
				alert("닉네임 양식을 확인해주세요");
				nickCheck = false;
				return false;
			}
			$.ajax({
				url:"nickCheck?nick="+nick,
				type:"get",
				success:function(result){
					if(result=="true"){
						alert("이미존재하는 닉네임 입니다. 다시 선택해 주세요");
						$("input[name='userid']").val("");
						$(".error").css("display","block");
						$(".success").css("display","none");
						nickCheck = false;
						return false;
					}else{
						alert("사용가능한 닉네임 입니다.");
						$(".error").css("display","none");
						$(".success").css("display","block");
						nickCheck = true;
						return false;
					}
				}
			})
			return false;
		})
		
		
		$("form[name='f1']").submit(function(){
			if(!nickCheck){
				alert("닉네임 중복을 확인해주세요");
				return false;
			} 
			var nick1 = $("input[name='user_nick']").val();
			if(nick!=nick1){
				alert("닉네임 중복을 확인해주세요");
				return false;
			}
		})
		
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
	})
</script>
</head>
<body>
	<div id="menu_container">
		<div>
			<img src="${pageContext.request.contextPath}/resources/images/menu_repeat.png" id="move_repeat">
			<img src="${pageContext.request.contextPath}/resources/images/menu_diary.png" id="move_diary">
			<img src="${pageContext.request.contextPath}/resources/images/menu_today.png" id="move_today">
			<img src="${pageContext.request.contextPath}/resources/images/menu_home.png" id="move_home">
		</div>
	</div>
	<div id="nick_container">
		<div class="row">
			<div id="update">
				<form action="${pageContext.request.contextPath}/login/join" method="post" name="f1">
					<p>
						<label>이메일(아이디)</label>
						<input type="text" name="user_id" value="${id }" readonly="readonly">
					</p>
					<p>
						<label>닉네임</label>
						<input type="text" name="user_nick" placeholder="한글,영문,숫자 2-10자리">
						<button id="nick">닉네임 중복체크</button>
						<span class="error">이미 존재하는 닉네임 입니다.</span>
						<span class="success">사용 가능한 닉네임 입니다.</span>
					</p>
					<p>
						<input type="submit" value="가입">
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>