package com.dgit.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.WebnoteVO;
import com.dgit.service.WebnoteService;
import com.dgit.util.DayUtil;

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
	
	@RequestMapping(value="/modify" ,method=RequestMethod.GET)
	public String modifyWebnote(String no, String content) throws Exception{
		logger.info("modifyWebnote");
		
		WebnoteVO vo = new WebnoteVO();
		vo = webnoteService.selectByNo(Integer.valueOf(no));
		vo.setNote_content(content);
		webnoteService.updateByNo(vo);
		
		return "Update Success";
	}
	
	@RequestMapping(value="/delete" ,method=RequestMethod.GET)
	public String deleteWebnote(String no) throws Exception{
		logger.info("deleteWebnote");
		
		webnoteService.deleteByNo(Integer.valueOf(no));
		
		return "Delete Success";
	}
	
	@RequestMapping(value="/insert" ,method=RequestMethod.GET)
	public String insertWebnote(HttpServletRequest req, String content) throws Exception{
		logger.info("insertWebnote");
		
		WebnoteVO vo = new WebnoteVO();
		vo.setUser_id(DayUtil.getUser(req).getUser_id());
		vo.setNote_content(content);
		Date now = new Date();
		vo.setNote_date(now);
				
		webnoteService.insertWebnote(vo);
		
		return "Insert Success";
	}
}
