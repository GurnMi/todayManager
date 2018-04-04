package com.dgit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.RepeatVO;
import com.dgit.domain.UserVO;
import com.dgit.service.RepeatService;
import com.dgit.service.UserService;

@Controller
@RequestMapping("/repeat/*")
public class RepeatController {
	
private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private RepeatService service;
	
	@RequestMapping(value="/insert" ,method=RequestMethod.GET)
	public String insert() throws Exception{
		logger.info("insert get");
		
		return "repeat/insert";
	}
	
	@RequestMapping(value="/insert" ,method=RequestMethod.POST)
	public String insert(HttpServletRequest req, RepeatVO vo) throws Exception{
		logger.info("insert post");
		
		HttpSession session=req.getSession();
		UserVO uservo = (UserVO) session.getAttribute("user");
		
		vo.setUser_id(uservo.getUser_id());
		
		System.out.println(vo.toString());
		
		service.insertRepeat(vo);
		
		
		return "redirect:/login/main";
	}
	

}
