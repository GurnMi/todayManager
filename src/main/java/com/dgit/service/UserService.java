package com.dgit.service;

import java.util.List;

import com.dgit.domain.UserVO;

public interface UserService {
	
public void joinUser(UserVO vo);
	
	public List<UserVO> selectUser();
	
	public UserVO selectUserById(String userid);
	public UserVO selectUserByNick(String usernick);
	
	public void updateUser(UserVO vo);
	public void leaveUser(String userid);

}
