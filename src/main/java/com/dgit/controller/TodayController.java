package com.dgit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.RepeatVO;
import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.service.RepeatService;
import com.dgit.service.TodayService;
import com.dgit.util.DayUtil;

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
		model.addAttribute("dump", false);
		UserVO uservo = DayUtil.getUser(req);
		
//		HttpSession session=req.getSession();
//		UserVO uservo = (UserVO) session.getAttribute("user");
		
		
		Date start_date = StringChangeDate(today);
		
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
		
		System.out.println(todayList.size()+"////////////////");
		
		if(todayList.size()==0){
			for(RepeatVO rVo : repeatList){
				System.out.println("=============");
				System.out.println(rVo.toString());
				TodayVO tVo = repeatVOChangeTodayVO(rVo,start_date, uservo);
				todayService.insertToday(tVo);
				todayList = todayService.selectToday(todayVO);
			}
		}
		
		if(todayList.size()==1){
			for(TodayVO tVo : todayList){
				System.out.println(tVo.getPlan_type()+"////////////////");
				if(tVo.getPlan_type().equals("dump")){
					//todayList.remove(0);
					model.addAttribute("dump", true);
					System.out.println("dump//////////////////////////");
				}else{
					model.addAttribute("dump", false);
				}
			}
		}
		
		System.out.println(repeatList.size()+"===========");
		System.out.println(todayList.size()+"===========");
		
		model.addAttribute("today", start_date);
		model.addAttribute("list", repeatList);
		model.addAttribute("tolist", todayList);
		
		return "today_desktop";
	}
	
	@RequestMapping(value="/today" ,method=RequestMethod.GET)
	public String todayinsertGet(HttpServletRequest req, String today, Model model) throws Exception{
		logger.info("today main");
		model.addAttribute("dump", false);
		UserVO uservo = DayUtil.getUser(req);
		
//		HttpSession session=req.getSession();
//		UserVO uservo = (UserVO) session.getAttribute("user");
		
		
		Date start_date = StringChangeDate(today);
		
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
		
		System.out.println(todayList.size()+"////////////////");
		
		if(todayList.size()==0){
			for(RepeatVO rVo : repeatList){
				System.out.println("=============");
				System.out.println(rVo.toString());
				TodayVO tVo = repeatVOChangeTodayVO(rVo,start_date, uservo);
				todayService.insertToday(tVo);
				todayList = todayService.selectToday(todayVO);
			}
		}
		
		if(todayList.size()==1){
			for(TodayVO tVo : todayList){
				System.out.println(tVo.getPlan_type()+"////////////////");
				if(tVo.getPlan_type().equals("dump")){
					//todayList.remove(0);
					model.addAttribute("dump", true);
					System.out.println("dump//////////////////////////");
				}else{
					model.addAttribute("dump", false);
				}
			}
		}
		
		System.out.println(repeatList.size()+"===========");
		System.out.println(todayList.size()+"===========");
		
		model.addAttribute("today", start_date);
		model.addAttribute("list", repeatList);
		model.addAttribute("tolist", todayList);
		
		
		
		return "today_desktop";
	}
	
	
	
	@RequestMapping(value="/" ,method=RequestMethod.POST)
	public String insertPost(HttpServletRequest req, TodayVO vo, Model model) throws Exception{
		logger.info("today main");
		
		UserVO uservo = DayUtil.getUser(req);
		vo.setUser_id(uservo.getUser_id());
		
		List<TodayVO> todayList =  todayService.repeatTest(vo);
		System.out.println(todayList.size()+"/////////////////////");
		if(todayList.size()>0){
			for(TodayVO t : todayList){
				//System.out.println("=======ddddddd==========");
				System.out.println(t.toString());
				todayService.deleteToday(t);
			}
		}
		
		todayService.insertToday(vo);
		
		//List<TodayVO> todayList = todayService.selectToday(vo);
		
		return "redirect:/today/";
	}
	
	
	@RequestMapping(value="/today" ,method=RequestMethod.POST)
	public String todayinsertPost(HttpServletRequest req, TodayVO vo, String today, String time_start, String time_end, String date, Model model) throws Exception{
		logger.info("today main insert");
		
		UserVO uservo = DayUtil.getUser(req);
		vo.setUser_id(uservo.getUser_id());
		Date start_date = new Date(DayUtil.StringChangeDate(today).getTime());
		Date end_date = new Date(DayUtil.StringChangeDate(today).getTime());
		
		String[] sTime = time_start.split(":");
		String[] eTime = time_end.split(":");
		
		start_date.setHours(Integer.parseInt(sTime[0]));
		start_date.setMinutes(Integer.parseInt(sTime[1]));
		if(eTime[0].equals("24")){
			end_date.setHours(23);
			end_date.setMinutes(59);
		}else{
			end_date.setHours(Integer.parseInt(eTime[0]));
			end_date.setMinutes(Integer.parseInt(eTime[1]));
		}
		
		
		vo.setStart_date(start_date);
		vo.setEnd_date(end_date);
		System.out.println(time_start+"-----------------------------");
		System.out.println(time_end+"-----------------------------");
		System.out.println(vo.toString()+"////////////////////////////");
		
		//중복처리
		List<TodayVO> todayList =  todayService.repeatTest(vo);
		System.out.println(todayList.size()+"/////////////////////");
		if(todayList.size()>0){
			for(TodayVO t : todayList){
				//System.out.println("=======ddddddd==========");
				if(t.getPlan_type().equals("dump")){
					todayService.deleteToday(t);
				}
				
			}
		}
		
		todayService.insertToday(vo);
		
		//List<TodayVO> todayList = todayService.selectToday(vo);
		
		return "redirect:/today/todayview";
	}
	
	@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String delete(HttpServletRequest req, Model model, String prino) throws Exception{
		logger.info("delete");
		
		UserVO uservo = DayUtil.getUser(req);
		
		TodayVO tvo = new TodayVO();
		tvo.setUser_id(uservo.getUser_id());
		
		int pri_no = Integer.parseInt(prino.substring(6));
		
		tvo.setPri_no(pri_no);
		
		tvo = todayService.selectTodayByNo(pri_no);
		
		Date day = tvo.getStart_date();
		
		todayService.deleteToday(tvo);
		
		
		TodayVO testvo = new TodayVO();
		testvo.setUser_id(uservo.getUser_id());
		testvo.setStart_date(day);
		List<TodayVO> list = todayService.selectToday(testvo);
		
		if(list.size()==0){			
			TodayVO dumpvo = new TodayVO();
			dumpvo.setUser_id(uservo.getUser_id());
			
			Date sDay = new Date();
			Date eDay = new Date();
			
			sDay.setYear(day.getYear());
			sDay.setMonth(day.getMonth());
			sDay.setDate(day.getDate());
			sDay.setHours(0);
			sDay.setMinutes(0);
			
			eDay.setYear(day.getYear());
			eDay.setMonth(day.getMonth());
			eDay.setDate(day.getDate());
			eDay.setHours(23);
			eDay.setMinutes(59);
			
			
			dumpvo.setStart_date(sDay);
			dumpvo.setEnd_date(eDay);
			dumpvo.setPlan_type("dump");
			
			todayService.insertToday(dumpvo);			
		}
		
		return "redirect:/today/today";
	}
	
	/*@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String delete(HttpServletRequest req, Model model, int prino) throws Exception{
		logger.info("delete");
		
		UserVO uservo = DayUtil.getUser(req);
		
		TodayVO tvo = new TodayVO();
		tvo.setUser_id(uservo.getUser_id());
		tvo.setPri_no(prino);
		
		tvo = todayService.selectTodayByNo(prino);
		
		Date day = tvo.getStart_date();
		
		todayService.deleteToday(tvo);
		
		
		TodayVO testvo = new TodayVO();
		testvo.setUser_id(uservo.getUser_id());
		testvo.setStart_date(day);
		List<TodayVO> list = todayService.selectToday(testvo);
		
		if(list.size()==0){			
			TodayVO dumpvo = new TodayVO();
			dumpvo.setUser_id(uservo.getUser_id());
			
			Date sDay = new Date();
			Date eDay = new Date();
			
			sDay.setYear(day.getYear());
			sDay.setMonth(day.getMonth());
			sDay.setDate(day.getDate());
			sDay.setHours(0);
			sDay.setMinutes(0);
			
			eDay.setYear(day.getYear());
			eDay.setMonth(day.getMonth());
			eDay.setDate(day.getDate());
			eDay.setHours(23);
			eDay.setMinutes(59);
			
			
			dumpvo.setStart_date(sDay);
			dumpvo.setEnd_date(eDay);
			dumpvo.setPlan_type("dump");
			
			todayService.insertToday(dumpvo);			
		}
		
		return "redirect:/today/";
	}*/
	
	@ResponseBody
	@RequestMapping(value="/all/{date}",method=RequestMethod.GET)
	public ResponseEntity<List<TodayVO>> list(HttpServletRequest req,@PathVariable("date") String date) throws Exception{
		logger.info("today main todayview date");
		UserVO uservo = DayUtil.getUser(req);
		Date start_date = null;
		
		if(date==""||date==null){
			start_date = new Date();
		}else{
			start_date = DayUtil.StringChangeDate(date);
		}
		
		ResponseEntity<List<TodayVO>> entity = null;
		
		//반복땡기기
		RepeatVO repeatvo = new RepeatVO();
		
		repeatvo.setUser_id(uservo.getUser_id());
		repeatvo.setRep_start(start_date);
		repeatvo.setRep_end(start_date);
		int dayInt = start_date.getDay();
		String day = dayArr[dayInt];
		repeatvo.setRep_day(day);
		
		System.out.println(repeatvo.toString()+"===========");
		
		List<RepeatVO> repeatList = repeatService.selectRepeat(repeatvo);
		
		TodayVO todayVO = new TodayVO();
		todayVO.setUser_id(uservo.getUser_id());
		todayVO.setStart_date(start_date);
		List<TodayVO> todayList = todayService.selectToday(todayVO);
		
		System.out.println(todayList.size()+"////////////////");
		
		//반복 있을경우 today에 추가
		if(todayList.size()==0&&repeatList.size()>0){
			for(RepeatVO rVo : repeatList){
				System.out.println("=============");
				System.out.println(rVo.toString());
				TodayVO tVo = repeatVOChangeTodayVO(rVo,start_date, uservo);
				todayService.insertToday(tVo);
				todayList = todayService.selectToday(todayVO);
			}
		}
		
		//오늘날짜 세팅
		TodayVO tvo = new TodayVO();
		tvo.setUser_id(uservo.getUser_id());
		tvo.setStart_date(start_date);
		
		try{
			List<TodayVO> list = todayService.selectToday(tvo);
			if(list.size()>=1){
				for(TodayVO tVo : list){
					System.out.println(tVo.getPlan_type()+"////////////////");
					if(tVo.getPlan_type().equals("dump")){
						entity = new ResponseEntity<List<TodayVO>>(HttpStatus.OK);
					}else{
						entity = new ResponseEntity<List<TodayVO>>(list, HttpStatus.OK);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<TodayVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/todayview",method=RequestMethod.GET)
	public String view() throws ParseException{
		logger.info("today main todayview");
		return "today_desktop";
	}
	
	public Date StringChangeDate(String today) throws ParseException{
		Date start_date = new Date();
		
		if(today!=""&&today!=null){
			start_date = new SimpleDateFormat("yyyy-MM-dd").parse(today);
		}
		return start_date;
	}
	
	
	@SuppressWarnings("deprecation")
	public TodayVO repeatVOChangeTodayVO(RepeatVO rVo, Date day, UserVO uservo){
		Date sDay = new Date(day.getTime());
		Date eDay = new Date(day.getTime());
		
		/*sDay.setYear(day.getYear());
		sDay.setMonth(day.getMonth());
		sDay.setDate(day.getDate());*/
		sDay.setHours(rVo.getRep_start().getHours());
		sDay.setMinutes(rVo.getRep_start().getMinutes());
		
		/*eDay.setYear(day.getYear());
		eDay.setMonth(day.getMonth());
		eDay.setDate(day.getDate());*/
		eDay.setHours(rVo.getRep_end().getHours());
		eDay.setMinutes(rVo.getRep_end().getMinutes());

		TodayVO tVo=new TodayVO();
		tVo.setUser_id(uservo.getUser_id());
		tVo.setPlan_title(rVo.getRep_title());
		tVo.setPlan_type(rVo.getRep_type());
		
		tVo.setStart_date(sDay);
		tVo.setEnd_date(eDay);
		
//		System.out.println(sDay + "===================" +eDay);
//		System.out.println("rvo==============="+rVo.toString());
//		System.out.println("tvo==============="+tVo.toString());
		
		return tVo;
	}
	
	
	
	
}
