<%@page import="Classes.NodeDoubleLinked"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Time"%>
<%@page import="Classes.Reservation"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Classes.Node"%>
<%@page import="java.sql.Connection"%>
<%@page import="databasemysql.ConnectionMysql"%>
<%@page import="Classes.DoublyLinkedList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reservations</title>
        <style>
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
<%
    // Establishing a connection to the MySQL database
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
    Connection connection = mysql.connect();
%>
<%
    // Creating a doubly linked list
    DoublyLinkedList linkedList = new DoublyLinkedList();
   
    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = 
                statement.executeQuery("SELECT * FROM hosting_history");

        while (resultSet.next()) {
            // Extracting reservation data from the result set
            int roomId = resultSet.getInt("room_id");
            int bedId = resultSet.getInt("bed_id");
            Date arrivalDate = resultSet.getDate("arrive_date");
            Time arrivalTime = resultSet.getTime("arrive_hour");
            Date departureDate = resultSet.getDate("departure_date");
            Time departureTime = resultSet.getTime("departure_hour");
            String reserverName = resultSet.getString("reservator_name");
            String reservedId = resultSet.getString("reserved_id");
            String reservedName = resultSet.getString("reserved_name");
            String reservationState = resultSet.getString("reservation_state");

            // Creating a Reservation object
            Reservation reservation = new Reservation(roomId, bedId, 
                    arrivalDate, arrivalTime,
                    departureDate, departureTime, reserverName, reservedId, 
                    reservedName, reservationState);

            // Adding the reservation object to the doubly linked list
            linkedList.addReservation(reservation);
        }

        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Reservation History</title>
    </head>
    <body>
        <h1>Reservation History</h1>
        <form method="post" action="SearchReservation.jsp">
            <div class="form-group">
                <label for="searchName">Digite el nombre de la persona que desea
                    buscar:</label>
                <input type="text" class="form-control" id="searchName"
                       name="searchName" required>
            </div>
            <button type="submit" class="btn btn-dark">Buscar</button>
        </form>
        <br></br>
        <form method="post" action="DeleteAllData.jsp">
            <button type="submit" class="btn-right">Eliminar toda la información
                de la tabla</button>
        </form>
        <br></br>
        <table>
            <tr>
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
            
            <%-- Iterate over the doubly linked list and generate table rows --%>
            <%
                NodeDoubleLinked temp = linkedList.getHead();
                while (temp != null) {
                    Reservation reservation = temp.getReservation();
            %>
            <tr>
                <td><%= reservation.getRoom_id()%></td>
                <td><%= reservation.getBed_id()%></td>
                <td><%= reservation.getArrive_date()%></td>
                <td><%= reservation.getArrive_hour()%></td>
                <td><%= reservation.getDeparture_date()%></td>
                <td><%= reservation.getDeparture_hour()%></td>
                <td><%= reservation.getReservator_name()%></td>
                <td><%= reservation.getReserved_id()%></td>
                <td><%= reservation.getReserved_name()%></td>
                <td><%= reservation.getReservation_state() == null ? "No state"
                        : reservation.getReservation_state()%></td>
            </tr>
            <%
                    temp = temp.next;
                }
            %>
        </table>
    </body>
</html>