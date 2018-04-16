package com.dgit.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		logger.info("history");
		
		
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
	
	@RequestMapping(value="/all/{date}",method=RequestMethod.GET)
	public ResponseEntity<HashMap<String, ArrayList<String>>> list(HttpServletRequest req,@PathVariable("date") String date) throws ParseException{
		
		UserVO uservo = DayUtil.getUser(req);
		Date start_date = null;
		
		if(date==""||date==null){
			start_date = new Date();
		}else{
			start_date = DayUtil.StringChangeDate(date);
		}
		
		ResponseEntity<HashMap<String, ArrayList<String>>> entity = null;
		
		TodayVO tvo = new TodayVO();
		tvo.setUser_id(uservo.getUser_id());
		tvo.setStart_date(start_date);
		
		try{
			List<TodayVO> list = todayService.selectToday(tvo);
			HashMap<String, ArrayList<String>> map = new HashMap<>();
			ArrayList<String> type = new ArrayList<>();
			ArrayList<String> min = new ArrayList<>();
			
			for(TodayVO vo : list){
				long start = vo.getStart_date().getTime();
				long end =vo.getEnd_date().getTime();
				int minute  = (int) ((end -start)/60000);
				
				type.add(vo.getPlan_type());
				min.add(minute+"");
			}
			
			map.put("type", type);
			map.put("min", min);
			
			entity = new ResponseEntity<HashMap<String, ArrayList<String>>>(map, HttpStatus.OK);
			
			/*
			
			ArrayList<HashMap<String, Integer>> todayList = new ArrayList<>();
			
			
			 for(TodayVO vo : list){
					long start = vo.getStart_date().getTime();
					long end =vo.getEnd_date().getTime();
					int minute  = (int) ((end -start)/60000);
					
					map.put(vo.getPlan_type() ,minute);
					
					//System.out.println(vo.getPlan_title() + minute +"///////////////////////////");
				}
			
			todayList.add(map);*/
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<HashMap<String, ArrayList<String>>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
