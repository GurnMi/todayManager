package com.dgit.service;

import java.util.List;

import com.dgit.domain.WebnoteVO;

public interface WebnoteService {
	public List<WebnoteVO> selectById(String user_id);
}
