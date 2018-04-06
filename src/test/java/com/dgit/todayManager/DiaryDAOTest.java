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
import com.dgit.domain.TodayVO;
import com.dgit.domain.UserVO;
import com.dgit.persistence.DiaryDAO;
import com.dgit.persistence.TodayDAO;
import com.dgit.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DiaryDAOTest {
	
	@Autowired
	private DiaryDAO dao;
	
	@Test
	public void testinsert() throws Exception{
		
		Date date = new Date();
		
		//date.setDate(date.getDate()+1);
		DiaryVO vo = new DiaryVO(0, "test", "일기1", "일기내용", date, 5);
		DiaryVO vo1 = new DiaryVO(0, "test", "일기122", "일기내용22", date, 5);
		dao.insert(vo);
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
