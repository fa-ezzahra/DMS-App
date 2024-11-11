package com.jee.web;

import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UploadAction extends Action {
    public UploadAction(Facade facade) {
        super(facade);
    }

    String execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // Correct parameter names
            String fileUser = req.getParameter("file-user");
            String fileDescp = req.getParameter("file-description");
            String filePath = req.getParameter("file-path");

            // Call the facade to upload the file
            facade.uploadFile(filePath, fileDescp, fileUser);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "successajout.jsp";
    }
}
