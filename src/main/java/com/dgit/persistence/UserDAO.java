package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.UserVO;

public interface UserDAO {
	
	public void joinUser(UserVO vo);
	
	public List<UserVO> selectUser();
	
	public UserVO selectById(String userid);
	public UserVO selectByNick(String usernick);
	
	public void updateUser(UserVO vo);
	public void leaveUser(String userid);
	
}
