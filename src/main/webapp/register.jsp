<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="nav"><b>City Hospital</b><span><a href="index.html">Home</a></span></div>
  <div class="box">
    <h2>Patient Registration</h2>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>
    <form action="register" method="post">
      <label>Full Name</label>
      <input type="text" name="name" required>
      <label>Email</label>
      <input type="email" name="email" required>
      <label>Phone</label>
      <input type="text" name="phone">
      <label>Password</label>
      <input type="password" name="password" required minlength="4">
      <button type="submit">Register</button>
    </form>
    <p>Already registered? <a href="login.jsp">Login</a></p>
  </div>
</body>
</html>
