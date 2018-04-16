package com.dgit.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.DiaryVO;
import com.dgit.domain.UserVO;
import com.dgit.service.DiaryService;
import com.dgit.service.TodayService;
import com.dgit.util.DayUtil;

@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
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
		
		List<DiaryVO> list = diaryService.selectDiary(dvo);
		if(list.size()==0){
			model.addAttribute("Diary", false);
		}else{
			model.addAttribute("Diary", true);
			model.addAttribute("list", list);
		}
				
		
		return "diary_main";
	}
		
	@RequestMapping(value="/register" ,method=RequestMethod.GET)
	public String regster(HttpServletRequest req, Model model) throws Exception{
		logger.info("regster GET");
		
		
		
		return "diary_insert";
	}
	
	
	@RequestMapping(value="/register" ,method=RequestMethod.POST)
	public String regsterPOST(HttpServletRequest req, DiaryVO dvo, String mark, String day) throws Exception{
		logger.info("regster POST");
		
		UserVO uservo = DayUtil.getUser(req);
		
		Date diary_day = DayUtil.StringChangeDate(day);
		int diary_mark = Integer.parseInt(mark);				
		
		dvo.setUser_id(uservo.getUser_id());
		dvo.setDiary_day(diary_day);
		dvo.setDiary_mark(diary_mark);
		
		System.out.println(dvo.toString());
		
		diaryService.insertDiary(dvo);
		
		return "redirect:/diary/";
	}
	
	@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String delete(HttpServletRequest req, int diano) throws Exception{
		logger.info("regster POST");
		
		UserVO uservo = DayUtil.getUser(req);
		
		DiaryVO dvo = new DiaryVO();
		dvo.setUser_id(uservo.getUser_id());
		
		dvo.setDia_no(diano);
		
		diaryService.deleteDiary(dvo);
		
		return "redirect:/diary/";
	}
	
	@RequestMapping(value="/update" ,method=RequestMethod.GET)
	public String updateGET(HttpServletRequest req, Model model, int diano) throws Exception{
		logger.info("Update POST");
	
		DiaryVO dvo = diaryService.selectDiaryByNo(diano);
		
		model.addAttribute("DiaryVO", dvo);
		
		return "diary/diaryUpdate";
	}
	
	@RequestMapping(value="/update" ,method=RequestMethod.POST)
	public String updatePost(HttpServletRequest req, DiaryVO dvo, String mark, String day) throws Exception{
		logger.info("update POST");
		
		UserVO uservo = DayUtil.getUser(req);
		
		Date diary_day = DayUtil.StringChangeDate(day);
		int diary_mark = Integer.parseInt(mark);				
		
		dvo.setUser_id(uservo.getUser_id());
		dvo.setDiary_day(diary_day);
		dvo.setDiary_mark(diary_mark);
		
		System.out.println("/////////////////////////////"+dvo.toString());
		
		diaryService.updateDiary(dvo);
		
		return "redirect:/diary/";
	}
	
	
}
