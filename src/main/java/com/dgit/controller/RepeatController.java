package com.dgit.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.RepeatVO;
import com.dgit.domain.UserVO;
import com.dgit.service.RepeatService;
import com.dgit.service.UserService;
import com.dgit.util.DayUtil;

@Controller
@RequestMapping("/repeat/*")
public class RepeatController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
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
			rttr.addFlashAttribute("result", "error");
		}else{
			service.insertRepeat(vo);
			rttr.addFlashAttribute("result", "success");
		}
		
		System.out.println(vo.toString());
		
		return "redirect:/repeat/list";
	}
	
	
	@RequestMapping(value="/list" ,method=RequestMethod.GET)
	public String listGet(HttpServletRequest req,Model model) throws Exception{
		logger.info("list");
		
		UserVO uservo = DayUtil.getUser(req);
		
		RepeatVO repeatvo = new RepeatVO();
		repeatvo.setUser_id(uservo.getUser_id());
		
		List<RepeatVO> repeatList = service.selectRepeat(repeatvo);
		
		model.addAttribute("list", repeatList);
		
		return "repeat/list";
	}
	
	@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String delete(HttpServletRequest req, Model model, int repno) throws Exception{
		logger.info("delete");
		
		UserVO uservo = DayUtil.getUser(req);
		
		RepeatVO repeatvo = new RepeatVO();
		repeatvo.setUser_id(uservo.getUser_id());
		
		RepeatVO deletevo = new RepeatVO();
		deletevo.setRep_no(repno);
		deletevo.setUser_id(uservo.getUser_id());
		service.deleteRepeat(deletevo);
		
		List<RepeatVO> repeatList = service.selectRepeat(repeatvo);
		
		model.addAttribute("list", repeatList);
		
		return "redirect:/repeat/list";
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
