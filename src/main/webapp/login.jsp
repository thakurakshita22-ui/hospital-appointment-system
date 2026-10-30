<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="nav"><b>City Hospital</b><span><a href="index.html">Home</a></span></div>
  <div class="box">
    <h2>Login</h2>
    <%
       String error = (String) request.getAttribute("error");
       String msg = request.getParameter("msg");
       if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } else if ("registered".equals(msg)) { %>
        <div class="success">Registration successful. Please login.</div>
    <% } else if ("loggedout".equals(msg)) { %>
        <div class="success">You have been logged out.</div>
    <% } %>
    <form action="login" method="post">
      <label>Email</label>
      <input type="email" name="email" required>
      <label>Password</label>
      <input type="password" name="password" required>
      <button type="submit">Login</button>
    </form>
    <p>New patient? <a href="register.jsp">Register here</a></p>
  </div>
</body>
</html>
