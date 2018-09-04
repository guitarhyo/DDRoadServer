package com.ddroad.model;


public class UserVO {
	
	private String id;
	private String email;
	private String nickname;
	private	String gender;
	private String age;
	private String accessToken;
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserVO [id=");
		builder.append(id);
		builder.append(", email=");
		builder.append(email);
		builder.append(", nickname=");
		builder.append(nickname);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", age=");
		builder.append(age);
		builder.append(", accessToken=");
		builder.append(accessToken);
		builder.append(", name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}
	

	
	
}
