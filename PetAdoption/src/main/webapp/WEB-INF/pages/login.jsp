<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paw Patrol Adoption - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/log.css">
    <!-- Google Fonts -->
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
                <h2>Welcome Back</h2>
                <p>Log in to continue your journey or manage the shelter.</p>
                
                <c:if test="${not empty error}">
    <div class="error-message">${error}</div>
</c:if>

                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="hello@pawpatroladoption.org" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="********" required>

                    <div class="form-options">
                        <a href="#">Forgot password?</a>
                    </div>

                    <button type="submit">Login</button>


                    <p class="signup-link">Don't have an account? <a href="<%=request.getContextPath()%>/register">Sign up</a></p>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            var email = document.getElementById('email').value.trim();
            var password = document.getElementById('password').value.trim();
            if(email === "" || password === "") {
                alert("Please fill in both email and password fields.");
                e.preventDefault();
            }
        });
    </script>
</body>
</html>