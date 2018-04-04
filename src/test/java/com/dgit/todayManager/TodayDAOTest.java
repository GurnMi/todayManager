package com.dgit.todayManager;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.persistence.TodayDAO;
import com.dgit.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TodayDAOTest {
	
	@Autowired
	private TodayDAO dao;
	
	@Test
	public void testjoin() throws Exception{
		Date date = new Date();
		TodayVO vo = new TodayVO(1, "test",date, date,"운동","운동내용","운동제목");
		
		System.out.println("============="+date);
		
		dao.insert(vo);
		
		TodayVO vo1 = new TodayVO();
		vo1.setUser_id("test");
		//vo1.setPlan_type("운");
		//vo1.setPri_no(null);
		
		
		//TodayVO vo = dao.selectNo(2);
		/*
		System.out.println("========="+vo.toString());
		vo.setPlan_type("1123");
		vo.setPlan_content("내용");
		vo.setStart_date(date);
		vo.setEnd_date(date);*/
		//dao.update(vo);
		
		
		
		/*Date date1 = new Date();
			
		vo1.setStart_date(date1);
		
		List<TodayVO> list = dao.select(vo1);
		
		for(TodayVO vo3 :list){
			System.out.println("==========="+vo3.toString());
		}*/
		
		/*TodayVO vo = new TodayVO();
		vo.setUser_id("test");
		vo.setStart_date(date);
				
		dao.delete(vo);*/
		
	}
	

}
