<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petadoption.model.AdoptRequest" %>
<%@ page import="com.petadoption.model.User" %>

<%
    User user = (User) request.getAttribute("user");

    String fullName = "Guest User";
    String email    = "Not available";
    String phone    = "Not added";

    if (user != null) {
        if (user.getName()  != null && !user.getName().isEmpty())  fullName = user.getName();
        if (user.getEmail() != null && !user.getEmail().isEmpty()) email    = user.getEmail();
        if (user.getPhone() != null && !user.getPhone().isEmpty()) phone    = user.getPhone();
    }

    String initials = fullName.substring(0, Math.min(2, fullName.length())).toUpperCase();
    if (fullName.contains(" ")) {
        String[] parts = fullName.split(" ");
        initials = (parts[0].substring(0,1) + parts[parts.length-1].substring(0,1)).toUpperCase();
    }

    List<AdoptRequest> myRequests = (List<AdoptRequest>) request.getAttribute("myRequests");

    int totalRequests    = 0;
    int pendingRequests  = 0;
    int approvedRequests = 0;
    int rejectedRequests = 0;

    if (myRequests != null) {
        totalRequests = myRequests.size();
        for (AdoptRequest ar : myRequests) {
            String st = ar.getStatus();
            if (st == null || st.equalsIgnoreCase("Pending"))       pendingRequests++;
            else if (st.equalsIgnoreCase("Approved")) approvedRequests++;
            else if (st.equalsIgnoreCase("Rejected")) rejectedRequests++;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= fullName %> | PawPatrol</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile1.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<!-- ===== HEADER (same as home.jsp) ===== -->
<header class="header">
    <div class="logo">PawPatrol</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/browse">Browse</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
    <div class="nav-user">
        <a href="${pageContext.request.contextPath}/profile">
            <div class="nav-avatar"><%= initials %></div>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</header>

<!-- ===== PROFILE PAGE ===== -->
<main class="profile-main">

    <!-- Page Title Row -->
    <div class="page-title-row">
        <div>
            <h1 class="page-title">User Profile</h1>
            <p class="page-subtitle">Manage your account details and track your adoption journey.</p>
        </div>
        <button class="edit-profile-btn" onclick="alert('Edit profile coming soon!')">
            ✏️ Edit Profile
        </button>
    </div>

    <!-- Main Grid -->
    <div class="profile-grid">

        <!-- LEFT COLUMN -->
        <div class="left-col">

            <!-- Avatar Card -->
            <div class="card avatar-card">
                <div class="avatar-circle"><%= initials %></div>
                <h2 class="avatar-name"><%= fullName %></h2>
                <p class="avatar-since">MEMBER</p>
                <div class="avatar-tags">
                    <span class="tag">Pet Lover</span>
                    <span class="tag">Member</span>
                </div>
            </div>

            <!-- Contact Card -->
            <div class="card contact-card">
                <h3 class="contact-title">Contact Details</h3>
                <ul class="contact-list">
                    <li>
                        <span class="contact-icon">✉️</span>
                        <div>
                            <span class="contact-label">Email Address</span>
                            <span class="contact-value"><%= email %></span>
                        </div>
                    </li>
                    <li>
                        <span class="contact-icon">📞</span>
                        <div>
                            <span class="contact-label">Phone Number</span>
                            <span class="contact-value"><%= phone %></span>
                        </div>
                    </li>
                    <li>
                        <span class="contact-icon">🪪</span>
                        <div>
                            <span class="contact-label">User ID</span>
                            <span class="contact-value">#<%= user != null ? user.getId() : "—" %></span>
                        </div>
                    </li>
                </ul>
            </div>

        </div>

        <!-- RIGHT COLUMN -->
        <div class="right-col">

            <!-- Stats Row -->
            <div class="stats-row">
                <div class="stat-box">
                    <span class="stat-label">TOTAL REQUESTS</span>
                    <span class="stat-number"><%= String.format("%02d", totalRequests) %></span>
                </div>
                <div class="stat-box">
                    <span class="stat-label">PENDING</span>
                    <span class="stat-number pending-num"><%= String.format("%02d", pendingRequests) %></span>
                    <span class="stat-dot pending-dot">●</span>
                </div>
                <div class="stat-box">
                    <span class="stat-label">APPROVED</span>
                    <span class="stat-number approved-num"><%= String.format("%02d", approvedRequests) %></span>
                    <span class="stat-dot approved-dot">●</span>
                </div>
                <div class="stat-box">
                    <span class="stat-label">REJECTED</span>
                    <span class="stat-number rejected-num"><%= String.format("%02d", rejectedRequests) %></span>
                    <span class="stat-dot rejected-dot">●</span>
                </div>
            </div>

            <!-- Adoption Requests Card -->
            <div class="card requests-card">
                <div class="requests-header">
                    <h3>My Adoption Requests</h3>
                    <a href="${pageContext.request.contextPath}/browse" class="view-all-link">+ New Request</a>
                </div>

                <%
                    if (myRequests == null || myRequests.isEmpty()) {
                %>
                    <div class="empty-state">
                        <div class="empty-icon">🐾</div>
                        <p class="empty-title">No adoption requests yet</p>
                        <p class="empty-sub">Browse available pets and start your journey.</p>
                        <a href="${pageContext.request.contextPath}/browse" class="browse-btn">Browse Pets</a>
                    </div>
                <%
                    } else {
                        for (AdoptRequest ar : myRequests) {
                            String st = ar.getStatus();
                            if (st == null || st.isEmpty()) st = "Pending";
                            String badgeClass = "badge-pending";
                            String dotClass   = "dot-pending";
                            if (st.equalsIgnoreCase("Approved")) { badgeClass = "badge-approved"; dotClass = "dot-approved"; }
                            else if (st.equalsIgnoreCase("Rejected")) { badgeClass = "badge-rejected"; dotClass = "dot-rejected"; }
                %>
                    <div class="request-row">
                        <div class="request-pet-icon">🐶</div>
                        <div class="request-info">
                            <span class="request-pet-name">
                                <%= ar.getPetName() %>
                                <span class="request-pet-breed">(ID #<%= ar.getPetId() %>)</span>
                            </span>
                            <span class="request-reason"><%= ar.getReason().length() > 60 ? ar.getReason().substring(0,60) + "…" : ar.getReason() %></span>
                        </div>
                        <span class="status-badge <%= badgeClass %>">
                            <span class="status-dot <%= dotClass %>">●</span>
                            <%= st %>
                        </span>
                        <span class="row-arrow">›</span>
                    </div>
                <%
                        }
                    }
                %>
            </div>

        </div>
    </div>
</main>

<!-- ===== FOOTER (same as home.jsp) ===== -->
<footer class="footer">
    <div class="footer-column footer-about">
        <h3>Paw Patrol Adoption</h3>
        <p>Connecting pets with loving families. Join us in giving every animal a forever home.</p>
    </div>
    <div class="footer-column footer-links">
        <h4>Quick Links</h4>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Adopt a Pet</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <div class="footer-column footer-contact">
        <h4>Contact Us</h4>
        <p>Email: hello@pawpatrol.com</p>
        <p>Phone: +977 0986712345</p>
    </div>
</footer>

</body>
</html>
