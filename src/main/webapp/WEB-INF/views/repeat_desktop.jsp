<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MAIN DESKTOP VERSION</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=1ㄴ">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=2">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=3">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/repeat_insert.js?var=2"></script>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">REPEAT</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="maintest">HOME</a></li>
						<li><a href="todaytest">TODAY</a></li>
						<li><a href="#tour">DIARY</a></li>
						<li><a href="#contact">BOARD</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">SETTING
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">SET1</a></li>
								<li><a href="#">SET2</a></li>
								<li><a href="#">SET3</a></li> 
							</ul>
						</li>
						<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="repeat_container">
			<div class="row">
				<div id="week_counter">
					4월 2주차
				</div>
				<div id="week_marker">
					<div>
						<p>2018 임시</p>
						<table class="calendar_marker">
							<tr>
								<th colspan="7">4</th>
							</tr>
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
							</tr>
							<tr class="this_week">
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
							</tr>
							<tr>
								<td>15</td>
								<td>16</td>
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
								<td>21</td>
							</tr>
							<tr>
								<td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
								<td>26</td>
								<td>27</td>
								<td>28</td>
							</tr>
							<tr>
								<td>29</td>
								<td>30</td>
								<td class="next_month">1</td>
								<td class="next_month">2</td>
								<td class="next_month">3</td>
								<td class="next_month">4</td>
								<td class="next_month">5</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="insert_box">
					<form action="${pageContext.request.contextPath}/repeat/insert" method="post" name="f1">
						<select>
							<option>휴식</option>
							<option>공부</option>
							<option>운동</option>
							<option>기타</option>
						</select>
						<input type="text" placeholder="제목" size="15">
						<input type="text" placeholder="자동적용(요일)" readonly="readonly" >
						<input type="text" placeholder="자동적용(기간)" readonly="readonly" size="40">
						<input type="datetime" name="rep_start">
						<input type="datetime" name="rep_end">
						<input type="submit" value="추가">
					</form>
				</div>
			</div>
			<div class="row">
				<div id="timetable_box">
					<div id="week_division">
						<div>구분</div>
						<div>일</div>
						<div>월</div>
						<div>화</div>
						<div>수</div>
						<div>목</div>
						<div>금</div>
						<div>토</div>
					</div>
					<div id="week_time">
						<div class="time">00:00</div>
						<div class="field">
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
						</div>
						<div class="time">00:30</div>
						<div class="field">
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
						</div>
						<div class="time">01:00</div>
						<div class="field">
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
						</div>
						<div class="time">01:30</div>
						<div class="field">
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
						</div>
						<div class="time">02:00</div>
						<div class="field">
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
							<div>Select Field</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>