package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.TodayVO;

public interface TodayDAO {
	
	public void insert (TodayVO vo) throws Exception;
	
	public void update (TodayVO vo) throws Exception;
	
	public void delete (TodayVO vo) throws Exception;
	
	public List<TodayVO> select (TodayVO vo) throws Exception;
	public List<TodayVO> repeatTest (TodayVO vo) throws Exception;
	
	public TodayVO selectNo (int no) throws Exception;
	
}
