package com.petadoption.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.petadoption.model.Pet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// TEMP STORAGE (NO DATABASE)
	private static List<Pet> petList = new ArrayList<>();
	private static int idCounter = 1;

	public DashboardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String action = request.getParameter("action");

		// DELETE
		if ("delete".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));

			petList.removeIf(p -> p.getId() == id);
		}

		// EDIT LOAD
		if ("edit".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));

			for (Pet p : petList) {
				if (p.getId() == id) {
					request.setAttribute("editPet", p);
					break;
				}
			}
		}

		request.setAttribute("pets", petList);

		request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp")
		       .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("petName");
		String type = request.getParameter("petType");
		String breed = request.getParameter("petBreed");
		String age = request.getParameter("petAge");

		// UPDATE
		if (id != null && !id.isEmpty()) {

			int petId = Integer.parseInt(id);

			for (Pet p : petList) {
				if (p.getId() == petId) {
					p.setName(name);
					p.setType(type);
					p.setBreed(breed);
					p.setAge(age);
					break;
				}
			}

		} else {
			// ADD
			Pet p = new Pet();
			p.setId(idCounter++);
			p.setName(name);
			p.setType(type);
			p.setBreed(breed);
			p.setAge(age);

			petList.add(p);
		}

		response.sendRedirect("dashboard");
	}
}