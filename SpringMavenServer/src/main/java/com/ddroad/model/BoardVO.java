package com.ddroad.model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class BoardVO {
	private String id;
	private String title;
	private String writer;
	private String nickname;
	private String contents;
	private String imgBase64;
	private int like;
	private int hit;
	private Timestamp regdt;
	private String strRegDt;

	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImgBase64() {
		return imgBase64;
	}
	public void setImgBase64(String imgBase64) {
		this.imgBase64 = imgBase64;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getRegdt() {
		return regdt;
	}
	public void setRegdt(Timestamp regdt) {
		this.regdt = regdt;
	}
	public String getStrRegDt() {
		Date date = new Date((long)this.regdt.getTime());
		DateFormat f = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return f.format(date);	
	}
	
	public void setStrRegDt(String strRegDt) {
		this.strRegDt = "fuckyou";
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardVO [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", writer=");
		builder.append(writer);
		builder.append(", nickname=");
		builder.append(nickname);
		builder.append(", contents=");
		builder.append(contents);
		builder.append(", imgBase64=");
		builder.append(imgBase64);
		builder.append(", like=");
		builder.append(like);
		builder.append(", hit=");
		builder.append(hit);
		builder.append(", regdt=");
		builder.append(regdt);
		builder.append(", strRegDt=");
		builder.append(strRegDt);
		builder.append(", getWriter()=");
		builder.append(getWriter());
		builder.append(", getId()=");
		builder.append(getId());
		builder.append(", getTitle()=");
		builder.append(getTitle());
		builder.append(", getContents()=");
		builder.append(getContents());
		builder.append(", getImg()=");
		builder.append(getImgBase64());
		builder.append(", getNickname()=");
		builder.append(getNickname());
		builder.append(", getLike()=");
		builder.append(getLike());
		builder.append(", getHit()=");
		builder.append(getHit());
		builder.append(", getRegdt()=");
		builder.append(getRegdt());
		builder.append(", getStrRegDt()=");
		builder.append(getStrRegDt());
		builder.append(", getClass()=");
		builder.append(getClass());
		builder.append(", hashCode()=");
		builder.append(hashCode());
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}

	
}
