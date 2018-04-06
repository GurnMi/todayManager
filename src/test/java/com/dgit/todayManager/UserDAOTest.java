package com.dgit.todayManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.UserVO;
import com.dgit.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserDAOTest {
	
	@Autowired
	private UserDAO dao;
	
	@Test
	public void testjoin() throws Exception{
		UserVO vo = new UserVO("test", "둥11");
		/*UserVO vo1 = new UserVO("test2", "둥11");
		dao.joinUser(vo1);*/
		
		/*System.out.println("=========================================="+dao.selectUser().toString());
		
		UserVO vo2 = dao.selectById("test");
		
		System.out.println(vo2.getUser_id());
		System.out.println(dao.selectByNick("둥").toString());
		
		dao.updateUser(vo);
		
		System.out.println(dao.selectById("test").toString());*/
		dao.leaveUser("test1");
		
	}
	

}
