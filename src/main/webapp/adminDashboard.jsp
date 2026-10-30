<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User"%>
<%
    User u = (User) session.getAttribute("user");
    if (u == null || !"admin".equals(u.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="nav">
    <b>City Hospital - Admin</b>
    <span>Welcome, <%= u.getName() %> <a href="logout">Logout</a></span>
  </div>
  <div class="box wide">
    <h2>Admin Dashboard</h2>
    <div class="cards">
      <a class="btn" href="#">Manage Doctors</a>
      <a class="btn" href="#">All Appointments</a>
    </div>
  </div>
</body>
</html>
