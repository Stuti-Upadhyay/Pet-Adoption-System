<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petadoption.model.Pet" %>
<%@ page import="com.petadoption.model.User" %>

<%
    List<Pet> pets = (List<Pet>) request.getAttribute("pets");
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | PawPatrol</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>

<div class="dash-layout">

    <aside class="sidebar" id="sidebar">
        <div class="sidebar-brand">🐾 PawPatrol</div>
        <div class="admin-badge">
            <div class="admin-avatar">A</div>
            <div>
                <div class="admin-name">Admin</div>
                <div class="admin-online"><span class="online-dot"></span> Online</div>
            </div>
        </div>
        <nav class="sidebar-nav">
            <a href="#overview" class="nav-item active" onclick="showSection('overview', this)">⊞ Dashboard</a>
            <a href="#pets" class="nav-item" onclick="showSection('pets', this)">🐾 Manage Pets</a>
            <a href="#users" class="nav-item" onclick="showSection('users', this)">👤 Manage Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">⎋ Logout</a>
    </aside>

    <main class="dash-main">

        <div class="topbar">
            <div class="topbar-left">
                <h1 class="topbar-title" id="topbar-title">Admin Dashboard</h1>
            </div>
        </div>

        <section class="dash-section active" id="overview">
            <div class="section-header">
                <h2>Overview</h2>
            </div>
            <div class="stats-grid">
                <div class="stat-card">🐾 Total Pets <span class="stat-num"><%= pets != null ? pets.size() : 0 %></span></div>
                <div class="stat-card">👤 Total Users <span class="stat-num"><%= users != null ? users.size() : 0 %></span></div>
            </div>
        </section>

        <section class="dash-section" id="pets">
            <div class="section-header">
                <h2>Manage Pets</h2>
                <button type="button" onclick="openPetForm()">＋ Add Pet</button>
            </div>
            <div class="table-card">
                <table>
                    <thead>
                        <tr><th>ID</th><th>Name</th><th>Type</th><th>Breed</th><th>Age</th><th>Location</th><th>Actions</th></tr>
                    </thead>
                    <tbody>
                        <% if(pets != null && !pets.isEmpty()) {
                            for(Pet pet : pets) { %>
                                <tr>
                                    <td><%= pet.getId() %></td>
                                    <td><%= pet.getName() %></td>
                                    <td><%= pet.getType() %></td>
                                    <td><%= pet.getBreed() %></td>
                                    <td><%= pet.getAge() %></td>
                                    <td><%= pet.getLocation() %></td>
                                    <td>
                                        <button type="button" onclick='openPetForm({id:"<%=pet.getId()%>",name:"<%=pet.getName()%>",type:"<%=pet.getType()%>",breed:"<%=pet.getBreed()%>",age:"<%=pet.getAge()%>",location:"<%=pet.getLocation()%>",description:"<%=pet.getDescription()%>"})'>Edit</button>
                                        <form style="display:inline;" method="post" action="${pageContext.request.contextPath}/pet" onsubmit="return confirm('Are you sure you want to delete this pet?');">
                                            <input type="hidden" name="formAction" value="delete">
                                            <input type="hidden" name="id" value="<%=pet.getId()%>">
                                            <button type="submit">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                        <% } } else { %>
                                <tr><td colspan="7">No pet data found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="dash-section" id="users">
            <div class="section-header"><h2>Manage Users</h2></div>
            <div class="table-card">
                <table>
                    <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th></tr></thead>
                    <tbody>
                        <% if(users != null && !users.isEmpty()) {
                            for(User u : users) { %>
                                <tr>
                                    <td><%= u.getId() %></td>
                                    <td><%= u.getName() %></td>
                                    <td><%= u.getEmail() %></td>
                                    <td><%= u.getRole() %></td>
                                </tr>
                        <% } } else { %>
                                <tr><td colspan="4">No user data found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>

    </main>
</div>

<div id="pet-form-card">
    <h3 id="form-title">Add New Pet</h3>
    <form method="post" action="${pageContext.request.contextPath}/pet">
        <input type="hidden" name="id" id="pet-id">
        <input type="hidden" name="formAction" id="form-action" value="add">
        
        <label>Name</label>
        <input type="text" name="petName" id="pet-name" required>
        
        <label>Type</label>
        <select name="petType" id="pet-type" required>
            <option value="dog">Dog</option>
            <option value="cat">Cat</option>
            <option value="other">Other</option>
        </select>
        
        <label>Breed</label>
        <input type="text" name="petBreed" id="pet-breed">
        
        <label>Age</label>
        <input type="text" name="petAge" id="pet-age">
        
        <label>Location</label>
        <input type="text" name="petLocation" id="pet-location">
        
        <label>Description</label>
        <textarea name="petDescription" id="pet-description" style="height:100px;"></textarea>
        
        <div class="form-actions">
            <button type="submit" class="save-btn">Save</button>
            <button type="button" class="cancel-btn" onclick="closePetForm()">Cancel</button>
        </div>
    </form>
</div>

<script>
function showSection(name, el){
    document.querySelectorAll('.dash-section').forEach(s=>s.classList.remove('active'));
    document.getElementById(name).classList.add('active');
    document.querySelectorAll('.nav-item').forEach(n=>n.classList.remove('active'));
    if(el) el.classList.add('active');
}

function openPetForm(editPet){
    const panel = document.getElementById('pet-form-card');
    
    if(editPet){
        document.getElementById('form-title').innerText = "Edit Pet Details";
        document.getElementById('form-action').value = 'edit';
        document.getElementById('pet-id').value = editPet.id;
        document.getElementById('pet-name').value = editPet.name;
        document.getElementById('pet-type').value = editPet.type.toLowerCase();
        document.getElementById('pet-breed').value = editPet.breed;
        document.getElementById('pet-age').value = editPet.age;
        document.getElementById('pet-location').value = editPet.location;
        document.getElementById('pet-description').value = editPet.description;
    } else {
        document.getElementById('form-title').innerText = "Add New Pet";
        document.getElementById('form-action').value = 'add';
        document.getElementById('pet-id').value = '';
        document.getElementById('pet-name').value = '';
        document.getElementById('pet-type').value = 'dog';
        document.getElementById('pet-breed').value = '';
        document.getElementById('pet-age').value = '';
        document.getElementById('pet-location').value = '';
        document.getElementById('pet-description').value = '';
    }
    
    panel.classList.add('active');
}

function closePetForm(){ 
    document.getElementById('pet-form-card').classList.remove('active'); 
}
</script>

</body>
</html>