<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/log.css">
</head>
<body>

<div class="auth-container">

<h2>PetAdoption Login</h2>


<form action="login" method="post">
    <input type="text" name="email" placeholder="Email">
    <input type="password" name="password" placeholder="Password">
    <button type="submit">Login</button>
</form>

<p class="error-msg">${error}</p>

<p>Don't have an account? <a href="register">Register here</a></p>

</div>

</body>
</html>