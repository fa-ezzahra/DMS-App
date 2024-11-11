package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SearchFilesbyUserAction extends Action {
	public SearchFilesbyUserAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			 HttpSession session = req.getSession();
	         String userName = (String) session.getAttribute("userName");
	         
			String fileDescp = req.getParameter("theme-ou-titre");
			String fileType = req.getParameter("type");
			
			
			
			List<DocumentJ> files= facade.searchFilesbyUser(fileDescp, fileType, userName);
			req.setAttribute("files", files);
            return "rechercherusertheme.jsp"; // Retourne la vue JSP
		   
		} catch (Exception e) {
			 System.out.println(e.getMessage());
	            req.setAttribute("errorMessage", e.getMessage());
	            return "error.jsp";
			
		}
	}

}

