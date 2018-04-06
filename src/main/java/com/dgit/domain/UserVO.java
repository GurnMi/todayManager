package com.dgit.domain;

public class UserVO {
	private String user_id;
	private String user_nick;

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_nick=" + user_nick + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public UserVO(String user_id, String user_nick) {
		super();
		this.user_id = user_id;
		this.user_nick = user_nick;
	}

	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
