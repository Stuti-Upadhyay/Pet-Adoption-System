package com.petadoption.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.petadoption.model.Pet;

@WebServlet("/browse")
public class BrowseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BrowseServlet() { super(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Create hardcoded pets (Model)
        List<Pet> pets = createPetList();

        // Step 2: Get filter parameters
        String search = request.getParameter("search");
        String species = request.getParameter("species");
       

        // Step 3: Filter pets
        List<Pet> filteredPets = new ArrayList<>();
        for (Pet pet : pets) {
            boolean matches = true;

            if (search != null && !search.isEmpty() && !pet.getName().toLowerCase().contains(search.toLowerCase())) {
                matches = false;
            }
            if (species != null && !species.equals("all") && !pet.getType().equalsIgnoreCase(species)) {
                matches = false;
            }
            

            if (matches) filteredPets.add(pet);
        }

        // Step 4: Pass filtered pets to view
        request.setAttribute("pets", filteredPets);
        request.getRequestDispatcher("/WEB-INF/pages/browse.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private List<Pet> createPetList() {
        List<Pet> pets = new ArrayList<>();
        pets.add(createPet(1, "Luna", "Dog", "Golden Retriever", "1 year"));
        pets.add(createPet(2, "Oliver", "Cat", "Domestic Shorthair", "2 years"));
        pets.add(createPet(3, "Milo", "Dog", "Border Collie", "3 years"));
        pets.add(createPet(4, "Cleo", "Cat", "Ragdoll", "5 years"));
        pets.add(createPet(5, "Rocky", "Dog", "German Shepherd", "4 years"));
        pets.add(createPet(6, "Bella", "Cat", "Siamese", "2 years"));
        pets.add(createPet(7, "Charlie", "Dog", "Beagle", "1 year"));
        
        return pets;
    }

    private Pet createPet(int id, String name, String type, String breed, String age) {
        Pet pet = new Pet();
        pet.setId(id);
        pet.setName(name);
        pet.setType(type);
        pet.setBreed(breed);
        pet.setAge(age);
        return pet;
    }
}