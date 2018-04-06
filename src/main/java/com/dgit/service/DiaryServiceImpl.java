package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.DiaryVO;
import com.dgit.persistence.DiaryDAOImpl;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDAOImpl dao;
	
	@Override
	public void insertDiary(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void updateDiary(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		DiaryVO vo1 = dao.selectNo(vo.getDia_no());
		if(vo.getDiary_title()==null){
			vo.setDiary_title(vo1.getDiary_title());
		}
		if(vo.getDiary_content()==null){
			vo.setDiary_content(vo1.getDiary_content());
		}
		if(vo.getDiary_day()==null){
			vo.setDiary_day(vo1.getDiary_day());
		}
		if(vo.getDiary_mark()==0){
			vo.setDiary_mark(vo1.getDiary_mark());
		}
		dao.update(vo);		
	}

	@Override
	public void deleteDiary(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public List<DiaryVO> selectDiary(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}

	@Override
	public DiaryVO selectDiaryByNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectNo(no);
	}

}
