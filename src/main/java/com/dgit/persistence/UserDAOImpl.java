package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String namespace ="com.dgit.mapper.UserMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void joinUser(UserVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".joinUser", vo);
	}

	@Override
	public List<UserVO> selectUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectUser");
	}

	@Override
	public UserVO selectById(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectById", userid);
	}

	@Override
	public UserVO selectByNick(String usernick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectByNick", usernick);
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateUser",vo);
	}

	@Override
	public void leaveUser(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".leaveUser", userid);
	}

}
