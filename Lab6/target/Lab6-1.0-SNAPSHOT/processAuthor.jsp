<%-- 
    Document   : processAuthor
    Created on : 15 May 2024, 3:46:05 pm
    Author     : Luqman Hakim
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="myAuthor" class="Lab6.com.Author" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Author</title>
</head>
<body>
    <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>

    <jsp:setProperty name="myAuthor" property="*"/>
    <%
        int result = 0;
        Connection myConnection = null;
        PreparedStatement myPS = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated the driver class name for modern MySQL
            String myURL = "jdbc:mysql://localhost/csf3107";
            myConnection = DriverManager.getConnection(myURL, "root", "admin");

            String sInsertQry = "INSERT INTO author(authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";
            myPS = myConnection.prepareStatement(sInsertQry);

            myPS.setString(1, myAuthor.getAuthno());
            myPS.setString(2, myAuthor.getName());
            myPS.setString(3, myAuthor.getAddress());
            myPS.setString(4, myAuthor.getCity());
            myPS.setString(5, myAuthor.getState());
            myPS.setString(6, myAuthor.getZip());

            result = myPS.executeUpdate();
            if (result > 0) {
                out.println("<p>Record successfully added into Author table...!</p>");
                out.println("<p>Record with author no " + myAuthor.getAuthno() + " successfully created..!</p>");
                out.println("<p>Details of record are;</p>");
                out.println("<p>Name: " + myAuthor.getName() + "</p>");
                out.println("<p>Address: " + myAuthor.getAddress() + "</p>");
                out.println("<p>City: " + myAuthor.getCity() + "</p>");
                out.println("<p>State: " + myAuthor.getState() + "</p>");
                out.println("<p>Zip: " + myAuthor.getZip() + "</p>");
            } else {
                out.println("<p>Failed to add the record into Author table.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (myPS != null) myPS.close();
                if (myConnection != null) myConnection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
