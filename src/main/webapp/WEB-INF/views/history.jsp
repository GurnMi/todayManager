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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function(){
			/* $.ajax({
				//해당 날짜로 값 가져오기
				url:"${pageContext.request.contextPath}/history/all/2018-04-13",
				type:"get",
				headers:{"Content-Type":"application/json"},
				dataType:"json",
				success:function(result){
					console.log(result);
					
				}
			}) */
		
			
			google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawChart);

		      function drawChart() {
		    	  var data2 = "[['Task', 'Hours per Day'],";
		    	  var dataArr = new Array();
		    	  dataArr[0] = ['Task', 'Hours per Day'];
		    	  $.ajax({
						//해당 날짜로 값 가져오기
						url:"${pageContext.request.contextPath}/history/all/2018-04-13",
						type:"get",
						headers:{"Content-Type":"application/json"},
						dataType:"json",
						success:function(result){
							
							for(var i=0;i<result.min.length;i++){
								var dataArr1 = new Array();
								dataArr1[0] = result.type[i];
								dataArr1[1] = Number(result.min[i]);
								dataArr[i+1] = dataArr1;  
								
								data2 += "['"+result.type[i]+"',"+Number(result.min[i])+"]";
								
								if(i+1<result.min.length){
									data2 += ",";	
								}
								
							}
							data2+= "]";
							console.log(data2+"//////////////");  
							 
							
							chart(dataArr);
							
						}
		    	  })
		    	  
		    		    	 
		    	
		    	  
		        
		      }
		      
		      function chart(data2){
		    	  var data = google.visualization.arrayToDataTable(data2);

			        
			        
			        var options = {
			          title: 'My Daily Activities'
			        };

			        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

			        chart.draw(data, options);
		      }
	      
	})
	
	
</script>
</head>
<body>
	
	  <div id="piechart" style="width: 900px; height: 500px;"></div>

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