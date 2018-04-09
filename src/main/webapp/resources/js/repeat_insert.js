

$(function(){
	$("form[name='f1']").submit(function(){
		var startDay = $("input[name='rep_start_day']").val();
		var startTime = $("input[name='rep_start_time']").val();
		
		var startDate = new Date(startDay+"T"+startTime);
		//alert(startDate);
		
		$("input[name='rep_start']").val(startDate);
		
		var endDay = $("input[name='rep_end_day']").val();
		var endTime = $("input[name='rep_end_time']").val();
		
		var endDate = new Date(endDay+"T"+endTime);
		//alert(date);
		
		$("input[name='rep_end']").val(endDate);
		
		//return false;
	})
});