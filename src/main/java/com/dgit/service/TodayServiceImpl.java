package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.TodayVO;
import com.dgit.persistence.TodayDAO;


@Service
public class TodayServiceImpl implements TodayService {

	@Autowired
	private TodayDAO dao;
	
	
	@Override
	public void insertToday(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void updateToday(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		TodayVO vo1 = dao.selectNo(vo.getPri_no());
		
		if(vo.getStart_date()==null){
			vo.setStart_date(vo1.getStart_date());
		}
		if(vo.getEnd_date()==null){
			vo.setEnd_date(vo1.getEnd_date());
		}
		if(vo.getPlan_type()==null){
			vo.setPlan_type(vo1.getPlan_type());
		}
		if(vo.getPlan_title()==null){
			vo.setPlan_title(vo1.getPlan_title());
		}
		if(vo.getPlan_content()==null){
			vo.setPlan_content(vo1.getPlan_content());
		}
		
		dao.update(vo);
	}

	@Override
	public void deleteToday(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public List<TodayVO> selectToday(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}

	@Override
	public TodayVO selectTodayByNo (int no) throws Exception{
		return dao.selectNo(no);  
	}
}
