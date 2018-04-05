package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.RepeatVO;

@Repository
public class RepeatDAOImpl implements RepeatDAO {

	private static final String namespace ="com.dgit.mapper.RepeatMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insert",vo);
	}

	@Override
	public void update(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",vo);
	}

	@Override
	public List<RepeatVO> select(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".select",vo);
	}

	@Override
	public RepeatVO selectNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectNo",no);
	}

	@Override
	public List<RepeatVO> RepeatTest(RepeatVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".RepeatTest",vo);
	}

}
