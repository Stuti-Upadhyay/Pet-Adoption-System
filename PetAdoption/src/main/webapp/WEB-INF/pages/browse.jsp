<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petadoption.model.Pet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browse Pets – PetAdoption</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/browse.css">
</head>
<body>

<header class="header">
    <div class="logo">PawPatrol</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/browse" class="active">Browse</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
        </ul>
    </nav>
    <div class="nav-user">
        <a href="${pageContext.request.contextPath}/profile">
            <img src="${pageContext.request.contextPath}/images/default-image.jpg" alt="Profile" class="profile-avatar">
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</header>

<form action="${pageContext.request.contextPath}/browse" method="get" class="filters">
    <input type="text" name="search" placeholder="Search pets by name" 
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

    <select name="species">
        <option value="all" <%= "all".equals(request.getParameter("species")) ? "selected" : "" %>>All Species</option>
        <option value="dog" <%= "dog".equals(request.getParameter("species")) ? "selected" : "" %>>Dog</option>
        <option value="cat" <%= "cat".equals(request.getParameter("species")) ? "selected" : "" %>>Cat</option>
        <option value="other" <%= "other".equals(request.getParameter("species")) ? "selected" : "" %>>Other</option>
    </select>

    <button type="submit" class="apply-filters">Apply Filters</button>
</form>

<section class="pets-section">
    <div class="pet-grid">
        <%
            List<Pet> pets = (List<Pet>) request.getAttribute("pets");
            if (pets != null && !pets.isEmpty()) {
                for (Pet pet : pets) {
        %>
        <div class="pet-card" data-type="<%= pet.getType() %>">
            <div class="pet-image-wrap">
                <div class="pet-image-placeholder"></div>
                <span class="pet-type-badge"><%= pet.getType() %></span>
                <span class="pet-heart" onclick="toggleHeart(this)">&#9825;</span>
            </div>
            <div class="pet-info">
                <h3><%= pet.getName() %></h3>
                <div class="pet-chips">
                    <span class="chip"><%= pet.getAge() %></span>
                </div>
                <p class="pet-location"><%= pet.getLocation() != null ? pet.getLocation() : "Kathmandu, NP" %></p>
                
                <form action="${pageContext.request.contextPath}/adopt" method="get">
                    <input type="hidden" name="petId" value="<%= pet.getId() %>">
                    <input type="hidden" name="petName" value="<%= pet.getName() %>">
                    <button type="submit" class="adopt-btn">Adopt Me</button>
                </form>
            </div>
        </div>
        <%
                }
            } else {
        %>
            <div class="no-pets-fallback" style="grid-column: 1/-1; text-align: center; padding: 40px; color: #6f7a72;">
                <p>No pets available matching your criteria at this time.</p>
            </div>
        <%
            }
        %>
    </div>
</section>

<footer class="footer">
    <div class="footer-column">
        <h3>Paw Patrol Adoption</h3>
        <p>Connecting pets with loving families.</p>
    </div>
    <div class="footer-column">
        <h4>Quick Links</h4>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/browse">Browse Pets</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
        </ul>
    </div>
    <div class="footer-column">
        <h4>Contact Us</h4>
        <p>Email: hello@pawpatrol.com</p>
        <p>Phone: +977 0986712345</p>
    </div>
</footer>

<script>
function toggleHeart(el) {
    el.classList.toggle('liked');
    el.innerHTML = el.classList.contains('liked') ? '&#9829;' : '&#9825;';
}
</script>
</body>
</html>