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
</head>
<body>
		
	아이디 : ${sessionScope.user.user_id }
	닉네임 : ${sessionScope.user.user_nick }
	<br>
	<br>
	
	<a href="${pageContext.request.contextPath}/diary/register">일기쓰기</a>
	<a href="${pageContext.request.contextPath}/login/main">메인</a>
	
	<br><br>
	
	<table>
	<c:if test="${list!=null }">
		
		<c:forEach var="DiaryVO" items="${list }">
		
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
		
		
	</c:if>
	</table>

</body>
</html>