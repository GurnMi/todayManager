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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<style type="text/css">
	table, tr, td, th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		Handlebars.registerHelper("DateDay",function(value){
			var dateObj = new Date(value);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth()+1;
			var date = dateObj.getDate();
			return year+"/"+month+"/"+date;
		})
		
		Handlebars.registerHelper("DateTime",function(value){
			var dateObj = new Date(value);
			var hours = dateObj.getHours();
			var minute = dateObj.getMinutes();
			return hours +" : " + minute;
		})
		
		
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
		
		
		var templateFunc = Handlebars.compile($("#template").html());
		
		$.ajax({
			//해당 날짜로 값 가져오기
			url:"${pageContext.request.contextPath}/today/all/2018-04-10",
			type:"get",
			headers:{"Content-Type":"application/json"},
			dataType:"json",
			success:function(result){
				console.log(result);
				//alert(result);
				var data = templateFunc(result);
				console.log(data);
				$(".test").html(data);
			}
		})
		
		
	})
	
</script>

</head>
<body>
	<script type="text/x-handlebars-template" id="template">
	{{#each.}}
		<tr>
			<td>{{pri_no }}</td>
			<td>{{plan_type }}</td>
			<td>{{plan_title }}</td>
			<td>{{plan_content }}</td>
			<td>{{DateDay start_date }}</td>
			<td>{{DateTime start_date }}</td>
			<td>{{DateTime end_date }}</td>
			

		</tr>
	{{/each}}
	</script>

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
	
	<div class="test">  
	
	</div>
	
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