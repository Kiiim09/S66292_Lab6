<%-- 
    Document   : insertAuthor
    Created on : 15 May 2024, 3:36:05 pm
    Author     : Luqman Hakim
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Author</title>
</head>
<body>
    <h2>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h2>
     <fieldset>
        <legend>Author Registration</legend>
            <form action="processAuthor.jsp" method="post">
                <table>
                    <tr>
                        <td>Author No:</td>
                        <td><input type="text" name="authno" required></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" required></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" required></td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td><input type="text" name="city" required></td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td><input type="text" name="state" required></td>
                    </tr>
                    <tr>
                        <td>Zip:</td>
                        <td><input type="text" name="zip" required></td>
                    </tr>
                </table>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </form>
     </fieldset>
</body>
<footer>
    &copy Luqman Hakim
</footer>
</html>
