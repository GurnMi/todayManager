package com.dgit.controller;

import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.RepeatVO;
import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.service.RepeatService;
import com.dgit.service.TodayService;

@Controller
@RequestMapping("/today/*")
public class TodayController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodayController.class);
	private String[]  dayArr = {"일","월","화","수","목","금","토"};
	
	
	@Autowired
	private TodayService todayService;
	@Autowired
	private RepeatService repeatService;
	
	@RequestMapping(value="/" ,method=RequestMethod.GET)
	public String insertGet(HttpServletRequest req, String today, Model model) throws Exception{
		logger.info("today main");
		
		UserVO uservo = getUser(req);
		
//		HttpSession session=req.getSession();
//		UserVO uservo = (UserVO) session.getAttribute("user");
		
		Date start_date = new Date();
		
		if(today!=""&&today!=null){
			start_date = new SimpleDateFormat("yyyy-MM-dd").parse(today);
		}
		
		int dayInt = start_date.getDay();
		String day = dayArr[dayInt];
		
		
		RepeatVO repeatvo = new RepeatVO();
		
		repeatvo.setUser_id(uservo.getUser_id());
		repeatvo.setRep_start(start_date);
		repeatvo.setRep_end(start_date);
		repeatvo.setRep_day(day);
		
		System.out.println(repeatvo.toString()+"===========");
		
		List<RepeatVO> repeatList = repeatService.selectRepeat(repeatvo);
		
		TodayVO todayVO = new TodayVO();
		todayVO.setUser_id(uservo.getUser_id());
		todayVO.setStart_date(start_date);
		List<TodayVO> todayList = todayService.selectToday(todayVO);
		
		if(todayList==null){
			for(RepeatVO rVo : repeatList){
				System.out.println("=============");
				System.out.println(rVo.toString());
				TodayVO tVo = repeatVOChangeTodayVO(rVo,start_date, uservo);
				todayList.add(tVo);
				todayService.insertToday(tVo);
			}
		}
		
		System.out.println(repeatList.size()+"===========");
		System.out.println(todayList.size()+"===========");
		
		model.addAttribute("today", start_date);
		model.addAttribute("list", repeatList);
		model.addAttribute("tolist", todayList);
		
		return "redirect:/today/todayMain";
	}
	
	@RequestMapping(value="/" ,method=RequestMethod.POST)
	public String insertPost(HttpServletRequest req, String today, Model model) throws Exception{
		logger.info("today main");
		
		UserVO uservo = getUser(req);
		
		
		return "redirect:/today/todayMain";
	}
	
	@SuppressWarnings("deprecation")
	public TodayVO repeatVOChangeTodayVO(RepeatVO rVo, Date day, UserVO uservo){
		Date sDay = new Date();
		Date eDay = new Date();
		
		sDay.setYear(day.getYear());
		sDay.setMonth(day.getMonth());
		sDay.setDate(day.getDate());
		sDay.setHours(rVo.getRep_start().getHours());
		sDay.setMinutes(rVo.getRep_start().getMinutes());
		
		eDay.setYear(day.getYear());
		eDay.setMonth(day.getMonth());
		eDay.setDate(day.getDate());
		eDay.setHours(rVo.getRep_end().getHours());
		eDay.setMinutes(rVo.getRep_end().getMinutes());

		TodayVO tVo=new TodayVO();
		tVo.setUser_id(uservo.getUser_id());
		tVo.setPlan_title(rVo.getRep_title());
		tVo.setPlan_type(rVo.getRep_type());
		
		tVo.setStart_date(sDay);
		tVo.setEnd_date(eDay);
		
		System.out.println(sDay + "===================" +eDay);
		System.out.println("rvo==============="+rVo.toString());
		System.out.println("tvo==============="+tVo.toString());
		
		return tVo;
	}
	
	
	public UserVO getUser(HttpServletRequest req){
		HttpSession session=req.getSession();
		UserVO uservo = (UserVO) session.getAttribute("user");
		return uservo;
	}
	
	
	
	
}
