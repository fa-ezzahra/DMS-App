package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetAllFilesAction extends Action{

	public  GetAllFilesAction(Facade facade) {
		super(facade);
	}
	
	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			
			//String userName = req.getParameter("userName");
		String action =req.getParameter("action");
		System.out.println(">>>>>>>>>>ici");
		if ("se connecter".equals(action)) {
			//List<DocumentJ>dl=facade.getAllFilesByUser("hala");
			List<DocumentJ>dl=facade.getAllFiles();
			req.setAttribute("dl", dl);
		   
			
		}
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "/views/getallfilesbyuser.jsp";
	}
}
