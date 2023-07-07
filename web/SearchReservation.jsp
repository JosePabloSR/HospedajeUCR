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
    Connection connection = mysql.connect();

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

        Reservation history = new Reservation(reservation_id, room_id, bed_id,
                arrive_date, arrive_hour, departure_date, departure_hour,
                reservator_name, reserved_id, reserved_name, reservation_state);
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

    int index = Collections.binarySearch(dataList, new Reservation(searchName),
            new Comparator<Reservation>() {
        public int compare(Reservation r1, Reservation r2) {
            return r1.getReserved_name().compareTo(r2.getReserved_name());
        }
    });

    ArrayList<Reservation> searchResults = new ArrayList<>();
    if (index >= 0) {

        searchResults.add(dataList.get(index));

        int leftIndex = index - 1;
        while (leftIndex >= 0 && dataList.get(leftIndex).
                getReserved_name().equals(searchName)) {
            searchResults.add(dataList.get(leftIndex));
            leftIndex--;
        }

        int rightIndex = index + 1;
        while (rightIndex < dataList.size() && dataList.get(rightIndex).
                getReserved_name().equals(searchName)) {
            searchResults.add(dataList.get(rightIndex));
            rightIndex++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <title>Search Results</title>
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
            table {
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
            }
            .bodyColor{

                background-color:  #e6e6e6 ; /* Background color of the body */

            }
        </style>
    </head>
    <body class="bodyColor">
        <h1 class="headier">
            <img src="UCR_LOGO.png" alt="Alternative text for the image" 
                 class="UCR-img"> Universidad de Costa Rica. 
            Hospedaje de profesores.
        </h1>
        <h2>Resultados de busqueda</h2>
        <% if (!searchResults.isEmpty()) { %>
        <table>
            <tr>
                <th>Reservation ID</th>
                <th>Room ID</th>
                <th>Bed ID</th>
                <th>Arrival Date</th>
                <th>Arrival Hour</th>
                <th>Departure Date</th>
                <th>Departure Hour</th>
                <th>Reservator Name</th>
                <th>Reserved ID</th>
                <th>Reserved Name</th>
                <th>Reservation State</th>
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
                    <td><%= result.getReservation_state() == null ? "No state"
                        : result.getReservation_state()%></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <p>No se encontraron resultados.</p>
        <% }%>
        <footer class="footer">
            <p>© 2023 Universidad de Costa Rica - Tel. 2511-4000. 
                Aviso Legal. 
                Última actualización: julio, 2023</p>
        </footer>
    </body>
</html>
