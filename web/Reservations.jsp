<%@page import="java.sql.Connection"%>
<%@page import="databasemysql.ConnectionMysql"%>
<%@page import="Classes.Node"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Classes.Reservation"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.Linkedlist"%>
<%
    // Retrieve data from the table and construct the linked list
    Linkedlist linkedList = new Linkedlist();
    ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
    Connection connection = mysql.connect();
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
            Reservation reservation = new Reservation(reservationId, roomId,
                    bedId, arrivalDate, arrivalTime, departureDate,
                    departureTime, reserverName, reservedId, reservedName,
                    reservationState);

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
        <style>

            .headier {

                background-color: #41ade7;
                background-size: 200px;
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

            .bodyColor{

                background-color:  #e6e6e6 ; /* Background color of the body */

            }

        </style>
        <title>Reservation Table</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bodyColor">
        <h1 class="headier">
            <img src="UCR_LOGO.png" alt="Alternative text for the image" 
                 class="UCR-img"> Universidad de Costa Rica. 
            Hospedaje de profesores.
        </h1>
        <h2>Reservaciones</h2>
        <br></br>
        <table>
            <tr>
                <th>Id de reservación</th>
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
                <th>Cambio de estado</th>
                <th>Opciones de reservación</th>
            </tr>
            <%-- Iterate over the linked list and generate table rows --%>
            <%
                Node temp = linkedList.getHead();
                while (temp != null) {
                    Reservation reservation = temp.getReservation();
            %>
            <tr>
                <td><%= reservation.getReservation_id()%></td>
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
                <td>
                    <div class="form-group">
                        <form action="UpdateReservation.jsp">
                            <label for="bed">State</label>
                            <select class="form-control" id="state" name="ESTADO"
                                    required>
                                <option value="En espera">En espera</option>
                                <option value="Aceptada">Aceptada</option>
                                <option value="Rechazada">Rechazada</option>
                                <option value="Concluida">Concluida</option>
                            </select>
                            <input hidden="true"type="text"
                                   name="roo_id" id="id"
                                   value="<%=reservation.getRoom_id()%>">
                            <input hidden="true"type="text"
                                   name="be_id" id="id"
                                   value="<%=reservation.getBed_id()%>">
                            <input hidden="true"type="text"
                                   name="arrive_dat" id="id"
                                   value="<%=reservation.getArrive_date()%>">
                            <input hidden="true"type="text"
                                   name="arrive_hou" id="id"
                                   value="<%=reservation.getArrive_hour()%>">
                            <input hidden="true"type="text"
                                   name="departure_dat" id="id"
                                   value="<%=reservation.getDeparture_date()%>">
                            <input hidden="true"type="text" 
                                   name="departure_hou" id="id"
                                   value="<%=reservation.getDeparture_hour()%>">
                            <input hidden="true"type="text" 
                                   name="reservator_nam" id="id" 
                                   value="<%=reservation.getReservator_name()%>">
                            <input hidden="true"type="text" name="reserv_id" 
                                   id="id" value="<%=reservation.
                                           getReserved_id()%>">
                            <input hidden="true"type="text" name="reserved_nam"
                                   id="id" 
                                   value="<%=reservation.getReserved_name()%>">
                            <button type="submit" 
                                    class="btn btn-success">Actualizar</button>
                        </form>
                    </div>
                </td>
                <td>
                    <form action="DeleteReservation.jsp">
                        <input hidden="true" type="text" name="delete" id="id" 
                               value="<%=reservation.getReserved_id()%>">
                                                    <button type="submit" 
                                    class="btn btn-danger" value="Delete"
                                    >Eliminar</button>
                        
                    </form>
                </td>
            </tr>
            <% temp = temp.getNext();
                }%>
        </table>
        <footer class="footer">
            <p>© 2023 Universidad de Costa Rica - Tel. 2511-4000. Aviso Legal. 
                Última actualización: julio, 2023</p>
        </footer>
    </body>
</html>