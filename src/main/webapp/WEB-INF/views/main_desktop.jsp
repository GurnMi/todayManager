<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>TODAY MANAGER MAIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- PLUGIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CUSTOM CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css?var=7">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_320.css?var=10">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_512.css?var=10">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_768.css?var=10">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_960.css?var=10">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/min_width_1200.css?var=16">
<!-- PLUGIN JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.xdomainajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.xdomainajax.js"></script>
<script type="text/javascript">
	function loginSuccess(id){
		$("#id").val(id);
		$("#form").submit();
	}
	function weather_load(zone){
		$.ajax({
			url:"http://www.weather.go.kr/wid/queryDFSRSS.jsp?zone="+zone,
			type:"get",
			dataType:"xml",
			success:function(result){
				var now = $(result.responseText).find("data[seq='0']").find("wfkor").html();
				weather_background(now);
				weather_icon(now);
			}
		});
	}
	function weather_background(str){
		if(str == "맑음"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_day.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "구름 조금"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_day.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "구름 많음"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_day.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "흐림"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_day.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "비"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_rain.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "눈/비"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_lightning.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
		if(str == "눈"){
			$("body").css("background", "url('${pageContext.request.contextPath}/resources/images/back_snow.jpg') no-repeat center center fixed");
			$("body").css("background-size","cover");
		}
	}
	function weather_icon(str){
		if(str == "맑음"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_sun.png");
		}
		if(str == "구름 조금"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_sun.png");
		}
		if(str == "구름 많음"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_sun.png");
		}
		if(str == "흐림"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_sun.png");
		}
		if(str == "비"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_rain.png");
		}
		if(str == "눈/비"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_lightning.png");
		}
		if(str == "눈"){
			$("#icon").attr("src", "${pageContext.request.contextPath}/resources/images/weather_snow.png");
		}
	}
	function webnote_load(){
		var user = "${sessionScope.user.user_id}";
		if(user != ""){
			$.ajax({
				url:"${pageContext.request.contextPath}/webnote/load?id="+user,
				type:"get",
				dataType:"json",
				success:function(result){
					var str = "";
					var tempDate = new Date();
					
					for(var i=0 ; i<result.length ; i++){
						tempDate.setTime(result[i].note_date);
						
						str += "<li>";
						str += "<span class='note_content'>";
						str += result[i].note_content;
						str += "</span>";
						str += "<span class='note_date'>";
						str += tempDate.getFullYear() + "-";
						if((tempDate.getMonth()+1)<10)
							str += "0"+(tempDate.getMonth()+1);
						else
							str += (tempDate.getMonth()+1);
						str += "-";
						if(tempDate.getDate()<10)
							str += "0"+tempDate.getDate();
						else
							str += tempDate.getDate();
						str += "</span>";
						str += "<img src='${pageContext.request.contextPath}/resources/images/check_icon.png' class='mod_ok' data-no='"+result[i].note_no+"'>";
						str += "<img src='${pageContext.request.contextPath}/resources/images/cancle_icon.png' class='mod_cancle' data-no='"+result[i].note_no+"'>";
						str += "<img src='${pageContext.request.contextPath}/resources/images/edit_icon.png' class='note_mod'>";
						str += "<img src='${pageContext.request.contextPath}/resources/images/del_icon.png' class='note_del' data-no='"+result[i].note_no+"'>";
						str += "</li>";
					}
					$("#webnote_content").append(str);
				}
			});
		}
	}
	
	$(function(){
		// 기본지역 : 대구광역시 남구 대명2동
		weather_load("2720057100");
		// 카카오 초기화
		Kakao.init('073bab6d5ebe961bfb1e314c96760511');
		// 카카오 로그인 버튼을 생성합니다.
		if("${user.user_id}" == ""){
			Kakao.Auth.createLoginButton({
				container: '#kakao-login-btn',
				success: function(authObj){
					Kakao.API.request({
						url: '/v1/user/me',
						success: function(res) {
							console.log(res.kaccount_email);
			         		loginSuccess(res.kaccount_email);
			         	}
		    		})
		    	},
			    fail: function(err) {
			    	alert(JSON.stringify(err));
				}
			});
		}
		
		// 오늘날짜 적용
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var dayName = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
		var monthName = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
		$("#day_info").html(dayName[date.getDay()]+", "+date.getDate()+" "+monthName[date.getMonth()]);
		
		// 날씨정보 위치
		$("#town_sido").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("시/도 불러오기 시작");
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/sido",
				type:"get",
				dataType:"text",
				success:function(result){
					$("#search_area1").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#select_sido").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("구/군 불러오기 시작");
			var sido = $("#search_area1").val();
			$("#search_area1").find("option[selected]").removeAttr("selected");
			$("#search_area1").find("option").each(function(index, obj){
				if($(obj).val() == sido){
					$(obj).attr("selected", "selected");
				}
			});
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/gungu?sido="+sido,
				type:"get",
				dataType:"text",
				success:function(result){
					console.log(result);
					$("#search_area2").empty();
					$("#search_area2").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#select_gugun").on("click",function(){
			$("#loadingbar").css("display","block");
			console.log("동 불러오기 시작");
			var sido = $("#search_area1").val();
			var gugun = $("#search_area2").val();
			$("#search_area2").find("option[selected]").removeAttr("selected");
			$("#search_area2").find("option").each(function(index, obj){
				if($(obj).val() == gugun){
					$(obj).attr("selected", "selected");
				}
			});
			$.ajax({
				url:"${pageContext.request.contextPath}/parser/dong?sido="+sido+"&gugun="+gugun,
				type:"get",
				dataType:"text",
				success:function(result){
					console.log(result);
					$("#search_area3").empty();
					$("#search_area3").append(result);
					$("#loadingbar").css("display","none");
				}
			});
		});
		$("#area_save").on("click",function(){
			var dong = $("#search_area3").val();
			$("#search_area3").find("option[selected]").removeAttr("selected");
			$("#search_area3").find("option").each(function(index, obj){
				if($(obj).val() == dong){
					$(obj).attr("selected", "selected");
				}
			});
			$("#town_sido").html($("#search_area1").find("option[selected]").text());
			$("#town_gungu").html($("#search_area2").find("option[selected]").text()+" "+$("#search_area3").find("option[selected]").text());
			
			console.log("XML 불러오기 시작");
			weather_load(dong);
		});
		
		$("#move_home").on("click",function(){
			location.href = "${pageContext.request.contextPath}/";
		});
		$("#move_home").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_home_over.png");
		});
		$("#move_home").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_home.png");
		});
		$("#move_today").on("click",function(){
			location.href = "${pageContext.request.contextPath}/today/";
		});
		$("#move_today").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_today_over.png");
		});
		$("#move_today").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_today.png");
		});
		$("#move_diary").on("click",function(){
			location.href = "${pageContext.request.contextPath}/diary/";
		});
		$("#move_diary").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_diary_over.png");
		});
		$("#move_diary").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_diary.png");
		});
		$("#move_repeat").on("click",function(){
			location.href = "${pageContext.request.contextPath}/repeat/list";
		});
		$("#move_repeat").on("mouseover",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_repeat_over.png");
		});
		$("#move_repeat").on("mouseout",function(){
			$(this).attr("src", "${pageContext.request.contextPath}/resources/images/menu_repeat.png");
		});
		
		$("#add_memo").on("mouseover",function(){$(this).css("opacity","0.7");});
		$("#add_memo").on("mouseout",function(){$(this).css("opacity","0.5");});
		$("#add_memo").on("click",function(){
			$(this).css("opacity","0.7");
			$("#input_box").css("width","0px");
			$("#input_box").css("display","block");
			$("#input_box").animate({width:"750px"}, 500);
		});
		
		$(document).on("mouseover",".note_del",function(){$(this).css("opacity","0.7");});
		$(document).on("mouseout",".note_del",function(){$(this).css("opacity","0.3");});
		$(document).on("mouseover",".note_mod",function(){$(this).css("opacity","0.7");});
		$(document).on("mouseout",".note_mod",function(){$(this).css("opacity","0.3");});
		
		$(document).on("mouseover",".mod_ok",function(){$(this).css("opacity","0.7");});
		$(document).on("mouseout",".mod_ok",function(){$(this).css("opacity","0.3");});
		$(document).on("mouseover",".mod_cancle",function(){$(this).css("opacity","0.7");});
		$(document).on("mouseout",".mod_cancle",function(){$(this).css("opacity","0.3");});
		
		$("#webnote_content").on("mouseover","li",function(){$(this).css("background","rgba(0,0,0,0.1)");});
		$("#webnote_content").on("mouseout","li",function(){$(this).css("background","white");});
		
		$("#add_ok").on("mouseover",function(){
			$(this).css("opacity","0.7");
		});
		$("#add_ok").on("mouseout",function(){
			$(this).css("opacity","0.3");
		});
		$("#add_cancle").on("mouseover",function(){
			$(this).css("opacity","0.7");
		});
		$("#add_cancle").on("mouseout",function(){
			$(this).css("opacity","0.3");
		});
		$("#add_cancle").on("click",function(){
			$(this).css("opacity","0.3");
			$("#input_box").animate({width:"0px"}, 500, function(){
				$("#input_box").css("display","none");
			});
		});
		
		$("#webnote_content").on("click",".note_mod",function(){
			var content = $(this).parent().find(".note_content").html();
			$(this).parent().find(".note_content").remove();
			var tag = "<input type='text' value='"+content+"' id='mod_input'>";
			tag += "<input type='hidden' value='"+content+"' id='mod_restore'>";
			$(this).parent().prepend(tag);
			$(this).css("display","none");
			$(this).parent().find(".note_del").css("display","none");
			$(this).parent().find(".mod_ok").css("display","inline");
			$(this).parent().find(".mod_cancle").css("display","inline");
		});
		$("#webnote_content").on("click",".mod_ok",function(){
			var temp1 = $(this).parent().find("#mod_input").val();
			var temp2 = $(this).parent().find("#mod_restore").val();
			var note_no = $(this).attr("data-no");
			var note_content = $(this).parent().find("#mod_input").val();
			if(temp1 == temp2){
				console.log("호출 중지");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/webnote/modify?no="+note_no+"&content="+note_content,
					type:"get",
					dataType:"text",
					success:function(result){
						console.log(result);
					}
				});
			}
			$(this).parent().find("#mod_input").remove();
			var tag = "<span class='note_content'>"+note_content+"</span>";
			$(this).parent().prepend(tag);
			$(this).css("display","none");
			$(this).parent().find(".mod_cancle").css("display","none");
			$(this).parent().find(".note_del").css("display","inline");
			$(this).parent().find(".note_mod").css("display","inline");
		});
		$("#webnote_content").on("click",".mod_cancle",function(){
			var content = $(this).parent().find("#mod_restore").val();
			$(this).parent().find("#mod_input").remove();
			var tag = "<span class='note_content'>"+content+"</span>";
			$(this).parent().prepend(tag);
			$(this).css("display","none");
			$(this).parent().find(".mod_ok").css("display","none");
			$(this).parent().find(".note_del").css("display","inline");
			$(this).parent().find(".note_mod").css("display","inline");
		});
		$("#webnote_content").on("click",".note_del",function(){
			var str = "해당 기록을 정말로 삭제하시겠습니까?";
			if(confirm(str)){
				var note_no = $(this).attr("data-no");
				var target = $(this);
				$.ajax({
					url:"${pageContext.request.contextPath}/webnote/delete?no="+note_no,
					type:"get",
					dataType:"text",
					success:function(result){
						console.log(result);
						$(target).parent().remove();
					}
				});	
			}
		});
		$("#add_ok").on("click",function(){
			var content = $("#input_box input").val();
			if(content == ""){
				alert("추가할 내용이 존재하지 않습니다.\n내용을 작성해주세요.");
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/webnote/insert?content="+content,
					type:"get",
					dataType:"text",
					success:function(result){
						console.log(result);
						$("#webnote_content").empty();
						$("#input_box input").val("");
						webnote_load();
					}
				});
			}
		});
		
		webnote_load();
	});
</script>
</head>
<body>
	<div id="set_area" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지역을 선택해주세요</h4>
				</div>
				<div class="modal-body" id="modal_body">
					<div id="loadingbar" class="container">
						<div>
							<div class="progress">
								<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
									LOADING...
								</div>
							</div>
						</div>
					</div>
					<select id="search_area1"></select>
					<button type="button" id="select_sido">검색</button>
					<br>
					<select id="search_area2">
						<option>---</option>
					</select>
					<button type="button" id="select_gugun">검색</button>
					<br>
					<select id="search_area3">
						<option>---</option>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="area_save">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="menu_container">
			<div>
				<c:if test="${sessionScope.user.user_id!=null}">
					<img src="${pageContext.request.contextPath}/resources/images/menu_repeat.png" id="move_repeat">
					<img src="${pageContext.request.contextPath}/resources/images/menu_diary.png" id="move_diary">
					<img src="${pageContext.request.contextPath}/resources/images/menu_today.png" id="move_today">
				</c:if>
				<img src="${pageContext.request.contextPath}/resources/images/menu_home.png" id="move_home">
			</div>
		</div>
		<div id="main_container">
			<div class="row">
				<div id="weather">
					<p id="day_info">
						Tuesday, 15 November
						<img src="${pageContext.request.contextPath}/resources/images/map_icon.png">
					</p>
					<img id="icon" src="${pageContext.request.contextPath}/resources/images/weather_sun.png">
					<p id="town_sido" data-toggle="modal" data-target="#set_area">대구광역시</p>
					<p id="town_gungu" data-toggle="modal" data-target="#set_area">남구 대명2동</p>
				</div>
			</div>
			<div class="row">
				<div id="login">
					<c:if test="${sessionScope.user.user_id==null}">
						<p>로그인 후 사용하실 수 있습니다.</p>
						<br>
						<a id="kakao-login-btn"></a>
					    <a href="http://developers.kakao.com/logout"></a>
					    <form action="${pageContext.request.contextPath}/login/" method="post" id="form">
					    	<input type="text" name="id" id="id" hidden="hidden">
					    </form>
					</c:if>
					<c:if test="${sessionScope.user.user_id!=null }">
						아이디 : ${sessionScope.user.user_id }<br>
						닉네임 : ${sessionScope.user.user_nick }님 로그인 되었습니다.
						<br>
						<a href="${pageContext.request.contextPath}/login/update">닉네임 변경</a>
						<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
						<a href="${pageContext.request.contextPath}/login/leave">회원 탈퇴</a>
					</c:if>
				</div>
			</div>
			<div class="row">
				<c:if test="${sessionScope.user.user_id!=null}">
					<div id="webnote">
						<p>
							<img src="${pageContext.request.contextPath}/resources/images/webpick_icon.png">
							Web Note
						</p>
						<img src="${pageContext.request.contextPath}/resources/images/add_icon.png" id="add_memo">
						<div id="input_box">
							<input type="text" placeholder=" 추가할 내용을 입력해주세요.">
							<img src="${pageContext.request.contextPath}/resources/images/check_icon.png" id="add_ok">
							<img src="${pageContext.request.contextPath}/resources/images/cancle_icon.png" id="add_cancle">
						</div>
						<ul id="webnote_content">
							
						</ul>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.user_id==null}">
					<div id="webnote_nouser">
						<img src="${pageContext.request.contextPath}/resources/images/webpick_icon.png">
						<p>웹픽 기능을 사용하시려면 로그인이 필요합니다.</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>