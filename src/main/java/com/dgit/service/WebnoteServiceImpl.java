package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.WebnoteVO;
import com.dgit.persistence.WebnoteDAO;

@Service
public class WebnoteServiceImpl implements WebnoteService {

	@Autowired
	private WebnoteDAO dao;

	@Override
	public List<WebnoteVO> selectById(String user_id) {
		return dao.selectById(user_id);
	}

	@Override
	public WebnoteVO selectByNo(int note_no) {
		return dao.selectByNo(note_no);
	}

	@Override
	public void updateByNo(WebnoteVO vo) {
		dao.updateByNo(vo);
	}

	@Override
	public void deleteByNo(int note_no) {
		dao.deleteByNo(note_no);
	}

	@Override
	public void insertWebnote(WebnoteVO vo) {
		dao.insertWebnote(vo);
	}

}
