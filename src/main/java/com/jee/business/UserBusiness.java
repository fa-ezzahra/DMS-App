package com.jee.business;

import com.jee.beans.User;

public interface UserBusiness {
	public void addUser(String userEmail, String userPassword, String userName);
	public void deleteUser(String userName);
	public User checkUser(String email, String password);
}
