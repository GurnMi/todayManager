<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
			
			
			
		
		
	})
</script>

</head>
<body>
	
	이메일 : ${sessionScope.user.user_id }
	
	
	<form action="${pageContext.request.contextPath}/login/update" method="post" name="f1">
		<p>
			<label>이메일(아이디)</label>
			<input type="text" name="user_id" value="${sessionScope.user.user_id }" readonly="readonly">
		</p>
		<p>
			<label>닉네임</label>
			<input type="text" name="user_nick" value="${sessionScope.user.user_nick}" placeholder="한글,영문,숫자 2-10자리">
			<button id="nick">닉네임 중복체크</button>
			<span class="error">이미 존재하는 닉네임 입니다.</span>
			<span class="success">사용 가능한 닉네임 입니다.</span>
		</p>
		<p>
			<input type="submit" value="닉네임변경">
		</p>
	</form>
	
	 
</body>
</html>