// 년,월을 기준으로 마지막날짜 검색
function find_Lastday(year, month){
	// 1~12월까지의 마지막날짜 배열
	var lastDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	// 윤년,평년 예외처리[윤년은 4년주기, 단 매 100년은 윤년제외, 단 매 400년은 윤년포함]
	var finderYear = year;
	if((finderYear%4 == 0 && finderYear%100 != 0) || finderYear%400 == 0)
		lastDay[1] = 29;
	
	return lastDay[month-1];
}

// 년,월을 기준으로 달력 태그생성
function make_TagString(year, month){
	// 문자열 변수 생성
	var dataStr = "";
	// 주차 계산용 지역변수
	var monthWeek = 1;
	// 임시날짜 세팅
	var tempDate = setTempDate(year, month, 1);
	// 빈 공간 개수파악
	var theDay = tempDate.getDay();
	// DISPLAY용 날짜
	var dNum = 1;
	// 마지막 날짜 파악
	var lastDay = find_Lastday(year, month);
	
	// 문자열 생성[위치]
	dataStr+="<li>";
	// 문자열 생성[테이블]
	dataStr+="<table class='calendar_table'>";
	// 문자열 생성[년]
	dataStr+="<tr><th colspan='7'>" + year + "</th></tr>";
	// 문자열 생성[월]
	dataStr+="<tr><th colspan='7'>" + month + "</th></tr>";
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
	
	console.log("make_TagString() Success");
}

// 임시날짜 세팅
function setTempDate(year, month, day){
	var tempDate = new Date();
	
	tempDate.setFullYear(year);
	tempDate.setMonth(month-1);
	tempDate.setDate(day);
	
	return tempDate;
}