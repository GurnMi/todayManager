package com.dgit.domain;

import java.util.Date;

public class RepeatSubVO {
	private int sub_no;
	private int rep_no;
	private String user_id;
	private Date sub_start;
	private Date sub_end;
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public int getRep_no() {
		return rep_no;
	}
	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getSub_start() {
		return sub_start;
	}
	public void setSub_start(Date sub_start) {
		this.sub_start = sub_start;
	}
	public Date getSub_end() {
		return sub_end;
	}
	public void setSub_end(Date sub_end) {
		this.sub_end = sub_end;
	}
	public RepeatSubVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RepeatSubVO(int sub_no, int rep_no, String user_id, Date sub_start, Date sub_end) {
		super();
		this.sub_no = sub_no;
		this.rep_no = rep_no;
		this.user_id = user_id;
		this.sub_start = sub_start;
		this.sub_end = sub_end;
	}
	@Override
	public String toString() {
		return "RepeatSubVO [sub_no=" + sub_no + ", rep_no=" + rep_no + ", user_id=" + user_id + ", sub_start="
				+ sub_start + ", sub_end=" + sub_end + "]";
	}
	
	
}
