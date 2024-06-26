<%--
    Document: ReservationsInProcess
    Created on: 6th July 2023, 13:55:52
    Author: dilan
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

<%-- Establish the connection with the database --%>
<% CircularLinkedList listas = new CircularLinkedList(); %>
<%
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
    Connection connection = mysql.connect();
    try {
        Statement statement = connection.createStatement();

        // Retrieve data from the database
        String query = "SELECT * FROM lodging;";
        ResultSet resultSet = statement.executeQuery(query);

        listas.clear();
        // Create a circular linked list and load the data
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

        // Filter the data based on the required criteria
        listas.filterByState("Concluida");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <title>Reservations</title>
        <style>
            .headier {
                background-color: #41ade7;
                background-size: 7px;
                font-size: 25px; /* Font size */
                font-weight: bold; /* Font weight */
                border-bottom: 2px solid black;
                border-bottom-color: #323232;
            }
            .footer {
                background-color: #323232;
                position: absolute;
                bottom: 0;
                width: 100%;
                color: #ffffff;
            }
            .UCR-img {
                width: 125px;
                height: auto;
            }


            .bodyColor{

                background-color:  #e6e6e6 ; /* Background color of the body */

            }
            table {
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
            }
            .container {
                position: relative;
            }

            .btn-right {
                position: absolute;
                top: 0;
                right: 0;
            }
        </style>
    </head>

    <body class="bodyColor">
        <h1 class="headier">
            <img src="UCR_LOGO.png" alt="Alternative text for the image" 
                 class="UCR-img"> Universidad de Costa Rica. 
            Hospedaje de profesores.
        </h1>
        <h2>Tabla de reservaciones conluidas</h2>
        <table>
            <tr>
                <th>Id de la reservación</th>
                <th>Id del cuarto</th>
                <th>Id de la cama</th>
                <th>Fecha de entrada</th>
                <th>Hora de entrada</th>
                <th>Fecha de salida</th>
                <th>Hora de salida</th>
                <th>Nombre del reservador</th>
                <th>Id del reservado</th>
                <th>Nombre del reservado</th>
                <th>Estado de la reservación</th>
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
        <footer class="footer">
            <p>© 2023 Universidad de Costa Rica - Tel. 2511-4000. Aviso Legal. 
                Última actualización: julio, 2023</p>
        </footer>
    </body>
</html>