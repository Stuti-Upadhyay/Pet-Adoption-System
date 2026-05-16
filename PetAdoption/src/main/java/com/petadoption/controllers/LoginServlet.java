package com.petadoption.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.petadoption.config.DBConfig;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    // 1. Check if fields are empty
	    if(email == null || email.isEmpty() || password == null || password.isEmpty()) {
	        request.setAttribute("error", "All fields are required!");
	        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	        return;
	    }

	    try {
	        Connection conn = DBConfig.getConnection();

	        // 2. Check if email exists
	        String sqlEmail = "SELECT * FROM users WHERE email=?";
	        PreparedStatement psEmail = conn.prepareStatement(sqlEmail);
	        psEmail.setString(1, email);
	        ResultSet rsEmail = psEmail.executeQuery();

	        if(!rsEmail.next()) {
	            request.setAttribute("error", "Email does not exist");
	            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	            return;
	        }

	        // 3. Check if password matches
	        String dbPassword = rsEmail.getString("password");
	        if(!dbPassword.equals(password)) {
	            request.setAttribute("error", "Password is incorrect");
	            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	            return;
	        }

	        // 4. Successful login
	        HttpSession session = request.getSession();
	        session.setAttribute("user", email);
	        response.sendRedirect(request.getContextPath() + "/home");

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Something went wrong");
	        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	    }
	} }