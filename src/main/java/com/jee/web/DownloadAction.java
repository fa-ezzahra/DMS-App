package com.jee.web;

import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DownloadAction extends Action {

	public DownloadAction(Facade facade) {
		super(facade);
	}
	String execute(HttpServletRequest req, HttpServletResponse resp) {
		String fp=req.getParameter("filePath");
		facade.downloadDoc(fp);
		return "/views/success.jsp";
	}
}
