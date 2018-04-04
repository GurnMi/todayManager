package com.dgit.service;

import java.util.List;

import com.dgit.domain.RepeatVO;

public interface RepeatService {
	public void insertRepeat (RepeatVO vo) throws Exception;
	
	public void updateRepeat (RepeatVO vo) throws Exception;
	
	public void deleteRepeat (RepeatVO vo) throws Exception;
	
	public List<RepeatVO> selectRepeat (RepeatVO vo) throws Exception;
	public RepeatVO selectRepeatByNo (int no) throws Exception;
}
