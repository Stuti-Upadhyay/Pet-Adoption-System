<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.petadoption.model.User" %>

<%
    // Get logged in user info to pre-fill form
    String loggedEmail = "";
    String loggedName = "";
    String loggedPhone = "";

    Object sessionUser = session.getAttribute("user");
    if (sessionUser instanceof String) {
        loggedEmail = (String) sessionUser;
    } else if (sessionUser instanceof User) {
        User u = (User) sessionUser;
        loggedEmail = u.getEmail() != null ? u.getEmail() : "";
        loggedName  = u.getName()  != null ? u.getName()  : "";
        loggedPhone = u.getPhone() != null ? u.getPhone() : "";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Adoption Request | PawHome</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adopt.css">
</head>
<body>

<div class="adopt-wrapper">
    <div class="adopt-card">

        <div class="card-header">
            <h2>Adoption Request</h2>
            <p>Fill in your details to apply for adoption</p>
        </div>

        <%-- Success message --%>
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-box">
                ✅ <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>

        <%-- Error message --%>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-box">
                ⚠️ <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/adopt" method="post">

            <input type="hidden" name="petId"
                value="<%= request.getAttribute("petId") != null ? request.getAttribute("petId") : "" %>">
            <input type="hidden" name="petName"
                value="<%= request.getAttribute("petName") != null ? request.getAttribute("petName") : "" %>">

            <%-- Show which pet they are applying for --%>
            <% if (request.getAttribute("petName") != null && !request.getAttribute("petName").toString().isEmpty()) { %>
                <div class="pet-info-box">
                    🐾 Applying for: <strong><%= request.getAttribute("petName") %></strong>
                    (ID: <%= request.getAttribute("petId") %>)
                </div>
            <% } %>

            <section class="form-section">
                <h3>Your Information</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <%-- Pre-fill from session if available --%>
                        <input type="text" name="fullName"
                               value="<%= loggedName %>"
                               placeholder="Enter your full name" required>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <%-- Show email but make it readonly - taken from session --%>
                        <input type="email"
                               value="<%= loggedEmail %>"
                               readonly
                               class="readonly-input"
                               title="Email is taken from your account">
                    </div>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone"
                           value="<%= loggedPhone %>"
                           placeholder="Enter your phone number" required>
                </div>
            </section>

            <section class="form-section">
                <h3>About the Adoption</h3>
                <div class="form-group">
                    <label>Why do you want to adopt this pet?</label>
                    <textarea name="reason" rows="5"
                              placeholder="Tell us why you want to adopt..." required></textarea>
                </div>
            </section>

            <button type="submit" class="submit-btn">Submit Request</button>

            <p class="terms-text">
                By submitting, you agree to our Adoption Terms &amp; Conditions.
            </p>

        </form>
    </div>
</div>

</body>
</html>