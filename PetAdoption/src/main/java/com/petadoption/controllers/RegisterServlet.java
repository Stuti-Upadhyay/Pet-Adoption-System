package com.petadoption.controllers;

import jakarta.servlet.ServletException;
import com.petadoption.config.DBConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String password = request.getParameter("password");

	    if(name == null || name.isEmpty() ||
	       email == null || email.isEmpty() ||
	       phone == null || phone.isEmpty() ||
	       password == null || password.isEmpty()) {

	        request.setAttribute("error", "All fields are required!");
	        request.getRequestDispatcher("/WEB-INF/pages/register.jsp")
	               .forward(request, response);
	        return;
	    }
	    try {
            Connection conn = DBConfig.getConnection();

            //  Check duplicate email
            String checkSql = "SELECT * FROM users WHERE email=?";
            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setString(1, email);

            ResultSet rs = checkPs.executeQuery();

            	if (rs.next()) {
            	    request.setAttribute("error", "Email already exists!");
            	    request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            	    return;
            	}
            

            //  Insert into DB
            String sql = "INSERT INTO users (name, email, phone, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);

            ps.executeUpdate();

            HttpSession session = request.getSession();
            session.setAttribute("success", "Registration successful!");
            response.sendRedirect("login");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp")
                   .forward(request, response);
        }

	}

}
