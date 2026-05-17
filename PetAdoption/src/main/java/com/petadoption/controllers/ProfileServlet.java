package com.petadoption.controllers;

import com.petadoption.config.DBConfig;
import com.petadoption.model.AdoptRequest;
import com.petadoption.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 1. FIXED: Extract the full User object from the session instead of a String
        User sessionUser = (User) session.getAttribute("user");
        
        // 2. Extract the email string out of that object safely
        String email = sessionUser.getEmail();

        // Fetch full User from DB (Keeping this to refresh data, or you can use sessionUser directly)
        User user = null;

        try {
            Connection conn = DBConfig.getConnection();
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Pass via request only — do NOT touch session
        request.setAttribute("user", user);

        // Filter adoption requests
        List<AdoptRequest> allRequests = AdoptionRequestServlet.getAdoptionRequests();
        List<AdoptRequest> myRequests = new ArrayList<AdoptRequest>();

        for (AdoptRequest ar : allRequests) {
            if (ar.getEmail() != null && ar.getEmail().equalsIgnoreCase(email)) {
                myRequests.add(ar);
            }
        }

        request.setAttribute("myRequests", myRequests);
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }
}