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

    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");

    String room_id = request.getParameter("room").trim();
    String bed_id = request.getParameter("bed").trim();
    String arrive_date = request.getParameter("checkInDate").trim();
    String arrive_hour = request.getParameter("checkInTime").trim();
    String departure_date = request.getParameter("checkOutDate").trim();
    String departure_hour = request.getParameter("checkOutTime").trim();
    String reservator_name = request.getParameter("reservationName").trim();
    String reserved_id = request.getParameter("reservedId").trim();
    String reserved_name = request.getParameter("reservedName").trim();

    System.out.println("Reservation process");
    
    // Validate user and password
    if (mysql.insertReservation(room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name)) {
        // Successful reservation

        response.sendRedirect("reservar.html"); // Redirect to the home page after successful reservation
    } else {
        // Failed reservation
        out.println("<script>alert('Incorrect data'); window.location.href='index.html';</script>");
    }
%>