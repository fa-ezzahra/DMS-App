package com.jee.web;

import com.jee.beans.User;
import com.jee.business.Facade;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckUserAction extends Action {
    public CheckUserAction(Facade facade) {
        super(facade);
    }

    protected String execute(HttpServletRequest req, HttpServletResponse resp) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            // Validate user credentials
            User user = facade.checkUser(email, password);

            if (user != null) {
                // Set user session and return the view to redirect to
                HttpSession session = req.getSession();
                session.setAttribute("userName", user.getUserName());
                return "user.jsp"; // Redirect to user.jsp
            } else {
                // Set error message and return the login view
                req.setAttribute("errorMessage", "Invalid email or password");
                return "error.jsp"; // Redirect to login.jsp with an error message
            }
        } catch (Exception e) {
        	return (e.getMessage());

        }
    }
}
