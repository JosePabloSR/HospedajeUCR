<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="Classes.Reservation"%>
<%@ page import="databasemysql.ConnectionMysql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String searchName = request.getParameter("searchName");
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
    Connection connection = mysql.conectar();

    String query = "SELECT * FROM hosting_history WHERE reserved_name = '" + searchName + "'";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(query);

    ArrayList<Reservation> dataList = new ArrayList<>();

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
        dataList.add(history);
    }

    resultSet.close();
    statement.close();
    connection.close();

    Collections.sort(dataList, new Comparator<Reservation>() {
        public int compare(Reservation r1, Reservation r2) {
            return r1.getReserved_name().compareTo(r2.getReserved_name());
        }
    });

    int index = Collections.binarySearch(dataList, new Reservation(searchName), new Comparator<Reservation>() {
        public int compare(Reservation r1, Reservation r2) {
            return r1.getReserved_name().compareTo(r2.getReserved_name());
        }
    });

    ArrayList<Reservation> searchResults = new ArrayList<>();
    if (index >= 0) {

        searchResults.add(dataList.get(index));


        int leftIndex = index - 1;
        while (leftIndex >= 0 && dataList.get(leftIndex).getReserved_name().equals(searchName)) {
            searchResults.add(dataList.get(leftIndex));
            leftIndex--;
        }


        int rightIndex = index + 1;
        while (rightIndex < dataList.size() && dataList.get(rightIndex).getReserved_name().equals(searchName)) {
            searchResults.add(dataList.get(rightIndex));
            rightIndex++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultados de búsqueda</title>
        <style>
            table {
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <h1>Resultados de búsqueda</h1>
        <% if (!searchResults.isEmpty()) { %>
        <table>
            <tr>
                <th>ID de reservación</th>
                <th>ID de habitación</th>
                <th>ID de cama</th>
                <th>Fecha de entrada</th>
                <th>Hora de entrada</th>
                <th>Fecha de salida</th>
                <th>Hora de salida</th>
                <th>Nombre del reservador</th>
                <th>ID de reservado</th>
                <th>Nombre de reservado</th>
                <th>Estado de la reservación</th>

            </tr>
            <% for (Reservation result : searchResults) {%>
            <tr>
                <td><%= result.getReservation_id()%></td>
                <td><%= result.getRoom_id()%></td>
                <td><%= result.getBed_id()%></td>
                <td><%= result.getArrive_date()%></td>
                <td><%= result.getArrive_hour()%></td>
                <td><%= result.getDeparture_date()%></td>
                <td><%= result.getDeparture_hour()%></td>
                <td><%= result.getReservator_name()%></td>
                <td><%= result.getReserved_id()%></td>
                <td><%= result.getReserved_name()%></td>
                <td><%= result.getReservation_state() == null ? "Sin estado" : result.getReservation_state()%></td>


            </tr>
            <% } %>

        </table>
        <% } else { %>
        <p>No se encontraron resultados para la búsqueda.</p>
        <% }%>
    </body>
</html>
