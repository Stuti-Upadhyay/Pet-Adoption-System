<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paw Patrol Adoption - Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/log.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- Left image side -->
        <div class="image-side">
            <img src="${pageContext.request.contextPath}/images/main.jpg" alt="Pets">
        </div>

        <!-- Right form side -->
        <div class="form-side">
            <div class="login-box">
                <h1>Paw Patrol Adoption</h1>
                <h2>Create Account</h2>
                <p>Sign up to start adopting and managing pets.</p>

                <% 
                    String error = (String) request.getAttribute("error");
                    if(error != null) { 
                %>
                    <div class="error-message"><%= error %></div>
                <% 
                    } 
                %>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="input-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" placeholder="Your name">
                    </div>

                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="hello@pawpatroladoption.org">
                    </div>

                    <div class="input-group">
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone" placeholder="1234567890">
                    </div>

                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="********">
                    </div>

                    <div class="input-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="********">
                    </div>

                    <button type="submit">Register</button>

                    <p class="signup-link">Already have an account? <a href="<%=request.getContextPath()%>/login">Login</a></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>