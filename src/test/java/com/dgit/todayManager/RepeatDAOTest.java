package com.dgit.todayManager;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.DiaryVO;
import com.dgit.domain.RepeatVO;
import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.persistence.DiaryDAO;
import com.dgit.persistence.RepeatDAO;
import com.dgit.persistence.TodayDAO;
import com.dgit.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class RepeatDAOTest {
	
	@Autowired
	private RepeatDAO dao;
	
	@SuppressWarnings("deprecation")
	@Test
	public void testinsert() throws Exception{
		Date date = new Date();
		Date sdate = new Date();
		Date edate = new Date();
				
		edate.setDate(edate.getDate()+5);
		
		Date date1 = new Date();
		Date date2 = new Date();
		date1.setDate(date1.getDate()-1);
		date2.setDate(date2.getDate()+15);
		date1.setHours(18);
		date2.setHours(20);
		date2.setMinutes(0);
		//System.out.println(date2+ "============"+date1);
		
		//RepeatVO vo = new RepeatVO(1,"test","공부","test","화",edate, date1);
		
	/*	dao.insert(vo);
		vo.setRep_start(date1);
		dao.insert(vo);
		vo.setRep_start(sdate);
		dao.insert(vo);
		*/
		RepeatVO vo1 = new RepeatVO();
		vo1.setUser_id("dlrjsak4@gmail.com");
		vo1.setRep_start(date1);
		vo1.setRep_end(date2);
		vo1.setRep_day("월");
		System.out.println(date1+ "================="+date2);
		System.out.println("======vo1======="+vo1.toString());
		
		
		List<RepeatVO> list = dao.select(vo1);
		System.out.println(list.size()+"=========size");
		for(RepeatVO vo2 : list){
			System.out.println("===list===="+vo2.toString());
		}
		
		/*System.out.println(dao.selectNo(1));
		
		vo.setRep_day("화");
		vo.setRep_end(date2);
		vo.setRep_start(date1);
		vo.setRep_no(1);
		vo.setRep_title("111");
		vo.setRep_type("잉여");
		dao.update(vo);*/
		
		
		/*DiaryVO vo1 = new DiaryVO();
		vo.setUser_id("test");
		List<DiaryVO> list = dao.select(vo);
		for(DiaryVO vo2 : list){
			System.out.println("======="+vo2.toString());
		}
		System.out.println(dao.selectNo(1));*/
		
		//dao.update(vo1);
		//dao.delete(vo1);
		
	}
	

}
