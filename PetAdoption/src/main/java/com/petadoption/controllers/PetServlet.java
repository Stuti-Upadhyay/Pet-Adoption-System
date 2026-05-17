package com.petadoption.controllers;

import com.petadoption.config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/pet")
public class PetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Route GET back to Dashboard safely
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    // Unify all mutations under POST (Add, Update, Delete)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String formAction = request.getParameter("formAction"); // Renamed parameter to avoid collision
        String id = request.getParameter("id");

        try {
            if ("delete".equals(formAction) && id != null) {
                deletePet(id);
            } else {
                String name = request.getParameter("petName");
                String type = request.getParameter("petType");
                String breed = request.getParameter("petBreed");
                String age = request.getParameter("petAge");
                String location = request.getParameter("petLocation");
                String description = request.getParameter("petDescription");

                if (id != null && !id.isEmpty()) {
                    updatePet(id, name, type, breed, age, location, description);
                } else {
                    addPet(name, type, breed, age, location, description);
                }
            }
            // Always redirect to the Servlet mapping, NEVER the raw JSP view
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } catch(Exception e) { 
            e.printStackTrace(); 
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
    }

    private void addPet(String name, String type, String breed, String age, String location, String description) throws Exception {
        try(Connection conn = DBConfig.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO pets (name,type,breed,age,location,description) VALUES (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setString(3, breed);
            ps.setString(4, age);
            ps.setString(5, location);
            ps.setString(6, description);
            ps.executeUpdate();
        }
    }

    private void updatePet(String id, String name, String type, String breed, String age, String location, String description) throws Exception {
        try(Connection conn = DBConfig.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE pets SET name=?, type=?, breed=?, age=?, location=?, description=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, type);
            ps.setString(3, breed);
            ps.setString(4, age);
            ps.setString(5, location);
            ps.setString(6, description);
            ps.setInt(7, Integer.parseInt(id));
            ps.executeUpdate();
        }
    }

    private void deletePet(String id) throws Exception {
        try(Connection conn = DBConfig.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM pets WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        }
    }
}