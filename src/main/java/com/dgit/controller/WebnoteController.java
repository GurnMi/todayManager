package com.dgit.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.WebnoteVO;
import com.dgit.service.WebnoteService;

@RestController
@RequestMapping("/webnote/*")
public class WebnoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebnoteController.class);
	
	@Autowired private WebnoteService webnoteService;
	
	@RequestMapping(value="/load" ,method=RequestMethod.GET)
	public List<WebnoteVO> loadWebnote(String id) throws Exception{
		logger.info("loadWebnote");
		
		List<WebnoteVO> vo = new ArrayList<WebnoteVO>();
		vo = webnoteService.selectById(id);
		
		return vo;
	}
}
