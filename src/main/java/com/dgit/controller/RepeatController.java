package com.dgit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.DiaryVO;
import com.dgit.domain.RepeatVO;
import com.dgit.domain.UserVO;
import com.dgit.service.RepeatService;
import com.dgit.service.UserService;
import com.dgit.util.DayUtil;

@Controller
@RequestMapping("/repeat/*")
public class RepeatController {
	
	private static final Logger logger = LoggerFactory.getLogger(RepeatController.class);
	
	@Autowired
	private RepeatService service;
	
	@RequestMapping(value="/insert" ,method=RequestMethod.GET)
	public String insertGet() throws Exception{
		logger.info("insert get");
		
		return "repeat/insert";
	}
	

	@RequestMapping(value="/insert" ,method=RequestMethod.POST)
	public String insertPost(HttpServletRequest req, RepeatVO vo, Model model,RedirectAttributes rttr) throws Exception{
		logger.info("insert post");
		UserVO uservo = DayUtil.getUser(req);
		/*HttpSession session=req.getSession();
		UserVO uservo = (UserVO) session.getAttribute("user");*/
		vo.setUser_id(uservo.getUser_id());
		
		List<RepeatVO> testList= service.RepeatTest(vo);
//		for(RepeatVO rvo : testList){
//			//System.out.println("///////////////////////////////");
//			System.out.println(rvo.toString());
//		}
		
		if(testList.size()>0){
			rttr.addFlashAttribute("insertresult", "error");
		}else{
			service.insertRepeat(vo);
			rttr.addFlashAttribute("insertresult", "success");
		}
		
		System.out.println(vo.toString());
		
		Date date = vo.getRep_start();
		
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

		  
		//return "repeat_main";
		return "redirect:/repeat/list" +"?date=" +dateformat.format(date);
	}
	
	
	@RequestMapping(value="/repeatlist/{date}",method=RequestMethod.GET)
	public ResponseEntity<List<RepeatVO>> listResponseEntity(HttpServletRequest req,@PathVariable("date") String date) throws ParseException{
		logger.info("listResponseEntity");
		
		UserVO uservo = DayUtil.getUser(req);
		Date start_date = null;
		
		RepeatVO rvo= new RepeatVO();
		
		if(date==""||date==null){
			start_date = new Date();
		}else{
			start_date = DayUtil.StringChangeDate(date);
		}
		
		int day = start_date.getDay();
		
		start_date.setDate(start_date.getDate()-day);
		
		System.out.println("ssssssssssss"+start_date);
		
		Date end_date = new Date(start_date.getTime());
		end_date.setDate(end_date.getDate()+7);
		
		System.out.println("ssssssssssss11111"+start_date);
		
		System.out.println("ssssssssssss"+end_date);
		
		rvo.setUser_id(uservo.getUser_id());
		rvo.setRep_start(start_date);
		rvo.setRep_end(end_date);
		
		ResponseEntity<List<RepeatVO>> entity = null;
		try{
			System.out.println(rvo.toString());
			
			List<RepeatVO> list = service.selectRepeat(rvo);
			
			System.out.println(list.size() + "--------------");
			
			entity = new ResponseEntity<List<RepeatVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<RepeatVO>>(HttpStatus.BAD_REQUEST);
		}
		//System.out.println(entity+"///////////////////////");
		return entity;
		
	}
	
	
	@RequestMapping(value="/list" ,method=RequestMethod.GET)
	public String listGet(HttpServletRequest req,Model model, String date) throws Exception{
		logger.info("list");
		
		UserVO uservo = DayUtil.getUser(req);
		
		RepeatVO rvo = new RepeatVO();
		Date start_date = null;
		
		if(date==""||date==null){
			start_date = new Date();
		}else{
			start_date = DayUtil.StringChangeDate(date);
		}
		
		int day = start_date.getDay();
		
		start_date.setDate(start_date.getDate()-day);
		
		System.out.println("ssssssssssss"+start_date);
		
		Date end_date = new Date(start_date.getTime());
		end_date.setDate(end_date.getDate()+7);
		
		System.out.println("ssssssssssss11111"+start_date);
		
		System.out.println("ssssssssssss"+end_date);
		
		rvo.setUser_id(uservo.getUser_id());
		rvo.setRep_start(start_date);
		rvo.setRep_end(end_date);
		rvo.setUser_id(uservo.getUser_id());
		
		List<RepeatVO> repeatList = service.selectRepeat(rvo);
		
		model.addAttribute("list", repeatList);
		model.addAttribute("today", date);
		
		return "repeat_main";
		//return "repeat/list";
	}
	
	@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String delete(HttpServletRequest req, Model model, int repno,String date) throws Exception{
		logger.info("delete");
		
		UserVO uservo = DayUtil.getUser(req);
		
		RepeatVO repeatvo = new RepeatVO();
		repeatvo.setUser_id(uservo.getUser_id());
		
		RepeatVO deletevo = new RepeatVO();
		deletevo.setRep_no(repno);
		deletevo.setUser_id(uservo.getUser_id());
		service.deleteRepeat(deletevo);
		
		List<RepeatVO> repeatList = service.selectRepeat(repeatvo);
		
		//model.addAttribute("list", repeatList);
		
		  
		//return "repeat_main";
		return "redirect:/repeat/list"+"?date="+date;	
	}
	
	@RequestMapping("/listDay")
	public String listDaySearch(HttpServletRequest req, String startday,String endday, Model model) throws Exception{
		logger.info("listDay post");
		
		UserVO uservo = DayUtil.getUser(req);
		
		//System.out.println(startday+"========="+endday);
		
		Date rep_start = new Date();
		Date rep_end = new Date();
		
		if(startday!=""&&startday!=null){
			rep_start = new SimpleDateFormat("yyyy-MM-dd").parse(startday);
		}
		if(endday!=""&&endday!=null){
			rep_end = new SimpleDateFormat("yyyy-MM-dd").parse(endday);
		}
		
		//System.out.println(startday+"========="+endday);
		
		RepeatVO repeatvo = new RepeatVO();
		
		repeatvo.setUser_id(uservo.getUser_id());
		repeatvo.setRep_start(rep_start);
		repeatvo.setRep_end(rep_end);
		
		List<RepeatVO> repeatList = service.selectRepeat(repeatvo);
		System.out.println(repeatList.size()+"=========================");
		
		model.addAttribute("start", rep_start);
		model.addAttribute("end", rep_end);
		model.addAttribute("list", repeatList);
		
		return "repeat/listDay";
	}
	
	

}
