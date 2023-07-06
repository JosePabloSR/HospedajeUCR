<%-- 
    Document   : reservationHistoryValidation
    Created on : 6 jul. 2023, 01:01:01
    Author     : dilan
--%>

<%@page import="databasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");

    String room_id = request.getParameter("habitacion").trim();
    String bed_id = request.getParameter("cama").trim();
    String arrive_date = request.getParameter("fechaEntrada").trim();
    String arrive_hour = request.getParameter("horaEntrada").trim();
    String departure_date = request.getParameter("fechaSalida").trim();
    String departure_hour = request.getParameter("horaSalida").trim();
    String reservator_name = request.getParameter("nombreReservacion").trim();
    String reserved_id = request.getParameter("idReservado").trim();
    String reserved_name = request.getParameter("nombreReservado").trim();




    System.out.println("Estamos en reserva");
    // Validar el usuario y contraseña
    if (mysql.insertReservationHistory(room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name)) {
            response.sendRedirect("reservar.html");
        }else{
    out.println("<script>alert('Datos incorrectos'); window.location.href='index.html';</script>");
    }
%>
