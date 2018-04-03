package com.dgit.domain;

import java.util.Date;

public class RepeatVO {
	private int rep_no;
	private String user_id;
	private String rep_type;
	private String rep_title;
	private Date rep_day;
	private Date rep_start;
	private Date rep_end;

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

	public String getRep_type() {
		return rep_type;
	}

	public void setRep_type(String rep_type) {
		this.rep_type = rep_type;
	}

	public String getRep_title() {
		return rep_title;
	}

	public void setRep_title(String rep_title) {
		this.rep_title = rep_title;
	}

	public Date getRep_day() {
		return rep_day;
	}

	public void setRep_day(Date rep_day) {
		this.rep_day = rep_day;
	}

	public Date getRep_start() {
		return rep_start;
	}

	public void setRep_start(Date rep_start) {
		this.rep_start = rep_start;
	}

	public Date getRep_end() {
		return rep_end;
	}

	public void setRep_end(Date rep_end) {
		this.rep_end = rep_end;
	}

	public RepeatVO(int rep_no, String user_id, String rep_type, String rep_title, Date rep_day, Date rep_start,
			Date rep_end) {
		super();
		this.rep_no = rep_no;
		this.user_id = user_id;
		this.rep_type = rep_type;
		this.rep_title = rep_title;
		this.rep_day = rep_day;
		this.rep_start = rep_start;
		this.rep_end = rep_end;
	}

	public RepeatVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "RepeatVO [rep_no=" + rep_no + ", user_id=" + user_id + ", rep_type=" + rep_type + ", rep_title="
				+ rep_title + ", rep_day=" + rep_day + ", rep_start=" + rep_start + ", rep_end=" + rep_end + "]";
	}

}
