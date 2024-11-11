package com.jee.web;

import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteFileByPathAction extends Action {
	
	public  DeleteFileByPathAction(Facade facade) {
		super(facade);
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) {
	    try {
	        String filePathToDelete = req.getParameter("filePathToDelete");
	        String action = req.getParameter("action");
	        
	        if ("deleteForever".equals(action)) {
	            facade.deleteFileByPath(filePathToDelete);
	            // Si l'action est "deleteForever", renvoyer vers la page "delete.html"            
	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    
	    // Renvoyez null pour indiquer qu'aucune redirection n'est nécessaire pour d'autres actions ou en cas d'erreur
	    return "/views/admindelete.html";
	
	    }
}
