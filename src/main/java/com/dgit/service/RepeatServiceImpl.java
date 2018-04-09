package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.RepeatVO;
import com.dgit.persistence.RepeatDAO;

@Service
public class RepeatServiceImpl implements RepeatService{

	@Autowired
	private RepeatDAO dao;
	
	@Override
	public void insertRepeat(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void updateRepeat(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		RepeatVO vo1 = dao.selectNo(vo.getRep_no());
		
		if(vo.getRep_type()==null){
			vo.setRep_type(vo1.getRep_type());
		}
		if(vo.getRep_title()==null){
			vo.setRep_title(vo1.getRep_title());
		}
		if(vo.getRep_day()==null){
			vo.setRep_day(vo1.getRep_day());
		}
		if(vo.getRep_start()==null){
			vo.setRep_start(vo1.getRep_start());
		}
		if(vo.getRep_end()==null){
			vo.setRep_end(vo1.getRep_end());
		}
		
		dao.update(vo);
	}

	@Override
	public void deleteRepeat(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public List<RepeatVO> selectRepeat(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}

	@Override
	public RepeatVO selectRepeatByNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectNo(no);
	}

	@Override
	public List<RepeatVO> RepeatTest(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.RepeatTest(vo);
	}

	
	
}
