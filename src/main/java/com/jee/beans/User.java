package com.jee.beans;

public class User {
	private String useremail;
	private String userpassword;
	private String userName;
	
	
	public User(String useremail, String userpassword, String userName) {
		super();
		this.useremail = useremail;
		this.userpassword = userpassword;
		this.userName = userName;
		
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "User [useremail=" + useremail + ", userpassword=" + userpassword + ", userName=" + userName + "]";
	}
	
	
	}
	
	


