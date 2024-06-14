<%-- 
    Document   : processMarathon
    Created on : 15 Jun 2024, 2:13:27 am
    Author     : Luqman Hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="Lab6.com.Database"%>
<%@page import="Lab6.com.Marathon"%>
<%@page import="Lab6.com.MarathonDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Superhero Marathon 2025</title>
    </head>
    <body>
        <jsp:useBean id="myMarathon" class="Lab6.com.Marathon" scope="request"/>
        <jsp:setProperty name="myMarathon" property="*"/>
        
        <%
            int result;
            //Step 1: create Database object...
            Database myDB = new Database();
            
            MarathonDAO object1 = new MarathonDAO();
            
            //Step 2: Add the records...
            result = object1.addDetails(myMarathon);
            
            //Step 3: Determine whether the transactions is success..
            if(result > 0){
                System.out.println("\tRecord successfully added into Book's table...!");
                out.print("<p>" + "Record with IC No " + myMarathon.getIcno() +
                            " successfully created..!" + "</p>");
                out.print("<p>" + "Details of record are: " + "</p>");
                out.print("<p>Ic NO   : " + myMarathon.getIcno() + "</p>");
                out.print("<p>Name   : " + myMarathon.getName() + "</p>");
                out.print("<p>Category   : " + myMarathon.getCategory() + "</p>");
            }else{
                out.print("<p>Crazyy this is an error! maybe you already registerd before?</p>");
            }
            
            //Step 4: Close database connection..!
            System.out.println("Step 5: Close database connection...!");
            myDB.closeConnection();
            System.out.println(" ");
            System.out.println("Database connection is closed...!");
        %>
    </body>
</html>
