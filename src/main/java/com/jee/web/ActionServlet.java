package com.jee.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.jee.business.Facade;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Facade facade;
	private Map<String, Action> actions;


	public void init() throws ServletException {
		facade = new Facade();
		actions = new HashMap<>();
		actions.put("adduser", new AddUserAction(facade));
		actions.put("deletefile",new DeleteAction(facade));
		actions.put("deleteuser",new DeleteUserAction(facade));
		actions.put("getallfilesbyuser",new GetAllFilesByUserAction(facade));
		actions.put("searchfiles",new SearchFilesAction(facade));
		actions.put("searchfilesbyuser",new SearchFilesbyUserAction(facade));
		actions.put("upload",new UploadAction(facade));
		actions.put("connexion",new CheckUserAction(facade));
		actions.put("downloadDoc", new DownloadAction(facade));
		
		actions.put("delete",new DeleteFileByPathAction(facade));
		actions.put("deleteuser",new DeleteUserAction(facade));
		actions.put("getallfilesbyuser",new GetAllFilesAction(facade));
		
		
	}


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int x = uri.lastIndexOf('/');
		int y = uri.lastIndexOf(".do");
		String key = uri.substring(x+1, y);
		System.out.println("Key : " + key);
		Action action = actions.get(key);
		System.out.println("Action : " + action.getClass().getSimpleName());
		String view = action.execute(req, resp);
		req.getRequestDispatcher(view).forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
