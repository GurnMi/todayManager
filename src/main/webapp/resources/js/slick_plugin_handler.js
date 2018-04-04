//SLCIK 초기화
function initSlick(divName){
	$(divName).find(".date_slick").eq(0).slick("unslick");	
	$(divName).find(".date_slick").empty();
}

//SLCIK PLUGIN 생성
function createSlick(divName){
	$(divName).find(".date_slick").slick({
		  infinite:false,
		  initialSlide:1,
		  arrows:true,
		  prevArrow:'.arrow_left',
		  nextArrow:'.arrow_right'
	});
}

//SLICK 적용할 LIST 생성
function applyBySlick(divName){
	setDateBySlick(divName, "STANDARD");
	setDateBySlick(divName, "PREV");
	setDateBySlick(divName, "NEXT");
}

//SLICK LIST 생성 구분
function setDateBySlick(divName, position){
	switch (position) {
		case "STANDARD":
			//STANDARD DATE	
			makeByMidSlick(tempDate.getFullYear(), tempDate.getMonth()+1, tempDate.getDate(), "append", divName);
			break;
		case "PREV":
			//PREV DATE
			if(tempDate.getDate() == 1){
				if((tempDate.getMonth()+1) == 1){
					makeByMidSlick(tempDate.getFullYear()-1, 12, 31, "prepend", divName);
					return;
				}
				makeByMidSlick(tempDate.getFullYear(), tempDate.getMonth(), findByLastday(tempDate.getFullYear(), tempDate.getMonth()), "prepend", divName);
				return;
			}else{
				makeByMidSlick(tempDate.getFullYear(), tempDate.getMonth()+1, tempDate.getDate()-1, "prepend", divName);
				return;
			}
			break;
		case "NEXT":
			//NEXT DATE
			if(tempDate.getDate() == findByLastday(tempDate.getFullYear(), tempDate.getMonth()+1)){
				if((tempDate.getMonth()+1) == 12){
					makeByMidSlick(tempDate.getFullYear()+1, 1, 1, "append", divName);
					return;
				}
				makeByMidSlick(tempDate.getFullYear(), tempDate.getMonth()+2, 1, "append", divName);
				return;
			}else{
				makeByMidSlick(tempDate.getFullYear(), tempDate.getMonth()+1, tempDate.getDate()+1, "append", divName);
				return;
			}
			break;
		default:
			console.err("ERROR");
			break;
	}	
}

//SLICK LIST 생성
function makeByMidSlick(year, month, day, command, divName){
	//변수 사용전 초기화
	dataStr = "";
	//날짜관련 임시 지역변수
	var temp = new Date(year, month-1, day);
	// 문자열 생성 및 조합
	dataStr += "<li><p>";
	dataStr += "<span id='text_year'>"+year+"</span><br>";
	if(month<10)
		dataStr += "0";
	dataStr += "<span id='text_month'>"+month+"</span>/";
	dataStr += "<span id='text_day'>";
	if(day<10)
		dataStr += "0";
	dataStr += day+"</span><br>";
	dataStr += "<span class='text_weekday'>"+arrDayAbb[temp.getDay()]+"</span>";
	dataStr += "</p><span>" + day + "</span>";
	dataStr += "</li>";
	
	switch(command){
		case "prepend":
			$(divName).find(".date_slick").prepend(dataStr);
			return;
		case "append":
			$(divName).find(".date_slick").append(dataStr);
			return;
	}
}

//SLICK 조작 시 LIST CHANGE
function targetBySlick(obj, parent){
	//해당 OBJECT DATE LOAD
	var tempStr = workByObjText($(obj));
	//포맷변경 후 분리
	var arrTemp = tempStr.split("/");
	//임시날짜 지정
	set_tempDate(arrTemp[0], arrTemp[1], arrTemp[2]);
	//SLICK 초기화
	initSlick(parent);
	//SLICK 생성
	applyBySlick(parent);
	//SLICK PLUGIN 적용
	createSlick(parent);
}