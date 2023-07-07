<%
    // Retrieve data from the table and construct the linked list
    Linkedlist linkedList = new Linkedlist();

    try {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM lodging");

        while (resultSet.next()) {
            // Extracting reservation data from the result set
            int reservationId = resultSet.getInt("reservation_id");
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
            Reservation reservation = new Reservation(reservationId, roomId, bedId, arrivalDate, arrivalTime, departureDate, departureTime, reserverName, reservedId, reservedName, reservationState);

            // Adding the reservation object to the linked list
            linkedList.add(reservation);
        }

        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%-- Function to update the reservation state --%>

<!DOCTYPE html>
<html>
    <head>
        <title>Reservation Table</title>
    </head>
    <body>
        <h1>Reservation Table</h1>

        <br></br>
        <table>
            <tr>
                <th>Reservation ID</th>
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
                <th>Change State</th>
                <th>Reservation Options</th>
            </tr>
            <%-- Iterate over the linked list and generate table rows --%>
            <%
                Node temp = linkedList.getHead();
                while (temp != null) {
                    Reservation reservation = temp.getReservation();
            %>
            <tr>
                <td><%= reservation.getReservationId()%></td>
                <td><%= reservation.getRoomId()%></td>
                <td><%= reservation.getBedId()%></td>
                <td><%= reservation.getArrivalDate()%></td>
                <td><%= reservation.getArrivalTime()%></td>
                <td><%= reservation.getDepartureDate()%></td>
                <td><%= reservation.getDepartureTime()%></td>
                <td><%= reservation.getReserverName()%></td>
                <td><%= reservation.getReservedId()%></td>
                <td><%= reservation.getReservedName()%></td>
                <td><%= reservation.getReservationState() == null ? "No state":reservation.getReservationState()%></td>
                <td>
                    <div class="form-group">
                        <form action="UpdateReservation.jsp">
                            <label for="bed">State</label>
                            <select class="form-control" id="state" name="STATE" required>
                                <option value="Waiting">Waiting</option>
                                <option value="Accepted">Accepted</option>
                                <option value="Rejected">Rejected</option>
                                <option value="Completed">Completed</option>
                            </select>
                            <input hidden="true"type="text" name="room_id" id="id" value="<%=reservation.getRoomId()%>">
                            <input hidden="true"type="text" name="bed_id" id="id" value="<%=reservation.getBedId()%>">
                            <input hidden="true"type="text" name="arrival_date" id="id" value="<%=reservation.getArrivalDate()%>">
                            <input hidden="true"type="text" name="arrival_hour" id="id" value="<%=reservation.getArrivalTime()%>">
                            <input hidden="true"type="text" name="departure_date" id="id" value="<%=reservation.getDepartureDate()%>">
                            <input hidden="true"type="text" name="departure_hour" id="id" value="<%=reservation.getDepartureTime()%>">
                            <input hidden="true"type="text" name="reserver_name" id="id" value="<%=reservation.getReserverName()%>">
                            <input hidden="true"type="text" name="reserved_id" id="id" value="<%=reservation.getReservedId()%>">
                            <input hidden="true"type="text" name="reserved_name" id="id" value="<%=reservation.getReservedName()%>">
                            <button type="submit" class="btn btn-dark">Update</button>
                        </form>
                    </div>
                </td>
                <td>
                    <form action="DeleteReservation.jsp">
                        <input hidden="true" type="text" name="delete" id="id" value="<%=reservation.getReservedId()%>">
                        <input class="bottom-100" type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% temp = temp.getNext();
                }%>
        </table>
    </body>
</html>