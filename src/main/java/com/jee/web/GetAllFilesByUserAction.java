package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetAllFilesByUserAction extends Action {
	public GetAllFilesByUserAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			 HttpSession session = req.getSession();
	         String userName = (String) session.getAttribute("userName");
	         
            List<DocumentJ> files = facade.getAllFilesByUser(userName);
            req.setAttribute("files", files);
            return "rechercheruser1.jsp"; // Retourne la vue JSP
        } catch (Exception e) {
            System.out.println(e.getMessage());
            req.setAttribute("errorMessage", e.getMessage());
            return "error.jsp";
        }
	}

}
