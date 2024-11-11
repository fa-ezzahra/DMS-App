package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchFilesAction extends Action {
	public SearchFilesAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
	
			String theme=req.getParameter("theme-ou-titre");
			String type=req.getParameter("type");
			List<DocumentJ> l = facade.searchFiles(theme, type);
			req.setAttribute("l", l);
			return "/views/chercherDocs.jsp";
		   
		
	}

}

