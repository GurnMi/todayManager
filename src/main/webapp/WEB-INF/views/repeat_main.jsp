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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/repeat_insert.js?var=3"></script> --%>
<style type="text/css">

	#weektable,#test{
		background: white;
	}
	table{
		max-width: 1024px;
	}
	td{
		border: 1px solid black;
		margin: 10px;
		padding:10px;
		border-collapse: collapse;
	}
	.dt{
		width: 150px;
	}
	.sel{
		background: red;
	}
	
	#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
	}
	#my-dialog {
	    display: none;
	    position: fixed;
	    left: calc( 50% - 160px ); top: calc( 50% - 70px );
	    width: 320px; 
	    height: 400px; 
	    background: #fff;
	    z-index: 11;
	    padding: 10px;
	}
	.repdate{
		display: none;
	}
	.timeSpan{
		position: relative;
		top:-23px;
	}
	.borderNone{
		border-left: 1px solid white;
		border-top: 1px solid white;
		border-bottom: 1px solid white;
	}
	.getDate{
		font-weight: bold;
		text-align: center;
	}
	.getDate0 {
		color: red;
	}
	.getDate6 {
		color: blue;
	}
	#right, #left{
		width: 30px;
		position: relative;
		top:35px;
	}
	#right{
		position: relative;
		top:38px;
		right:-950px;
	}
	#left{
		position: relative;
		top:38px;
		left:60px;
	}
	.test{
 		background: blue;
	}
	.type1{
		background: rgba(255,0,0,0.5);
	}
	.type2{
		background: rgba(255,94,0,0.5);
	}
	.type3{
		background: rgba(255,228,0,0.5);
	}
	.type4{
		background: rgba(29,219,22,0.5);
	}
	.type5{
		background: rgba(0,84,255,0.5);
	}
	.type6{
		background: rgba(1,0,255,0.5);
	}
	.type7{
		background: rgba(95,0,255,0.5);
	}
	
	
</style>
<script type="text/javascript">
	$(function(){
		var date = new Date();
		
		makeWeekTable(date);
		
		//이전주
		$("#left").click(function(){
			date.setDate(date.getDate()-7);
			//console.log(date);
			makeWeekTable(date);
		})
		//다음주
		$("#right").click(function(){
			date.setDate(date.getDate()+7);
			//console.log(date);
			makeWeekTable(date);
		})
		
		
		
		var index=0;
		var startdate ="";
		var starttime="";
		var enddate = "";
		var endtime = "";
		var endsel="";
		var startsel ="";
		var top,left,width,height,bottom;
		
		//삽입 클릭
		$(document).on("click",".dt",function(){
			
			
			
			if(index==0){
				if($(this).hasClass("selected")){
					var result = confirm("삭제하시겠습니까?");
					if(result){
						var repno = $(this).attr("repno");
						$(location).attr('href', "delete?repno="+repno);
						//alert("확인" + repno);
					}else{
						//alert("취소했습니다.");
					}
					
					$(".dt").removeClass("sel");
					return;							
				}
				$(".dt").removeClass("sel");	
				startdate = $(this).attr("data-date");
				starttime = $(this).attr("data-time");
				startsel = $(this).attr("sel");
				$(this).addClass("sel");
				
				console.log("startdate" + startdate);
				console.log(starttime);
				console.log("sel"+startsel);
				index =1;
				
				
				
			}else{
				enddate = $(this).attr("data-date");
				endtime = $(this).attr("data-time");
				endsel = $(this).attr("sel");
				
				if(startdate!=enddate){
					alert("같은 날짜를 선택해 주세요");
					$(".dt").removeClass("sel");
					index=0;
					return;
				}
				
				var className = "t"+endsel;
				
				sn = Number(startsel);
				en = Number(endsel);
				
				console.log((en-sn)/100);
				
				
				if(en>sn){
					for(var i=1;i<=(en-sn)/100;i++){
						var num = sn + (i*100);
						var className = "t"+num;
						//alert(className);
						//console.log("className"+className);
						if($("."+className).hasClass("selected")){
							alert("겹치는 시간이 존재합니다.");
							$(".dt").removeClass("sel");
							index = 0;
							return;							
						}
						
						$("."+className).addClass("sel");
					}
				}
				
				console.log(enddate);
				console.log(endtime);
				console.log("sel"+endsel);
				
				index=0;
				
				$("#my-dialog,#dialog-background").toggle();
				
				
				
				//모달 창 값 세팅
				$("input[name='rep_start_day']").val(startdate);
				$("input[name='rep_end_day']").val(startdate);
				
				var dateDay = new Date(startdate);
				
				
				var dayArr = ["일","월","화","수","목","금","토"];
				var dayIndex = dateDay.getDay();
				
				
				console.log(dayIndex);
				$("input[name='rep_day']").val(dayArr[dayIndex]);
				
				
				
				var eTArr = endtime.split(':');
				
				if(Number(eTArr[1])==30){
					eTArr[1] = "00";
					eTArr[0] = Number(eTArr[0])+1;
				}else if(Number(eTArr[1])==0){
					eTArr[1] = "30";
				}
				if(Number(eTArr[0])<10){
					eTArr[0] = "0" + Number(eTArr[0]);
				}
				
				if(eTArr[0]==24&&eTArr[1]==0){
					endtime = "23:59";
				}else{
					endtime = eTArr[0] + ":" +eTArr[1];	
				}
				
				
				
				
				$("input[name='rep_start_time']").val(starttime);
				$("input[name='rep_end_time']").val(endtime);
			}
			
			
			//모달 닫기
			$(document).on("click","#dialog-background,#btn-close-dialog",function(){
				$("#my-dialog,#dialog-background").css("display","none");
				$(".dt").removeClass("sel");
				return false;
			})
			
			//제출
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
		//삽입 클릭 끝
		
		//입력된거 클릭
		/* $(document).on("click",".selected",function(){
			alert("삭제");
		}) */
		
		
		
	})
	
	//달력그리기
	function makeWeekTable(date){
		
		//date.setDate(date.getDate()-1);
		var day = date.getDay();
		
		var startdate = new Date(date);
		
		startdate.setDate(date.getDate()-day);	
		//startdate = date;
		
		
		var weekTb = "<table>";
		
		weekTb += "<tr>";	
		weekTb += "<td class='borderNone'></td>"; 
		
		for(var i=0;i<7;i++){	
			
			weekTb += "<td class='getDate getDate"+i+"'>"+(Number(startdate.getMonth())+1)+"/"+startdate.getDate()+"</td>"; 
			startdate.setDate(startdate.getDate()+1);
		}
		weekTb += "</tr>";
		
		var time = new Date();
		time.setHours(0,0,0,0);
		time.setMinutes(0);
		
		
		for(var i=0;i<48;i++){
			weekTb += "<tr>";
			
			var hours = time.getHours();
			var minutes = time.getMinutes();
			if(hours<10){
				hours = "0"+ hours;
			}
			if(minutes==0){
				minutes = "00";
			}
			
			var ct = hours+":"+ minutes;	
			
			weekTb += "<td class='borderNone'><span class='timeSpan'>"+ct+"</spna></td>";
			time.setMinutes(time.getMinutes()+30);
			
			startdate.setDate(startdate.getDate()-7);
			 for(var j=0;j<7;j++){	
				
				var month = startdate.getMonth()+1;
				var date1 = startdate.getDate();
				if(month<10){
					month = "0"+month;
				}
				if(date1<10){
					date1 = "0"+date1;
				}
				var c = startdate.getFullYear()+"-"+month+"-"+date1;
				weekTb += "<td sel='"+i+startdate.getDate() +"' data-time='"+ct+"'data-date='"+c+"'class='dt "+"t"+i+date1+"'"+"'>"+""+"</td>"; 
				startdate.setDate(startdate.getDate()+1);
			} 
			weekTb += "</tr>";
			
		}
		
		
		weekTb += "</table>";
		
		startdate.setDate(startdate.getDate()-7);
		$.ajax({
			url:"${pageContext.request.contextPath}/repeat/repeatlist/"+c,
			type:"get",
			headers:{"Content-Type":"application/json"},
			dataType:"json",
			success:function(result){
				console.log(result);
				draw_getTime(result, startdate);
				
			}
		})
		
		
		$("#test").html(date+"/////////"+day+"<br>"+"start : "+startdate);
		$("#weektable").html(weekTb);
	}
	
	//list 그리기
	function draw_getTime(result, startdate){
		for(var i=0;i<result.length;i++){
			
			var day = result[i].rep_day;
			var dayIndex = 0;
			
			console.log("요일 : " + day);
			var dayArr = ["일","월","화","수","목","금","토"];
			
			
			for(var k=0;k<7;k++){
				if(day==dayArr[k]){
					dayIndex = k;
				}
			}
			console.log("요일숫자 : " + dayIndex);
			
			var dateIndex = 0;
			for(var k=0;k<7;k++){
				startdate.setDate(startdate.getDate()+1);
				if(startdate.getDay() == dayIndex){
					dateIndex = startdate.getDate();
				}
			}
			startdate.setDate(startdate.getDate()-7);
			
			console.log("startDate : " + startdate);
			console.log("date : " + dateIndex);
			
			
			//시간
			var start_time = new Date(result[i].rep_start);
			var end_time = new Date(result[i].rep_end);
			
			var shours = start_time.getHours();
			var sminute = start_time.getMinutes();
			
			var start_sel = 0;
			var end_sel = 0;
			
			if(shours==23 && sminute==59){
				start_sel = 47;
			}else{
				start_sel = shours*2;
				if(sminute!=0){
					++start_sel;
				}
			}
			
			console.log("s :"+ start_sel);
			
			
			var ehours = end_time.getHours();
			var eminute = end_time.getMinutes();
			
			if(ehours==23 && eminute==59){
				end_sel = 47;
			}else{
				end_sel = ehours*2;
				if(eminute!=0){
					++end_sel;
				}
			}
			console.log("e :"+ end_sel);
			
			
			//var className = "t"+ end_sel + dateIndex;
			
			sn = Number(start_sel + "" + dateIndex) ;
			en = Number(end_sel + "" +dateIndex);
			
			
			console.log("sn:"+ sn + "/en" + en + "/");
			
			/* if(en==sn){
				var className = "t"+sn;
				$("."+className).addClass("test");
			} */
			/* 
			var jIndex =0;
			if(dateIndex<10){
				jIndex = (en-sn)/10;
			}else{
				jIndex = (en-sn)/100;
			} */
			var jIndex = Number(end_sel-start_sel);
			for(var j=0; j<= jIndex ; j++){
				console.log("클래스이름jj  : " + (en-sn));
				if(dateIndex<10){
					dateIndex = "0"+dateIndex;
				}
				if(start_sel==0&&j==0){
					var num = "0"+dateIndex;
				}else{
					var num = sn + (j*100);	
				}
				
				console.log("클래스이름  : " + num);
				var className = "t"+num;
				//alert(className);
				//console.log("className"+className);
				//$("."+className).addClass("test");
				
				if(j==0){
					var text = result[i].rep_type + "<br>" + result[i].rep_title;
					$("."+className).html(text);
				}
				$("."+className).addClass("selected");
				$("."+className).attr("repno",result[i].rep_no);
				var plan_type =  result[i].rep_type;
				if(plan_type == "공부"){
						$("."+className).addClass("type1");
				   }else if(plan_type == "일"){
					   $("."+className).addClass("type2");
				   }else if(plan_type == "운동"){
					   $("."+className).addClass("type3");
				   }else if(plan_type == "취미"){
					   $("."+className).addClass("type4");
				   }else if(plan_type == "휴식"){
					   $("."+className).addClass("type5");
				   }else if(plan_type == "수면"){
					   $("."+className).addClass("type6");
				   }else if(plan_type == "기타"){
					   $("."+className).addClass("type7");
				   }
			}
		}
	}
	
</script>
</head>


<body>

	<!-- 모달 -->
	<div id="my-dialog">
	    
	    <form method="post" action="${pageContext.request.contextPath}/repeat/insert" name="f1">
		<p>
			<label>종류</label>
			<select name="rep_type">
							<option value="수면">수면</option>
							<option value="휴식">휴식</option>
							<option value="일">일</option>
							<option value="공부">공부</option>
							<option value="운동">운동</option>
							<option value="취미">취미</option>
							<option value="기타">기타</option>							
			</select>
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
			<input type="date" name="rep_start_day" id="rep_start_day">
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
			<button id="btn-close-dialog">입력취소</button>
		
		<input type="datetime" name="rep_start" class="repdate">
		<input type="datetime" name="rep_end" class="repdate">
	</form>
	
	
	    
	</div>
	<div id="dialog-background"></div>




	<div id="test">
	
	</div>
	<div id="img">
		<img src="${pageContext.request.contextPath}/resources/left.png" id="left">
		<img src="${pageContext.request.contextPath}/resources/right.png" id="right">
	</div>
	<!-- 테이블  -->
	<div id="weektable">
		
	
	</div>
	
	
	
	
</body>
</html>