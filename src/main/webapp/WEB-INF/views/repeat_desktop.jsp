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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=2">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/repeat_insert.js?var=3"></script>
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
						<label class="guide">제목</label>
						<input type="text" class="title" placeholder="화면에 표시될 제목을 입력해주세요.">
						<br>
						<label class="guide">카테고리</label>
						<select name="rep_type">
							<option value="휴식">휴식</option>
							<option value="공부">공부</option>							
							<option value="운동">운동</option>
							<option value="기타">기타</option>
						</select>
						<br>
						<!-- <label>반복타입을 설정하세요</label>
						<input type="text" placeholder="1~99"> -->
						<label>제목</label>
						<input type="text" placeholder="제목" name="rep_title">
						
						<br>
						<!-- <input type="radio" name="repeat" value="매일">매일
						<input type="radio" name="repeat" value="매주">매주
						<input type="radio" name="repeat" value="매월">매월
						<input type="radio" name="repeat" value="매년">매년
						<input type="radio" name="repeat" value="개인">사용자설정 -->
						<div>
							<input type="radio" value="일" name="rep_day">일
							<input type="radio" value="월" name="rep_day">월
							<input type="radio" value="화" name="rep_day">화
							<input type="radio" value="수" name="rep_day">수
							<input type="radio" value="목" name="rep_day">목
							<input type="radio" value="금" name="rep_day">금
							<input type="radio" value="토" name="rep_day">토
						</div>
						<br>
						<label class="guide">시작(기간)</label>
						<input type="text" placeholder="달력에서 선택해주세요." readonly="readonly" name="rep_start_day">
						<br>
						<label class="guide">종료(기간)</label>
						<input type="text" placeholder="달력에서 선택해주세요." readonly="readonly" name="rep_end_day">
						<br>
						<label class="guide">시작(시간)</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_start" name="rep_start_time">
						<br>
						<label class="guide">종료(시간)</label>
						<input type="text" placeholder="시간표에서 선택해주세요." readonly="readonly" id="time_end" name="rep_end_time">
						<br>
						<input type="datetime" name="rep_start">
						<input type="datetime" name="rep_end">
						
						<input type="submit" value="추가">
					</form>
				</div>
				<div id="timetable_box">
					<div id="week_time">
						<div><p>00:00</p><hr></div>
						<div><p>00:30</p><hr></div>
						<div><p>01:00</p><hr></div>
						<div><p>01:30</p><hr></div>
						<div><p>02:00</p><hr></div>
						<div><p>02:30</p><hr></div>
						<div><p>03:00</p><hr></div>
						<div><p>03:30</p><hr></div>
						<div><p>04:00</p><hr></div>
						<div><p>04:30</p><hr></div>
						<div><p>05:00</p><hr></div>
						<div><p>05:30</p><hr></div>
						<div><p>06:00</p><hr></div>
						<div><p>06:30</p><hr></div>
						<div><p>07:00</p><hr></div>
						<div><p>07:30</p><hr></div>
						<div><p>08:00</p><hr></div>
						<div><p>08:30</p><hr></div>
						<div><p>09:00</p><hr></div>
						<div><p>09:30</p><hr></div>
						<div><p>10:00</p><hr></div>
						<div><p>10:30</p><hr></div>
						<div><p>11:00</p><hr></div>
						<div><p>11:30</p><hr></div>
						<div><p>12:00</p><hr></div>
						<div><p>12:30</p><hr></div>
						<div><p>13:00</p><hr></div>
						<div><p>13:30</p><hr></div>
						<div><p>14:00</p><hr></div>
						<div><p>14:30</p><hr></div>
						<div><p>15:00</p><hr></div>
						<div><p>15:30</p><hr></div>
						<div><p>16:00</p><hr></div>
						<div><p>16:30</p><hr></div>
						<div><p>17:00</p><hr></div>
						<div><p>17:30</p><hr></div>
						<div><p>18:00</p><hr></div>
						<div><p>18:30</p><hr></div>
						<div><p>19:00</p><hr></div>
						<div><p>19:30</p><hr></div>
						<div><p>20:00</p><hr></div>
						<div><p>20:30</p><hr></div>
						<div><p>21:00</p><hr></div>
						<div><p>21:30</p><hr></div>
						<div><p>22:00</p><hr></div>
						<div><p>22:30</p><hr></div>
						<div><p>23:00</p><hr></div>
						<div><p>23:30</p><hr></div>
						<div><p>24:00</p><hr></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>