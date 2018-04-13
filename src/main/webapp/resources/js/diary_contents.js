function mark_apply(target){
	var value = $(target).attr("data-value");
	var marks = $("#mark").find("img");
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

function modify_content(){
	var temp = $("#content").text();
	$("#content").empty();
	$("#content").append("<textarea id='modify_content'></textarea>");
	$("#content").find("#modify_content").val(temp);
}

function add_content(){
	$("#mark").css("visibility","hidden");
	$("#add_title").css("display","block");
	$("#title p").css("display","none");
	$("#content").empty();
	$("#content").append("<textarea id='modify_content' name='diary_content'></textarea>");
}