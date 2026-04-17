<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.petadoption.model.Pet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">

</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="nav-brand">PetAdoption</div>

    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/home">Home</a>
        <a class="active">Admin</a>
    </div>

    <div class="nav-user">
        <span>Admin</span>
        <a href="<%= request.getContextPath() %>/login" class="logout-btn">Logout</a>
    </div>
</nav>

<!-- MAIN -->
<div class="admin-main">

    <div class="admin-header">
        <h2>Admin Dashboard</h2>
        <p>Manage pets and adoption records</p>
    </div>

    <!-- STATS -->
    <div class="stats-row">
        <div class="stat-card">
            <p>Total Pets</p>
            <h3>24</h3>
        </div>

        <div class="stat-card">
            <p>Available</p>
            <h3>18</h3>
        </div>

        <div class="stat-card">
            <p>Pending</p>
            <h3>4</h3>
        </div>

        <div class="stat-card">
            <p>Adopted</p>
            <h3>2</h3>
        </div>
    </div>

    <!-- ADD / EDIT PET -->
    <div class="admin-section">
        <h3>Add / Edit Pet</h3>

        <%
        Pet editPet = (Pet) request.getAttribute("editPet");
        %>

        <form action="<%= request.getContextPath() %>/dashboard" method="post">

            <!-- Hidden ID for edit -->
            <input type="hidden" name="id"
                value="<%= (editPet != null) ? editPet.getId() : "" %>">

            <div class="form-row">
                <input type="text" name="petName" placeholder="Pet Name"
                value="<%= (editPet != null) ? editPet.getName() : "" %>" required>

                <select name="petType" required>
                    <option value="">Type</option>
                    <option value="dog" <%= (editPet != null && "dog".equals(editPet.getType())) ? "selected" : "" %>>Dog</option>
                    <option value="cat" <%= (editPet != null && "cat".equals(editPet.getType())) ? "selected" : "" %>>Cat</option>
                </select>
            </div>

            <div class="form-row">
                <input type="text" name="petBreed" placeholder="Breed"
                value="<%= (editPet != null) ? editPet.getBreed() : "" %>">

                <input type="text" name="petAge" placeholder="Age"
                value="<%= (editPet != null) ? editPet.getAge() : "" %>" required>
            </div>

            <button type="submit">
                <%= (editPet != null) ? "Update Pet" : "Add Pet" %>
            </button>

        </form>
    </div>

    <!-- PET LIST -->
    <div class="admin-section">
        <h3>Pet List</h3>

        <table class="pet-table">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Breed</th>
                <th>Age</th>
                <th>Actions</th>
            </tr>

            <%
            List<Pet> pets = (List<Pet>) request.getAttribute("pets");

            if(pets != null){
                for(Pet p : pets){
            %>

            <tr>
                <td><%= p.getName() %></td>
                <td><%= p.getType() %></td>
                <td><%= p.getBreed() %></td>
                <td><%= p.getAge() %></td>
                <td>
                    <a href="dashboard?action=edit&id=<%= p.getId() %>">Edit</a>
                    <a href="dashboard?action=delete&id=<%= p.getId() %>">Delete</a>
                </td>
            </tr>

            <%
                }
            }
            %>

        </table>
    </div>

</div>

</body>
</html>