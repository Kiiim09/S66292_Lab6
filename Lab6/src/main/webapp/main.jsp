<%-- 
    Document   : main
    Created on : 15 Jun 2024, 2:38:42 am
    Author     : Luqman Hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@ page import="Lab6.com.User" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department of Quality UMT</title>
    </head>
    <body>
        <%
            // Retrieve user object from session
            Lab6.com.User user = (Lab6.com.User) session.getAttribute("user");

            // Check if user object exists in session
            if (user != null) {
        %>
        <h1>Welcome, <%= user.getFirstname() %> <%= user.getLastname() %></h1>
        <p>Your username is: <%= user.getUsername() %></p>

        <!-- Add other content here -->

        <p><a href="logout.jsp">Logout</a></p>
        <%
            } else {
                // If user object does not exist in session, redirect to login page
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>

