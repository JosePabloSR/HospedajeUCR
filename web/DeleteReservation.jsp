<%--
    Document   : DeleteReservation
    Created on : 6 jul. 2023, 02:40:45
    Author     : dilan
--%>

<%@page import="java.lang.String"%>
<%@page import="databasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Establishing a connection to the MySQL database
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");   

    // Retrieving the ID of the reservation to be deleted from the request parameter
    String reserved_id = request.getParameter("eliminar");
    System.out.println("reserved_id: " + reserved_id);

    // Validating the user and password
    if (mysql.deleteReservation(reserved_id)){
        // Successful reservation deletion
        
        response.sendRedirect("Reservations.jsp"); // Redirecting to the home page after successful deletion
    } else {
        // Failed reservation deletion
        out.println("<script>alert('No se puede eliminar'); window.location.href='index.html';</script>");
    }
%>
