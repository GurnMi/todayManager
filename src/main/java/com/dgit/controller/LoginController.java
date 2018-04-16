package com.dgit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.UserVO;
import com.dgit.service.UserService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/" ,method=RequestMethod.GET)
	public String login() throws Exception{
		logger.info("login");
		
		return "main_desktop";
	}
	
	@RequestMapping(value="/main" ,method=RequestMethod.GET)
	public String loginMain() throws Exception{
		logger.info("main");
		
		return "user/loginResult";
	}
	
	@RequestMapping(value="/" ,method=RequestMethod.POST)
	public String loginResult(HttpServletRequest req,String id) throws Exception{
		logger.info("loginresult");
		logger.info("id" + id);
		
		UserVO vo = service.selectUserById(id);
		
		if(vo==null){
			req.setAttribute("id", id);	
			return "user/joinForm";
		}else{
			HttpSession session=req.getSession();
			
			//req.setAttribute("id", id);		
			session.setAttribute("user", vo);
			
			return "main_desktop";
		}
	}
	
	//삭제할거
	   @RequestMapping(value="/list" ,method=RequestMethod.GET)
	   public String loginResultlist(HttpServletRequest req,String id) throws Exception{
	      logger.info("loginresult");
	      logger.info("id" + id);
	      
	      UserVO vo = service.selectUserById(id);
	      
	      return "user/loginResult";
	   }
	
	@RequestMapping(value="/nickCheck" ,method=RequestMethod.GET)
	public ResponseEntity<String> joinNick(String nick) throws Exception{
		logger.info("join nick test");
		logger.info(nick);
		
		ResponseEntity<String> entity =null;
		
		UserVO vo = service.selectUserByNick(nick);
		
		if(vo==null){
			entity = new ResponseEntity<String>("false",HttpStatus.OK);
		}else{
			entity = new ResponseEntity<String>("true",HttpStatus.OK);
		}		
		return entity;
	}
	
	@RequestMapping(value="/join" ,method=RequestMethod.POST)
	public String joinResult(HttpServletRequest req,UserVO vo) throws Exception{
		logger.info("join");
		logger.info(vo.toString());
		
		service.joinUser(vo);
		
		
		HttpSession session=req.getSession();
		
		//req.setAttribute("id", id);		
		session.setAttribute("user", vo);
		
		return "user/loginResult";
	}
	
	@RequestMapping(value="/leave" ,method=RequestMethod.GET)
	public String leave(HttpServletRequest req) throws Exception{
		logger.info("leave");
		
		HttpSession session=req.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		service.leaveUser(vo.getUser_id());
		
		return "user/login";
	}
	
	@RequestMapping(value="/update" ,method=RequestMethod.GET)
	public String update(HttpServletRequest req) throws Exception{
		logger.info("update");
		
		HttpSession session=req.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		
		return "user/updateForm";
	}
	
	@RequestMapping(value="/update" ,method=RequestMethod.POST)
	public String updatePost(HttpServletRequest req,UserVO vo) throws Exception{
		logger.info("updatePost");
				
		service.updateUser(vo);
		
		HttpSession session=req.getSession();	
		session.setAttribute("user", vo);
		
		return "user/loginResult";
	}
	
	
	@RequestMapping("/logout")
	public String logouthome(HttpServletRequest req) throws Exception{
		logger.info("logout");
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "main_desktop";
	}
	
}
