<%-- 
    Document   : doLogin
    Created on : 15 Jun 2024, 2:37:52 am
    Author     : Luqman Hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Lab6.com.User" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department of Quality UMT</title>
    </head>
    <body>
        <h1>Department of Quality UMT</h1>
        <%
            // Retrieve username and password from the request
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Check if username and password are not null and not empty
            if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
                // Establish database connection
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String myURL = "jdbc:mysql://localhost:3306/csf3017";
                    conn = DriverManager.getConnection(myURL, "root", "admin");

                    // Query to check if the username and password are valid
                    String query = "SELECT * FROM user WHERE username = ? AND password = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        // If user exists and credentials are valid, redirect to main.jsp
                        User user = new User();
                        user.setUsername(rs.getString("username"));
                        user.setFirstname(rs.getString("firstname"));
                        user.setLastname(rs.getString("lastname"));

                        // Set user object in session for later use
                        session.setAttribute("user", user);
                        response.sendRedirect("main.jsp");
                    } else {
                        // If invalid username or password, redirect back to login.jsp with error message
                        response.sendRedirect("login.jsp?error=Invalid+username+or+password");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                // If username or password is empty, redirect back to login.jsp with error message
                response.sendRedirect("login.jsp?error=Username+and+password+are+required");
            }
        %>
    </body>
</html>
