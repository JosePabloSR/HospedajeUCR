<%-- 
    Document   : ReservationsInProcess
    Created on : 6 jul. 2023, 13:55:52
    Author     : dilan
--%>


<%@page import="Classes.NodeDoubleLinked"%>
<%@page import="databasemysql.ConnectionMysql"%>
<%@page import="Classes.NodeCircular"%>
<%@page import="Classes.CircularLinkedList"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="Classes.Reservation"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Establecer la conexión con la base de datos --%>
<%CircularLinkedList listas = new CircularLinkedList();%>
<%
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
    Connection connection = mysql.conectar();
    try {
        Statement statement = connection.createStatement();

        // Consultar los datos desde la base de datos
        String query = "SELECT * FROM lodging;";
        ResultSet resultSet = statement.executeQuery(query);

        listas.clear();
        // Crear la lista enlazada circular y cargar los datos
        while (resultSet.next()) {
            int reservation_id = resultSet.getInt("reservation_id");
            int room_id = resultSet.getInt("room_id");
            int bed_id = resultSet.getInt("bed_id");
            Date arrive_date = resultSet.getDate("arrive_date");
            Time arrive_hour = resultSet.getTime("arrive_hour");
            Date departure_date = resultSet.getDate("departure_date");
            Time departure_hour = resultSet.getTime("departure_hour");
            String reservator_name = resultSet.getString("reservator_name");
            String reserved_id = resultSet.getString("reserved_id");
            String reserved_name = resultSet.getString("reserved_name");
            String reservation_state = resultSet.getString("reservation_state");

            Reservation history = new Reservation(reservation_id, room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name, reservation_state);

            listas.add(history);
        }

        resultSet.close();
        statement.close();
        connection.close();

        // Filtrar los datos según los criterios requeridos
        listas.filterByState("Concluida");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tabla de Historial de Reservas</title>
    </head>

    <body>
        <h1>Tabla de Historial de Reservas</h1>
        <table>
            <tr>
                <th>Reservation ID</th>
                <th>Room ID</th>
                <th>Bed ID</th>
                <th>Arrive Date</th>
                <th>Arrive Hour</th>
                <th>Departure Date</th>
                <th>Departure Hour</th>
                <th>Reservator Name</th>
                <th>Reserved ID</th>
                <th>Reserved Name</th>
                <th>Reservation State</th>
            </tr>
            <% NodeCircular current = listas.getHead();
                while (current != null && current.getNext() != listas.getHead()) {
                    Reservation history = current.getData();
                    String reservationState = history.getReservation_state();
                    if (reservationState != null && reservationState.equals("Concluida")) {
            %>
            <tr>
                <td><%= history.getReservation_id()%></td>
                <td><%= history.getRoom_id()%></td>
                <td><%= history.getBed_id()%></td>
                <td><%= history.getArrive_date()%></td>
                <td><%= history.getArrive_hour()%></td>
                <td><%= history.getDeparture_date()%></td>
                <td><%= history.getDeparture_hour()%></td>
                <td><%= history.getReservator_name()%></td>
                <td><%= history.getReserved_id()%></td>
                <td><%= history.getReserved_name()%></td>
                <td><%= history.getReservation_state()%></td>
            </tr>
            <%
                    }
                    current = current.getNext();
                }%>
        </table>
    </body>
</html>
