<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>Insert title here</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js" type="text/javascript" ></script>
<script src=" https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript" ></script>
<script language="JavaScript" src="/common/js/jquery-ui-timepicker-addon.js"></script>
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
		
		$(document).ready(function(){
		    $('input.timepicker').timepicker({});
		});
		$('#CM_CRT_SDTE1').timepicker({
			 timeFormat: 'HH:mm',
			 showOn: 'button',
			 buttonImage: '/common/img/btn_calendar.gif',
			 buttonImageOnly: true
			});

	
	})
	
</script>
</head>
<body>
	
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
		<input type="datetime" name="CM_CRT_SDTE1" id="CM_CRT_SDTE1" value="" size="6" style="text-align:center;">


		
		<input type="datetime" class="timepicker" value="" size="6" style="text-align:center;">


	</form>
	

</body>
</html>