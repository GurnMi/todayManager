// TIMEPLAN 전역변수 관리
var startpos = 0;
var endpos = 0;

function draw_time(){
	var tag = "";
	var time = new Date();
	
	time.setHours(0, 0, 0, 0);
	
	for(var i=0 ; i<49 ; i++){
		tag += "<div><p>";
		if(time.getHours()< 10)
			tag += "0" + time.getHours();
		else
			tag += "" + time.getHours();
		tag += ":";
		if(time.getMinutes()< 10)
			tag += "0" + time.getMinutes();
		else
			tag += "" + time.getMinutes();
		tag += "</p><hr></div>";
		time.setMinutes(time.getMinutes()+30);
	}
	
	$("#today_time").append(tag);
}

// 계획 시작위치 저장
function insert_start(target){
	if(startpos == 0){
		startpos = $(target).position().top;
		
		$(target).parent().find("div").find("hr").removeClass("hr_select");
		$(target).find("hr").addClass("hr_select");
	}
}

// 계획 종료위치 저장 및 태그추가
function insert_end(target){
	var tag = "<div class='ing_plan'></div>";
	
	if(endpos == 0){
		endpos = $(target).position().top;
		$(target).parent().append(tag);
		$(".ing_plan").css("top",startpos+20);
		$(".ing_plan").css("left","100px");
		$(".ing_plan").css("width","75%");
		var height = (endpos - startpos) + "px";
		$(".ing_plan").css("height",height);
		
		$(target).parent().find("div").find("hr").removeClass("hr_select");
	}
}