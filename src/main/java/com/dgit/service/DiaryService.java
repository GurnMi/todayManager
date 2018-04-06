package com.dgit.service;

import java.util.List;

import com.dgit.domain.DiaryVO;

public interface DiaryService {
	public void insertDiary (DiaryVO vo) throws Exception;
	
	public void updateDiary (DiaryVO vo) throws Exception;
	
	public void deleteDiary (DiaryVO vo) throws Exception;
	
	public List<DiaryVO> selectDiary (DiaryVO vo) throws Exception;
	public DiaryVO selectDiaryByNo (int no) throws Exception;
}
