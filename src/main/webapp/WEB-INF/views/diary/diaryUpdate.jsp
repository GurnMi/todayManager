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
</head>
<body>
	아이디 : ${sessionScope.user.user_id }
	닉네임 : ${sessionScope.user.user_nick }
	<br>
	<br>
	
	<a href="${pageContext.request.contextPath}/diary/">리스트</a>
	<a href="${pageContext.request.contextPath}/login/main">메인</a>
	
	<br><br>
	
	
	<form method="post" action="${pageContext.request.contextPath}/diary/update" name="f1">
		<p>
			<label>번호</label>
			<input type="text" name="dia_no" value="${DiaryVO.dia_no }">
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="diary_title" value="${DiaryVO.diary_title }">
		</p>
		<p>
			<label>내용</label>
			<input type="text" name="diary_content" value="${DiaryVO.diary_content }">
		</p>
		<p>
			<label>날짜</label>
			<input type="date" name="day" value="<fmt:formatDate value="${DiaryVO.diary_day }" pattern="yyyy-MM-dd"/>">
		</p>
		<p>
			<label>평점</label>
			<input type="number" name="mark" value="${DiaryVO.diary_mark }">
		</p>
		
		<p>
			<input type="submit" value="추가">
		</p>
		<!-- <p>
			<label>시작</label>
			<input type="datetime" name="rep_start">
		</p> -->
		
		
	</form>
	
	${result }===============
	
	<c:if test="${result == 'error'}">
		<script type="text/javascript">
			alert("겹치는 날짜 존재")
		</script>
	</c:if>
	<c:if test="${result == 'success'}">
		<script type="text/javascript">
			alert("입력성공");
		</script>
	</c:if>
	

</body>
</html>