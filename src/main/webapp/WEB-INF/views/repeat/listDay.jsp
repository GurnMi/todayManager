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
		$("form[name='f1']").submit(function(){
			
		})
	})

</script>
</head>
<body>
	아이디 : ${sessionScope.user.user_id }
	닉네임 : ${sessionScope.user.user_nick }
	<br>
	<br>
	
	
	
	<a href="${pageContext.request.contextPath}/repeat/insert">반복 학습 입력</a>
	<a href="${pageContext.request.contextPath}/login/main">메인</a>
	<a href="${pageContext.request.contextPath}/repeat/listDay">오늘날짜</a>
	<br>
	<br>
	
	
	<form method="post" action="${pageContext.request.contextPath}/repeat/listDay" name="f1">
		<input type="date" name="startday">
		<input type="date" name="endday">
		<input type="submit" value="해당 날짜 보기">	
	</form>
	
	<br>
	<br>
		<fmt:formatDate value="${start }" pattern="yyyy-MM-dd"/>~~
		<fmt:formatDate value="${end }" pattern="yyyy-MM-dd"/>

	<table>
		<tr>
			<th>번호</th>
			<th>종류</th>
			<th>제목</th>
			<th>요일</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			
		</tr>
	<c:forEach var="RepeatVO" items="${list }">
		<tr>
			<td>${RepeatVO.rep_no }</td>
			<td>${RepeatVO.rep_type }</td>
			<td>${RepeatVO.rep_title }</td>
			<td>${RepeatVO.rep_day }</td>
			<td><fmt:formatDate value="${RepeatVO.rep_start }" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${RepeatVO.rep_end }" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${RepeatVO.rep_start }" pattern="HH:mm"/></td>
			<td><fmt:formatDate value="${RepeatVO.rep_end }" pattern="HH:mm"/></td>
			
		</tr>
	</c:forEach>
	</table>

</body>
</html>