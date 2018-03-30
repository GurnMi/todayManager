package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.UserVO;
import com.dgit.persistence.UserDAOImpl;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAOImpl dao;

	@Override
	public void joinUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.joinUser(vo);
	}

	@Override
	public List<UserVO> selectUser() {
		// TODO Auto-generated method stub
		return dao.selectUser();
	}

	@Override
	public UserVO selectUserById(String userid) {
		// TODO Auto-generated method stub
		return dao.selectById(userid);
	}

	@Override
	public UserVO selectUserByNick(String usernick) {
		// TODO Auto-generated method stub
		return dao.selectByNick(usernick);
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.updateUser(vo);
	}

	@Override
	public void leaveUser(String userid) {
		// TODO Auto-generated method stub
		dao.leaveUser(userid);
	}

}
