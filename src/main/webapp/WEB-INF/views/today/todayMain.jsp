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
			var day = $("input[name='today']").val();
			var startTime = $("input[name='start_time']").val();
			
			var startDate = new Date(day+"T"+startTime);
			//alert(startDate);
			
			$("input[name='start_date']").val(startDate);
			
			
			var endTime = $("input[name='end_time']").val();
			
			var endDate = new Date(day+"T"+endTime);
			//alert(date);
			
			$("input[name='end_date']").val(endDate);
			
			
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
		<c:if test="${!dump}">
			<c:forEach var="TodayVO" items="${tolist }">
				<tr>
					<td>${TodayVO.pri_no }</td>
					<td>${TodayVO.plan_type }</td>
					<td>${TodayVO.plan_title }</td>
					<td>${TodayVO.plan_content }</td>
					<td><fmt:formatDate value="${TodayVO.start_date }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${TodayVO.end_date }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${TodayVO.start_date }" pattern="HH:mm"/></td>
					<td><fmt:formatDate value="${TodayVO.end_date }" pattern="HH:mm"/></td>
					<td><a href="${pageContext.request.contextPath}/today/delete?prino=${TodayVO.pri_no }">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<form method="post" action="${pageContext.request.contextPath}/today/" name="f1">
		<p>
			<label>종류</label>
			<input type="text" name="plan_type">
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="plan_title">
		</p>
		<p>
			<label>내용</label>
			<input type="text" name="plan_content">
		</p>
		<p>
			<label>오늘</label>
			<input type="date" name="today">
		</p>
		<p>
			<label>시작시간</label>
			<input type="time" name="start_time">
		</p>
		<p>
			<label>종료시간</label>
			<input type="time" name="end_time">
		</p>
		<p>
			<input type="submit" value="추가">
		</p>
		<p>
			<label>시작</label>
			<input type="datetime" name="start_date">
		</p>
		<p>
			<label>종료</label>
			<input type="datetime" name="end_date">
		</p>
	</form>
	
	
	${pageContext.request.contextPath}
	<form method="post" action="register">
		
	</form>
	

</body>
</html>