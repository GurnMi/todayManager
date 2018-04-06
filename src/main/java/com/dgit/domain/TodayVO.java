package com.dgit.domain;

import java.util.Date;

public class TodayVO {
	
	private int pri_no;
	private String user_id;
	private Date start_date;
	private Date end_date;
	private String plan_type;
	private String plan_content;
	private String plan_title;
	
	
	
	public int getPri_no() {
		return pri_no;
	}



	public void setPri_no(int pri_no) {
		this.pri_no = pri_no;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public Date getStart_date() {
		return start_date;
	}



	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}



	public Date getEnd_date() {
		return end_date;
	}



	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}



	public String getPlan_type() {
		return plan_type;
	}



	public void setPlan_type(String plan_type) {
		this.plan_type = plan_type;
	}



	public String getPlan_content() {
		return plan_content;
	}



	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}



	public String getPlan_title() {
		return plan_title;
	}



	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}



	@Override
	public String toString() {
		return "TodayVO [pri_no=" + pri_no + ", user_id=" + user_id + ", start_date=" + start_date + ", end_date="
				+ end_date + ", plan_type=" + plan_type + ", plan_content=" + plan_content + ", plan_title="
				+ plan_title + "]";
	}



	public TodayVO(int pri_no, String user_id, Date start_date, Date end_date, String plan_type, String plan_content,
			String plan_title) {
		super();
		this.pri_no = pri_no;
		this.user_id = user_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.plan_type = plan_type;
		this.plan_content = plan_content;
		this.plan_title = plan_title;
	}



	public TodayVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
