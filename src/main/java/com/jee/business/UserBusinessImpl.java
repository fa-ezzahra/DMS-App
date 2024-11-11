package com.jee.business;

import com.jee.beans.User;
import com.jee.dao.UserDao;
import com.jee.dao.UserDaoImpl;

public class UserBusinessImpl implements UserBusiness{
private UserDao dao;
	

	public UserBusinessImpl() {
	}


	public UserBusinessImpl(UserDao dao) {
		this.dao = dao;
	}
	public void addUser(String userEmail, String userPassword, String userName) {
		dao.addUser(userEmail, userPassword, userName);
	}
	
	public void deleteUser(String userName) {
		dao.deleteUser(userName);
	}
	
	 public User checkUser(String email, String password) {
		return dao.checkUser(email, password);
	 }
	

}
