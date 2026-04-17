<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="css/log.css">

</head>
<body>

<div class="auth-container">

<h2>Create Your Account</h2>


<form action="register" method="post">

    <input type="text" name="name" placeholder="Enter your Full Name">

    <input type="text" name="email" placeholder="Enter your Email">

    <input type="text" name="phone" placeholder="Enter your Phone Number">

    <input type="password" name="password" placeholder="Enter Password">

    <button type="submit">Register</button>

</form>

<p class="error-msg">${error}</p>

<p>
    Already have an account? 
    <a href="login">Login here</a>
</p>

</div>

</body>
</html>