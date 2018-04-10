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

function insert_start(target){
	var tag = "<div class='ing_plan'></div>";
	console.log($(target).html());
	console.log($(target).position());
}