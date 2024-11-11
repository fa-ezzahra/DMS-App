package com.jee.web;

import java.util.List;

import com.jee.beans.DocumentJ;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteAction extends Action {
	public DeleteAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            String userName = (String) session.getAttribute("userName");
            String fileName = req.getParameter("file-name");

            boolean isDeleted = facade.deleteFile(fileName, userName);

            if (!isDeleted) {
                req.setAttribute("errorMessage", "File not found or could not be deleted.");
                return "errordelete.jsp";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            req.setAttribute("errorMessage", e.getMessage());
            return "errordelete.jsp";
        }
        return "successdelete.jsp";
    }

}
