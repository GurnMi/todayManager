package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.DiaryVO;

public interface DiaryDAO {
	public void insert (DiaryVO vo) throws Exception;
	
	public void update (DiaryVO vo) throws Exception;
	
	public void delete (DiaryVO vo) throws Exception;
	
	public List<DiaryVO> select (DiaryVO vo) throws Exception;
	public DiaryVO selectNo (int no) throws Exception;
}
