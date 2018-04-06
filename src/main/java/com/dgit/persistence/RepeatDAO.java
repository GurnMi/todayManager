package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.RepeatVO;

public interface RepeatDAO {
	public void insert (RepeatVO vo) throws Exception;
	
	public void update (RepeatVO vo) throws Exception;
	
	public void delete (RepeatVO vo) throws Exception;
	
	public List<RepeatVO> select (RepeatVO vo) throws Exception;
	public List<RepeatVO> RepeatTest (RepeatVO vo) throws Exception;
	
	public RepeatVO selectNo (int no) throws Exception;
}
