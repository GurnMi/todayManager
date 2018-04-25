package com.dgit.service;

import java.util.List;

import com.dgit.domain.WebnoteVO;

public interface WebnoteService {
	public List<WebnoteVO> selectById(String user_id);
	public WebnoteVO selectByNo(int note_no);
	public void updateByNo(WebnoteVO vo);
	public void deleteByNo(int note_no);
	public void insertWebnote(WebnoteVO vo);
}
