package com.dgit.service;

import java.util.List;

import com.dgit.domain.TodayVO;

public interface TodayService {
	public void insertToday (TodayVO vo) throws Exception;
	
	public void updateToday (TodayVO vo) throws Exception;
	
	public void deleteToday (TodayVO vo) throws Exception;
	
	public List<TodayVO> selectToday (TodayVO vo) throws Exception;
	public TodayVO selectTodayByNo (int no) throws Exception;
}
