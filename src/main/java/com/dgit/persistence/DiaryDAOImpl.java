package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.DiaryVO;
import com.dgit.domain.TodayVO;

@Repository
public class DiaryDAOImpl implements DiaryDAO {

	private static final String namespace ="com.dgit.mapper.DiaryMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insert",vo);
	}

	@Override
	public void update(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",vo);
	}

	@Override
	public List<DiaryVO> select(DiaryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".select",vo);
	}

	@Override
	public DiaryVO selectNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectNo",no);
	}

}
