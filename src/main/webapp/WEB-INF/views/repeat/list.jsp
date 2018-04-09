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
	table, tr, td, th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
	}
	
</style>
<script type="text/javascript">
$(function(){
	$("form[name='f1']").submit(function(){
		var startDay = $("input[name='rep_start_day']").val();
		var startTime = $("input[name='rep_start_time']").val();
		
		var startDate = new Date(startDay+"T"+startTime);
		//alert(startDate);
		
		$("input[name='rep_start']").val(startDate);
		
		var endDay = $("input[name='rep_end_day']").val();
		var endTime = $("input[name='rep_end_time']").val();
		
		var endDate = new Date(endDay+"T"+endTime);
		//alert(date);
		
		$("input[name='rep_end']").val(endDate);
		
		//return false;
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
	
	<br>
	<br>
	
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
			<th>삭제</th>
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
				<td><a href="${pageContext.request.contextPath}/repeat/delete?repno=${RepeatVO.rep_no }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<form method="post" action="${pageContext.request.contextPath}/repeat/insert" name="f1">
		<p>
			<label>종류</label>
			<input type="text" name="rep_type">
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="rep_title">
		</p>
		<p>
			<label>요일</label>
			<input type="text" name="rep_day">
		</p>
		<p>
			<label>시작일</label>
			<input type="date" name="rep_start_day">
		</p>
		<p>
			<label>종료일</label>
			<input type="date" name="rep_end_day">
		</p>
		<p>
			<label>시작시간</label>
			<input type="time" name="rep_start_time">
		</p>
		<p>
			<label>종료시간</label>
			<input type="time" name="rep_end_time">
		</p>
		<p>
			<input type="submit" value="추가">
		</p>
		<p>
			<label>시작</label>
			<input type="datetime" name="rep_start">
		</p>
		<p>
			<label>종료</label>
			<input type="datetime" name="rep_end">
		</p>
		
	</form>
	
	${result }===============
	
	<c:if test="${result == 'error'}">
		<script type="text/javascript">
			alert("겹치는 시간 존재")
		</script>
	</c:if>
	<c:if test="${result == 'success'}">
		<script type="text/javascript">
			alert("입력성공");
		</script>
	</c:if>
</body>
</html>