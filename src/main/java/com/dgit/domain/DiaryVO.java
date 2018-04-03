package com.dgit.domain;

import java.util.Date;

public class DiaryVO {
	private int dia_no;
	private String user_id;
	private String diary_title;
	private String diary_content;
	private Date diary_day;
	private int diary_mark;

	public int getDia_no() {
		return dia_no;
	}

	public void setDia_no(int dia_no) {
		this.dia_no = dia_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDiary_title() {
		return diary_title;
	}

	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public Date getDiary_day() {
		return diary_day;
	}

	public void setDiary_day(Date diary_day) {
		this.diary_day = diary_day;
	}

	public int getDiary_mark() {
		return diary_mark;
	}

	public void setDiary_mark(int diary_mark) {
		this.diary_mark = diary_mark;
	}

	@Override
	public String toString() {
		return "DiaryVO [dia_no=" + dia_no + ", user_id=" + user_id + ", diary_title=" + diary_title
				+ ", diary_content=" + diary_content + ", diary_day=" + diary_day + ", diary_mark=" + diary_mark + "]";
	}

	public DiaryVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DiaryVO(int dia_no, String user_id, String diary_title, String diary_content, Date diary_day,
			int diary_mark) {
		super();
		this.dia_no = dia_no;
		this.user_id = user_id;
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.diary_day = diary_day;
		this.diary_mark = diary_mark;
	}

}
