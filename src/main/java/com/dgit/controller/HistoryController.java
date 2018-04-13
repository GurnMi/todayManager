package com.dgit.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.DiaryVO;
import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.service.DiaryService;
import com.dgit.service.TodayService;
import com.dgit.util.DayUtil;

@Controller
@RequestMapping("/history/*")
public class HistoryController {
	
private static final Logger logger = LoggerFactory.getLogger(HistoryController.class);
	
	@Autowired
	private TodayService todayService;
	
	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping(value="/" ,method=RequestMethod.GET)
	public String mainDiary(HttpServletRequest req, Model model, String today) throws Exception{
		logger.info("main diary");
		
		
		UserVO uservo = DayUtil.getUser(req);
		Date date = new Date();
		if(today!=null||today!=""){
			date = DayUtil.StringChangeDate(today);
		}
		
		DiaryVO dvo = new DiaryVO();
		dvo.setUser_id(uservo.getUser_id());
		dvo.setDiary_day(date);
		List<DiaryVO> diarylist = diaryService.selectDiary(dvo);
		if(diarylist.size()==0){
			model.addAttribute("Diary", false);
		}else{
			model.addAttribute("Diary", true);
			model.addAttribute("diarylist", diarylist);
		}
		
		TodayVO tvo = new TodayVO();
		tvo.setUser_id(uservo.getUser_id());
		tvo.setStart_date(date);
		List<TodayVO> todaylist  =todayService.selectToday(tvo);
		
		for(TodayVO vo : todaylist){
			long start = vo.getStart_date().getTime();
			long end =vo.getEnd_date().getTime();
			long minute  = (end -start)/60000;
			
					
			System.out.println(vo.getPlan_title() + minute +"///////////////////////////");
		}
		
		if(todaylist.size()==0){
			model.addAttribute("Today", false);
		}else{
			model.addAttribute("Today", true);
			model.addAttribute("todaylist", todaylist);
		}
		
		return "history";
	}

}
