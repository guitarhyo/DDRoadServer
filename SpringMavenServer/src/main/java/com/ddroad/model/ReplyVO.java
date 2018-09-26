package com.ddroad.model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyVO {
	private String b_id;
	private String r_id;
	private String regId;
	private String nickname;
	private String contents;
	private Timestamp regDate;
	private String strRegDate;
	
	public String getStrRegDate() {
		Date date = new Date((long)this.regDate.getTime());
		DateFormat f = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return f.format(date);
	}
	public String getB_id() {
		return b_id;
	}
	
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public void setStrRegDate(String strRegDate) {
		this.strRegDate = strRegDate;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReplyVO [b_id=");
		builder.append(b_id);
		builder.append(", r_id=");
		builder.append(r_id);
		builder.append(", regId=");
		builder.append(regId);
		builder.append(", nickname=");
		builder.append(nickname);
		builder.append(", contents=");
		builder.append(contents);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append(", strRegDate=");
		builder.append(strRegDate);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
