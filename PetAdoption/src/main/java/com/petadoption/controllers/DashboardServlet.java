package com.petadoption.controllers;

import com.petadoption.config.DBConfig;
import com.petadoption.model.Pet;
import com.petadoption.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Pet> pets = new ArrayList<>();
        List<User> users = new ArrayList<>();

        // 1. Fetch Pets Data
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM pets");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                pets.add(new Pet(
                    rs.getInt("id"), rs.getString("name"), rs.getString("type"),
                    rs.getString("breed"), rs.getString("age"), 
                    rs.getString("location"), rs.getString("description")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }

        // 2. Fetch Users Data
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT id, name, email, role FROM users");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (Exception e) { e.printStackTrace(); }

        // Set attributes and forward safely
        request.setAttribute("pets", pets);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(request, response);
    }
}