// today_calendar 사용 전역변수
var cal_save_today = new Date();
var cal_save_select = new Date();

// 달력정보 저장
function cal_save_date(year, month, day){
	cal_save_today.setFullYear(year, month-1, day);
	cal_save_select.setFullYear(year, month-1, day);
}

// 달력정보 불러오기
function cal_load_date(){
	var tables = $(".calendar_table");
	for(var i=0 ; i<tables.length ; i++){
		// 오늘날짜 설정
		if(Number($(tables[i]).find(".cal_year").html()) == cal_save_today.getFullYear()
			&& Number($(tables[i]).find(".cal_month").html()) == (cal_save_today.getMonth()+1)){
			var td = $(tables[i]).find("td");
			for(var j=0 ; j<td.length ; j++){
				if(Number($(td[j]).html()) == cal_save_today.getDate()){
					$(td[j]).attr("id","cal_today");
				}
			}
		}
		// 선택날짜 설정
		if(Number($(tables[i]).find(".cal_year").html()) == cal_save_select.getFullYear()
			&& Number($(tables[i]).find(".cal_month").html()) == (cal_save_select.getMonth()+1)){
			var td = $(tables[i]).find("td");
			for(var j=0 ; j<td.length ; j++){
				if(Number($(td[j]).html()) == cal_save_select.getDate()){
					$(td[j]).addClass("cal_select");
				}
			}
		}
	}
}

// SLCIK 초기화
function cal_slick_init(){
	$("#day_slick").find(".date_slick").eq(0).slick("unslick");	
	$("#day_slick").find(".date_slick").empty();
}

// SLICK 적용
function cal_slick_apply(){
	$("#day_slick").find(".date_slick").slick({
		  infinite:false,
		  initialSlide:1,
		  arrows:true,
		  prevArrow:'.arrow_left',
		  nextArrow:'.arrow_right'
	});
}

// 달력 생성
function cal_create(year, month, day, pageLoadControl){
	if(pageLoadControl != 0)
		cal_slick_init();
	else
		cal_save_date(year, month, day);
	
	make_tagString(year, month-1);
	if(pageLoadControl == 0)
		make_tagString(year, month, day);
	else
		make_tagString(year, month, 0);
	make_tagString(year, month+1);
	
	cal_slick_apply();
	cal_load_date();
}

// 년,월을 기준으로 달력 태그추가
function make_tagString(year, month, day){
	if(month == 0){
		year--;
		month = 12;
	}
	if(month == 13){
		year++;
		month = 1;
	}
	
	// 문자열 변수 생성
	var dataStr = "";
	// 주차 계산용 지역변수
	var monthWeek = 1;
	// 임시날짜 세팅
	var tempDate = set_tempDate(year, month, 1);
	// 빈 공간 개수파악
	var theDay = tempDate.getDay();
	// DISPLAY용 날짜
	var dNum = 1;
	// 마지막 날짜 파악
	var lastDay = search_lastday(year, month);
	
	// 문자열 생성[위치]
	dataStr+="<li>";
	// 문자열 생성[테이블]
	dataStr+="<table class='calendar_table'>";
	// 문자열 생성[년]
	dataStr+="<tr><th colspan='7' class='cal_year'>" + year + "</th></tr>";
	// 문자열 생성[월]
	dataStr+="<tr><th colspan='7' class='cal_month'>" + month + "</th></tr>";
	// 문자열 생성[요일]
	dataStr+="<tr>";
	dataStr+="<th>SUN</th>";
	dataStr+="<th>MON</th>";
	dataStr+="<th>TUE</th>";
	dataStr+="<th>WEN</th>";
	dataStr+="<th>THU</th>";
	dataStr+="<th>FRI</th>";
	dataStr+="<th>SAT</th>";		
	dataStr+="</tr>";
	for(var i=0; i<monthWeek; i++){
		dataStr += "<tr>";
		for(var k=0; k<7; k++){
			if((i==0 && k<=theDay-1) || dNum > lastDay){
				dataStr += "<td>&nbsp;</td>";
			}else{
				if(day != 0 && dNum == day)
					dataStr += "<td id='cal_today' class='cal_select'>"+dNum+"</td>";
				else
					dataStr += "<td>"+dNum+"</td>";
				dNum++;
			}
		}
		if(dNum <= lastDay)
			monthWeek++;
		dataStr += "</tr>";	
	}
	dataStr+="</table>";
	dataStr+="</li>";
	
	//달력 적용
	$(".date_slick").append(dataStr);
}

// 년,월,일 임시 날짜 세팅
function set_tempDate(year, month, day){
	var tempDate = new Date();
	
	tempDate.setFullYear(year);
	tempDate.setMonth(month-1);
	tempDate.setDate(day);
	
	return tempDate;
}

// 년,월을 기준으로 마지막날짜 검색
function search_lastday(year, month){
	// 1~12월까지의 마지막날짜 배열
	var lastDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	// 윤년,평년 예외처리[윤년은 4년주기, 단 매 100년은 윤년제외, 단 매 400년은 윤년포함]
	var finderYear = year;
	if((finderYear%4 == 0 && finderYear%100 != 0) || finderYear%400 == 0)
		lastDay[1] = 29;
	
	return lastDay[month-1];
}
