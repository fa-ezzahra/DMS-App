package com.jee.dao;

import com.jee.beans.User;

public interface UserDao {
	public void addUser(String userEmail, String userPassword, String userName);
	public void deleteUser(String userName);
	 public User checkUser(String email, String password);
}
