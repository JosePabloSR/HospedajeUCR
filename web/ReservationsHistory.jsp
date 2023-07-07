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
        ResultSet resultSet = statement.executeQuery("SELECT * FROM hosting_history");

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
            Reservation reservation = new Reservation(roomId, bedId, arrivalDate, arrivalTime,
                    departureDate, departureTime, reserverName, reservedId, reservedName, reservationState);

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
                <label for="searchName">Enter the name of the reserved person you want to search:</label>
                <input type="text" class="form-control" id="searchName" name="searchName" required>
            </div>
            <button type="submit" class="btn btn-dark">Search Reservation</button>
        </form>
        <br></br>
        <form method="post" action="DeleteAllData.jsp">
            <button type="submit" class="btn-right">Delete All Data</button>
        </form>
        <br></br>
        <table>
            <tr>
                <th>Room ID</th>
                <th>Bed ID</th>
                <th>Arrival Date</th>
                <th>Arrival Time</th>
                <th>Departure Date</th>
                <th>Departure Time</th>
                <th>Reserver Name</th>
                <th>Reserved ID</th>
                <th>Reserved Name</th>
                <th>Reservation State</th>
            </tr>
            
            <%-- Iterate over the doubly linked list and generate table rows --%>
            <%
                NodeDoubleLinked temp = linkedList.getHead();
                while (temp != null) {
                    Reservation reservation = temp.getReservation();
            %>
            <tr>
                <td><%= reservation.getRoomId()%></td>
                <td><%= reservation.getBedId()%></td>
                <td><%= reservation.getArrivalDate()%></td>
                <td><%= reservation.getArrivalTime()%></td>
                <td><%= reservation.getDepartureDate()%></td>
                <td><%= reservation.getDepartureTime()%></td>
                <td><%= reservation.getReserverName()%></td>
                <td><%= reservation.getReservedId()%></td>
                <td><%= reservation.getReservedName()%></td>
                <td><%= reservation.getReservationState() == null ? "No state" : reservation.getReservationState()%></td>
            </tr>
            <%
                    temp = temp.next;
                }
            %>
        </table>
    </body>
</html>