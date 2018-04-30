function time_compare_string(time1, time2){
	var arr1 = time1.split(":");
	var arr2 = time2.split(":");
		
	if(Number((arr1[0]+arr1[1]+"")) > Number((arr2[0]+arr2[1]+"")))
		return false;
	else
		return true;
}

function timeToTime_compare(time1, time2){
	var time1_start = time1[0].split(":");
	var time1_end = time1[1].split(":");
	var time2_start = time2[0].split(":");
	var time2_end = time2[1].split(":");
	var checker = 0;
	
	if(Number((time1_start[0]+time1_start[1]+"")) > Number((time2_start[0]+time2_start[1]+""))
			&& Number((time1_start[0]+time1_start[1]+"")) < Number((time2_end[0]+time2_end[1]+"")))
		checker++;
	if(Number((time1_end[0]+time1_end[1]+"")) > Number((time2_start[0]+time2_start[1]+""))
			&& Number((time1_end[0]+time1_end[1]+"")) < Number((time2_end[0]+time2_end[1]+"")))
		checker++;
	if(Number((time1_start[0]+time1_start[1]+"")) < Number((time2_start[0]+time2_start[1]+""))
			&& Number((time1_end[0]+time1_end[1]+"")) > Number((time2_end[0]+time2_end[1]+"")))
		checker++;
	
	if(checker != 0)
		return false;
	else
		return true;
}