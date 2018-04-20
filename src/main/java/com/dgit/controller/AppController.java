package com.dgit.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.UserVO;
import com.dgit.service.UserService;

@RestController
@RequestMapping("/app/*")
public class AppController {

	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	@Autowired private UserService service;
	
	@RequestMapping(value="/user" ,method=RequestMethod.GET)
	public HashMap<String, Object> selectByUser(String id) throws Exception{
		logger.info("selectByUser");
		
		UserVO user = service.selectUserById(id);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(user == null)
			result.put("result", "false");
		else
			result.put("result", "true");
		
		result.put("data", user);
		
		return result;
	}
	
	@RequestMapping(value="/join" ,method=RequestMethod.GET)
	public HashMap<String, Object> insertUser(String nick, String id) throws Exception{
		logger.info("insertUser");
		
		UserVO user = service.selectUserByNick(nick);
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(user == null){
			// 중복되는 닉네임이 없음  > 진행
			result.put("result", "false");
			
			UserVO vo = new UserVO(id, nick);
			service.joinUser(vo);
			
			return result;
		}
		else{
			// 중복되는 닉네임이 존재 > 결과 리턴
			result.put("result", "true");
			return result;
		}
	}
}
