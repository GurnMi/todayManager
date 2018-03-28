package com.dgit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/")
	public String login() throws Exception{
		logger.info("login");
		
		return "login/login";
	}
	
	@RequestMapping("/result")
	public String loginResult(HttpServletRequest req,String id) throws Exception{
		logger.info("result");
		logger.info("id" + id);
		
		HttpSession session=req.getSession();
		
		//req.setAttribute("id", id);		
		session.setAttribute("id", id);
				
		return "login/loginResult";
	}
}
