package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.WebnoteVO;

public interface WebnoteDAO {
	public List<WebnoteVO> selectById(String user_id);	
}
