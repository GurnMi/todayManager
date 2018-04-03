package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.TodayVO;

@Repository
public class TodayDAOImpl implements TodayDAO {

	private static final String namespace ="com.dgit.mapper.TodayMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insert",vo);
	}

	@Override
	public void update(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",vo);
	}

	@Override
	public List<TodayVO> select(TodayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".select",vo);
	}

	@Override
	public TodayVO selectNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectNo",no);
	}

}
