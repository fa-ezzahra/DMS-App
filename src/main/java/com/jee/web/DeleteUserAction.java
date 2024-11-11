package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteUserAction extends Action {
	public DeleteUserAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String action =req.getParameter("action1");
			if("Supprimer".equals(action)) {
				String userName = req.getParameter("userName");
				
				 facade.deleteUser(userName);
				 System.out.println(">>>>>>>> user supprime");
				
			}
			
		   
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "/views/deleteuser.html";
	}
}
