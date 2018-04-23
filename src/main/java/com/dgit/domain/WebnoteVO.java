package com.dgit.domain;

import java.util.Date;

public class WebnoteVO {
	private int note_no;
	private String user_id;
	private Date note_date;
	private String note_content;

	public WebnoteVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WebnoteVO(int note_no, String user_id, Date note_date, String note_content) {
		super();
		this.note_no = note_no;
		this.user_id = user_id;
		this.note_date = note_date;
		this.note_content = note_content;
	}

	public int getNote_no() {
		return note_no;
	}

	public void setNote_no(int note_no) {
		this.note_no = note_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getNote_date() {
		return note_date;
	}

	public void setNote_date(Date note_date) {
		this.note_date = note_date;
	}

	public String getNote_content() {
		return note_content;
	}

	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}

	@Override
	public String toString() {
		return "WebnoteVO [note_no=" + note_no + ", user_id=" + user_id + ", note_date=" + note_date + ", note_content="
				+ note_content + "]";
	}	
}
