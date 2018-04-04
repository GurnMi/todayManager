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
<script type="text/javascript">
	$(function(){
		$("#del").click(function(){
			if(confirm("정말 탈퇴하시겠습니까?")){ 
	            $(location).attr('href', "${pageContext.request.contextPath}/login/leave");
	            
	         }else{
	            return;
	         }
	      });
		
	})
</script>
</head>
<body>
	
	아이디 : ${sessionScope.user.user_id }
	닉네임 : ${sessionScope.user.user_nick }님 로그인 되었습니다.
	
	<br><br>
	
	<a href="${pageContext.request.contextPath}/repeat/insert">반복 학습 입력</a>
	<a href="${pageContext.request.contextPath}/repeat/select">반복 학습 보기</a>
	
	<br>
	
	<a href="${pageContext.request.contextPath}/login/update">닉네임 변경</a>
	<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
	<a href="#" id="del">회원 탈퇴</a>
	
</body>
</html>