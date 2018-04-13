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
	<c:if test="${Diary }">
		<table>
			<c:forEach var="DiaryVO" items="${diarylist }">
				<tr>
					<td>${DiaryVO.dia_no }</td>
					<td>${DiaryVO.diary_title }</td>
					<td>${DiaryVO.diary_content }</td>
					<td><fmt:formatDate value="${DiaryVO.diary_day }" pattern="yyyy-MM-dd"/></td>
					<td>${DiaryVO.diary_mark }</td>
					<td><a href="${pageContext.request.contextPath}/diary/delete?diano=${DiaryVO.dia_no }">삭제</a></td>
					<td><a href="${pageContext.request.contextPath}/diary/update?diano=${DiaryVO.dia_no }">수정</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${!Diary }">
		<h1>입력된 일기가 없습니다.</h1>
	</c:if>
	
	<br><br>
	
	<c:if test="${Today }">
		<table>
			<c:forEach var="TodayVO" items="${todaylist }">
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
		</table>		
	</c:if>
	
	<c:if test="${!Today }">
		입력된 일과가 없습니다.
	</c:if>
	

</body>
</html>