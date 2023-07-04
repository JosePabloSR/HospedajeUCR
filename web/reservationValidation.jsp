<%-- 
    Document   : reservationValidation
    Created on : 4 jul. 2023, 13:23:16
    Author     : UCR
--%>

<%@page import="java.sql.Date"%>
<%@page import="databasemysql.ConnectionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_lodging");

    String room_id = request.getParameter("habitacion").trim();
    String bed_id = request.getParameter("cama").trim();
    String arrive_date = request.getParameter("fechaEntrada").trim();
    String arrive_hour = request.getParameter("horaEntrada").trim();
    String departure_date = request.getParameter("fechaSalida").trim();
    String departure_hour = request.getParameter("horaSalida").trim();
    String reservator_name = request.getParameter("nombreReservacion").trim();

    String idr = "";
    switch (room_id) {

        case "habitacion1":
            idr = "1";
            break;
        case "habitacion2":
            idr = "2";
            break;

    }
    String idc = "";
    switch (room_id) {

        case "cama1":
            idc = "1";
            break;
        case "cama2":
            idc = "2";
            break;

    }

    System.out.println("Estamos en reserva");
    // Validar el usuario y contraseña
    if (mysql.insertReservation(idr, idc, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name)) {
        // Inicio de sesión exitoso

        response.sendRedirect("reservar.html"); // Página de inicio después de iniciar sesión
    } else {
        // Inicio de sesión fallido
        out.println("<script>alert('Datos incorrectos'); window.location.href='Registro.jsp';</script>");
    }
%>
