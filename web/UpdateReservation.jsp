<%-- 
    Document   : UpdateReservation
    Created on : 6 jul. 2023, 11:54:33
    Author     : dilan
--%>

<%@page import="databasemysql.ConnectionMysql"%>
<%@page import="Classes.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");

    String room_id = request.getParameter("roo_id");
    String bed_id = request.getParameter("be_id");
    String arrive_date = request.getParameter("arrive_dat");
    String arrive_hour = request.getParameter("arrive_hou");
    String departure_date = request.getParameter("departure_dat");
    String departure_hour = request.getParameter("departure_hou");
    String reservator_name = request.getParameter("reservator_nam");
    String reserved_name = request.getParameter("reserved_nam");
    String reserved_id = request.getParameter("reserv_id");
    String reservation_state = request.getParameter("ESTADO");



    // Validar el usuario y contraseña
    if (mysql.updateReservationState(room_id,bed_id,arrive_date,arrive_hour,departure_date,departure_hour,reservator_name,reserved_name,reserved_id, reservation_state)) {
        // Inicio de sesión exitoso

        response.sendRedirect("Reservations.jsp"); // Página de inicio después de iniciar sesión
    } else {
        // Inicio de sesión fallido
        out.println("<script>alert('No se puede actualizar'); window.location.href='index.html';</script>");
    }
%>
