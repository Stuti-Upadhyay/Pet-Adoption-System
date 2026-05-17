package com.petadoption.controllers;

import com.petadoption.model.AdoptRequest;
import com.petadoption.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adopt")
public class AdoptionRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static List<AdoptRequest> adoptionRequests = new ArrayList<AdoptRequest>();

    public static List<AdoptRequest> getAdoptionRequests() {
        return adoptionRequests;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String petId = request.getParameter("petId");
        String petName = request.getParameter("petName");

        request.setAttribute("petId", petId);
        request.setAttribute("petName", petName);

        request.getRequestDispatcher("/WEB-INF/pages/adoptRequest.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String email = null;

        if (session != null && session.getAttribute("user") != null) {
            Object sessionUser = session.getAttribute("user");

            if (sessionUser instanceof String) {
                email = (String) sessionUser;
            } else if (sessionUser instanceof User) {
                User user = (User) sessionUser;
                email = user.getEmail();
            }
        }

        if (email == null || email.length() == 0) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String petId = request.getParameter("petId");
        String petName = request.getParameter("petName");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String reason = request.getParameter("reason");

        if (fullName == null || fullName.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || reason == null || reason.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required.");
            request.setAttribute("petId", petId);
            request.setAttribute("petName", petName);

            request.getRequestDispatcher("/WEB-INF/pages/adoptRequest.jsp").forward(request, response);
            return;
        }

        AdoptRequest adoptRequest = new AdoptRequest(
                petId,
                petName,
                fullName,
                email,
                phone,
                reason
        );

        adoptionRequests.add(adoptRequest);

        response.sendRedirect(request.getContextPath() + "/profile");
    }
}