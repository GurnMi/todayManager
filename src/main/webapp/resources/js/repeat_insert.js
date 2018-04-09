function time_compare_string(time1, time2){
	var arr1 = time1.split(":");
	var arr2 = time2.split(":");
		
	if(Number((arr1[0]+arr1[1]+"")) > Number((arr2[0]+arr2[1]+"")))
		return false;
	else
		return true;
}

$(function(){
	// 마우스가 올라갈 시 시각효과를 위해 CSS 재 적용(선택)
	$("#week_time").on("mouseover","div",function(){
		$(this).find("hr").css("border-color","red");
	});
	// 마우스가 벗어날 시 시각효과를 위해 CSS 재 적용(선택해제)
	$("#week_time").on("mouseout","div",function(){
		$(this).find("hr").css("border-color","gray");
	});
	// 선택한 시간을 컨트롤창의 입력창에 적용
	$("#week_time").on("click","div",function(){
		var checker = $("#week_time").find(".sel_start");
		// 시작시간이 존재할 경우 TRUE
		if(checker.size()>0){
			var end = $(this).find("p").text();
			var start = $("#time_start").val();
			
			// 시작시간보다 더 이른경우일 때 예외처리 필요
			if(time_compare_string(start, end))
				//정상
			else
				//비정상
				
			$(this).addClass("sel_end");
			$("#time_end").val(end);
		}
		// 시작시간이 존재하지않을 경우 FALSE
		else{
			var start = $(this).find("p").text();
			$(this).addClass("sel_start");
			$("#time_start").val(start);
		}
	});
});