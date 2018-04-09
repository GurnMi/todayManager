package com.dgit.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dgit.domain.UserVO;

public class DayUtil {

	
	public static UserVO getUser(HttpServletRequest req){
		HttpSession session=req.getSession();
		UserVO uservo = (UserVO) session.getAttribute("user");
		return uservo;
	}
	
	public static Date StringChangeDate(String today) throws ParseException{
		Date start_date = new Date();
		
		if(today!=""&&today!=null){
			start_date = new SimpleDateFormat("yyyy-MM-dd").parse(today);
		}
		return start_date;
	}
	
	private static String[] dayArr = {"일","월","화","수","목","금","토"};
	
}
