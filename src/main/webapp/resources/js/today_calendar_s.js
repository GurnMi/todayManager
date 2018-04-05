// today_calendar 사용 전역변수
var s_cal_save_today = new Date();
var s_cal_save_select = new Date();

// 달력정보 저장
function cal_s_save_date(year, month, day){
	s_cal_save_today.setFullYear(year, month-1, day);
	s_cal_save_select.setFullYear(year, month-1, day);
}

function cal_s_change_string(str1){
	var arr = str1.split("/");
	
	return arr[1];
}

function cal_s_change_format(str1, str2){
	var date = new Date();
	var arr = str1.split("/");
	date.setFullYear(arr[0], (arr[1]-1), str2);
	
	return date;
}

// 달력정보 불러오기
function cal_s_load_date(){
	var temp = null;
	var tables = $(".s_calendar_table");
	for(var i=0 ; i<tables.length ; i++){
		var arrtd = $(tables[i]).find("tr").eq(3).find("td");
		// 오늘날짜 설정
		for(var j=0 ; j<arrtd.length ; j++){
			temp = cal_s_change_format($(arrtd[j]).attr("value"), $(arrtd[j]).html());
			if(match_s_date(s_cal_save_today, temp)){
				$(arrtd[j]).attr("id","s_cal_today");
			}
		}
		// 선택날짜 설정
		for(var k=0 ; k<arrtd.length ; k++){
			temp = cal_s_change_format($(arrtd[k]).attr("value"), $(arrtd[k]).html());
			if(match_s_date(s_cal_save_select, temp)){
				$(arrtd[k]).addClass("s_cal_select");
			}
		}
	}
}

// SLCIK 초기화
function cal_s_slick_init(){
	$("#s_day_slick").find(".s_date_slick").eq(0).slick("unslick");	
	$("#s_day_slick").find(".s_date_slick").empty();
}

// SLICK 적용
function cal_s_slick_apply(){
	$("#s_day_slick").find(".s_date_slick").slick({
		  infinite:false,
		  initialSlide:1,
		  arrows:true,
		  prevArrow:'.s_arrow_left',
		  nextArrow:'.s_arrow_right'
	});
}

// 달력 생성
function cal_s_create(year, month, day, pageLoadControl){
	if(pageLoadControl != 0)
		cal_s_slick_init();
	else
		cal_s_save_date(year, month, day);
	
	// 주간 시작날짜 파악
	var startDate = search_s_weekstart(year, month, day);
	var prevDate = search_s_weekstart(startDate.getFullYear(), startDate.getMonth()+1, startDate.getDate()-1);
	var nextDate = search_s_weekstart(startDate.getFullYear(), startDate.getMonth()+1, startDate.getDate()+7);

	make_s_tagString(prevDate.getFullYear(), prevDate.getMonth()+1, prevDate.getDate());
	make_s_tagString(startDate.getFullYear(), startDate.getMonth()+1, startDate.getDate());
	make_s_tagString(nextDate.getFullYear(), nextDate.getMonth()+1, nextDate.getDate());
	
	cal_s_slick_apply();
	cal_s_load_date();
}

// 년,월을 기준으로 달력 태그추가
function make_s_tagString(year, month, day){
	// 문자열 변수 생성
	var dataStr = "";
	// 임시날짜 세팅
	var tempDate = new Date(year, month-1, day);
	var targetDate = tempDate;
	// 오늘날짜 세팅
	var todayDate = new Date();

	// 문자열 생성[위치]
	dataStr+="<li>";
	// 문자열 생성[테이블]
	dataStr+="<table class='s_calendar_table'>";
	// 문자열 생성[년]
	dataStr+="<tr><th colspan='7' class='s_cal_year'>" + tempDate.getFullYear() + "</th></tr>";
	// 문자열 생성[월]
	dataStr+="<tr><th colspan='7' class='s_cal_month'>" + (tempDate.getMonth()+1) + "</th></tr>";
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
	dataStr+="<tr>";
	for(var i=0; i<7; i++){
		if(i!=0)
			targetDate.setDate(targetDate.getDate()+1);

		if(match_s_date(todayDate, targetDate) && match_s_date(todayDate, s_cal_save_select)){
			dataStr += "<td id='s_cal_today' class='s_cal_select' value='"
						+ targetDate.getFullYear() + "/"
						+ (targetDate.getMonth()+1) + "'>"
						+ targetDate.getDate()
						+ "</td>";
		}
		else if(match_s_date(todayDate, targetDate)){
			dataStr += "<td id='s_cal_today' value='"
						+ targetDate.getFullYear() + "/"
						+ (targetDate.getMonth()+1) + "'>"
						+ targetDate.getDate()
						+ "</td>";			
		}
		else{
			dataStr += "<td value='"
						+ targetDate.getFullYear() + "/"
						+ (targetDate.getMonth()+1) + "'>"
						+ targetDate.getDate()
						+ "</td>";
		}
	}
	dataStr+="</tr>";
	dataStr+="</table>";
	dataStr+="</li>";
	
	//달력 적용
	$(".s_date_slick").append(dataStr);
}

// 년,월,일을 기준으로 주간 시간날짜 검색
function search_s_weekstart(year, month, day){
	var basic = new Date(year, month-1, day);
	var find = false;
	while(true){
		if(Number(basic.getDay())!=0)
			basic.setDate(basic.getDate()-1);
		else
			return basic;
	}
}

// 날짜 일치여부 확인
function match_s_date(base, target){
	var checker = 3;
	if(base.getFullYear() == target.getFullYear())
		checker--;
	if(base.getMonth() == target.getMonth())
		checker--;
	if(base.getDate() == target.getDate())
		checker--;
	
	if(checker != 0)
		return false;
	else
		return true;
}
