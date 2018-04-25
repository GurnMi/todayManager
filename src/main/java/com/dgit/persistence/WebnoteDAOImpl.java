package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.WebnoteVO;

@Repository
public class WebnoteDAOImpl implements WebnoteDAO {

	private static final String namespace = "com.dgit.mapper.WebnoteMapper.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<WebnoteVO> selectById(String user_id) {
		return sqlSession.selectList(namespace + "selectById", user_id);
	}

	@Override
	public WebnoteVO selectByNo(int note_no) {
		return sqlSession.selectOne(namespace + "selectByNo", note_no);
	}

	@Override
	public void updateByNo(WebnoteVO vo) {
		sqlSession.update(namespace + "updateByNo", vo);
	}

	@Override
	public void deleteByNo(int note_no) {
		sqlSession.delete(namespace + "deleteByNo", note_no);
	}

	@Override
	public void insertWebnote(WebnoteVO vo) {
		sqlSession.insert(namespace + "insertWebnote", vo);
	}

}
