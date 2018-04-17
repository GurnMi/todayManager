package com.dgit.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/parser/*")
public class ParserController {
	
	private static final Logger logger = LoggerFactory.getLogger(ParserController.class);
	
	@RequestMapping(value="/sido" ,method=RequestMethod.GET)
	public String sidoGet(Model model) throws Exception{
		logger.info("sidoGet");
		
		Document weatherNuri = Jsoup.connect("http://www.weather.go.kr/weather/lifenindustry/sevice_rss.jsp").get();
		String sido = weatherNuri.select("select[name=sido]").html();
		model.addAttribute("sido", sido);
		
		return "area_sido";
	}
	
	@RequestMapping(value="/gungu" ,method=RequestMethod.GET)
	public String gunguGet(Model model, String sido) throws Exception{
		logger.info("gunguGet");
		
		Document weatherNuri = Jsoup.connect("http://www.weather.go.kr/weather/lifenindustry/sevice_rss.jsp?sido="+sido).get();
		String gungu = weatherNuri.select("select[name=gugun]").html();
		model.addAttribute("gungu", gungu);
		
		return "area_gungu";
	}
	
	@RequestMapping(value="/dong" ,method=RequestMethod.GET)
	public String dongGet(Model model, String sido, String gugun) throws Exception{
		logger.info("dongGet");
		
		Document weatherNuri = Jsoup.connect("http://www.weather.go.kr/weather/lifenindustry/sevice_rss.jsp?sido="+sido+"&gugun="+gugun).get();
		String dong = weatherNuri.select("select[name=dong]").html();
		model.addAttribute("dong", dong);
		
		return "area_dong";
	}
}
