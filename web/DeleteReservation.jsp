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
    
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");   
     
    String reserved_id = request.getParameter("eliminar");
   System.out.println("reserved_id: "+reserved_id);

    // Validar el usuario y contraseña
    if (mysql.deleteReservation(reserved_id)){
        // Inicio de sesión exitoso
        
        response.sendRedirect("Reservations.jsp"); // Página de inicio después de iniciar sesión
    } else {
        // Inicio de sesión fallido
        out.println("<script>alert('No se puede eliminar'); window.location.href='index.html';</script>");
    }
%>
