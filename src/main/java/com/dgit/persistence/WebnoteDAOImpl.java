package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.WebnoteVO;

@Repository
public class WebnoteDAOImpl implements WebnoteDAO{
	
	private static final String namespace ="com.dgit.mapper.WebnoteMapper.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<WebnoteVO> selectById(String user_id) {
		return sqlSession.selectList(namespace+"selectById", user_id);
	}
}
