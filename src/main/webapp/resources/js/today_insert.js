function time_compare_string(time1, time2){
	var arr1 = time1.split(":");
	var arr2 = time2.split(":");
		
	if(Number((arr1[0]+arr1[1]+"")) > Number((arr2[0]+arr2[1]+"")))
		return false;
	else
		return true;
}