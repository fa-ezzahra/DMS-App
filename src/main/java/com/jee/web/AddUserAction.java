package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddUserAction extends Action {
	public AddUserAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String userEmail = req.getParameter("userEmail");
			String userPassword = req.getParameter("userPassword");
			String userName = req.getParameter("userName");
			
			 facade.addUser(userEmail, userPassword, userName);
		   
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "connection.html";
	}

}
