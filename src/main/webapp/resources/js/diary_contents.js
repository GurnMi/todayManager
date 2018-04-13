function mark_apply(target){
	var value = $(target).attr("data-value");
	var marks = $("#mark").find("img");
	
	$("input[name='mark']").val(value);
	for(var i=0 ; i<marks.length ; i++){
		var temp = $(marks[i]).attr("data-value");
		if(value >= temp)
			$(marks[i]).attr("src","/todayManager/resources/images/diary_star_select.png");
	}
}

function mark_init(){
	var marks = $("#mark").find("img");
	for(var i=0 ; i<marks.length ; i++){
		$(marks[i]).attr("src","/todayManager/resources/images/diary_star.png");
	}
}
