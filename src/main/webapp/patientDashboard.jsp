<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User"%>
<%
    User u = (User) session.getAttribute("user");
    if (u == null || !"patient".equals(u.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="nav">
    <b>City Hospital</b>
    <span>Welcome, <%= u.getName() %> <a href="logout">Logout</a></span>
  </div>
  <div class="box wide">
    <h2>Patient Dashboard</h2>
    <div class="cards">
      <a class="btn" href="#">View Doctors</a>
      <a class="btn" href="#">Book Appointment</a>
      <a class="btn" href="#">My Appointments</a>
    </div>
    <p><small>Session ID: <%= session.getId() %></small></p>
  </div>
</body>
</html>
