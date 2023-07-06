<%-- 
    Document   : Reservations
    Created on : 5 jul. 2023, 20:15:56
    Author     : dilan
--%>

<%@page import="databasemysql.ConnectionMysql"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="Classes.Reservation"%>
<%@page import="Classes.Node"%>
<%@page import="Classes.Linkedlist"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tabla de Reservaciones</title>
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
    <%
        ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
        Connection connection = mysql.conectar();
    %>

    <%
        // Obtener datos de la tabla y construir la lista enlazada
        Linkedlist listaEnlazada = new Linkedlist();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM lodging");

            while (resultSet.next()) {
                int idReservacion = resultSet.getInt("reservation_id");
                int idCuarto = resultSet.getInt("room_id");
                int idCama = resultSet.getInt("bed_id");
                Date fechaEntrada = resultSet.getDate("arrive_date");
                Time horaEntrada = resultSet.getTime("arrive_hour");
                Date fechaSalida = resultSet.getDate("departure_date");
                Time horaSalida = resultSet.getTime("departure_hour");
                String nombreReservador = resultSet.getString("reservator_name");
                String idReservado = resultSet.getString("reserved_id");
                String nombreReservado = resultSet.getString("reserved_name");
                String estadoReservacion = resultSet.getString("reservation_state");

                Reservation reservacion = new Reservation(idReservacion, idCuarto, idCama, fechaEntrada, horaEntrada, fechaSalida, horaSalida, nombreReservador, idReservado, nombreReservado, estadoReservacion);

                listaEnlazada.agregar(reservacion);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <%-- Función para actualizar el estado de la reservación --%>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Tabla de Reservaciones</title>
        </head>
        <body>
            <h1>Tabla de Reservaciones</h1>



            <br></br>
            <table>
                <tr>
                    <th>ID Reservación</th>
                    <th>ID Cuarto</th>
                    <th>ID Cama</th>
                    <th>Fecha Entrada</th>
                    <th>Hora Entrada</th>
                    <th>Fecha Salida</th>
                    <th>Hora Salida</th>
                    <th>Nombre Reservador</th>
                    <th>ID Reservado</th>
                    <th>Nombre Reservado</th>
                    <th>Estado Reservación</th>
                    <th>Cambio de estado</th>
                    <th>Opciones de reservación</th>
                </tr>
                <%-- Iterar sobre la lista enlazada y generar las filas de la tabla --%>
                <%
                    Node temp = listaEnlazada.getCabeza();
                    while (temp != null) {
                        Reservation reservacion = temp.getReservacion();
                %>
                <tr>
                    <td><%= reservacion.getReservation_id()%></td>
                    <td><%= reservacion.getRoom_id()%></td>
                    <td><%= reservacion.getBed_id()%></td>
                    <td><%= reservacion.getArrive_date()%></td>
                    <td><%= reservacion.getArrive_hour()%></td>
                    <td><%= reservacion.getDeparture_date()%></td>
                    <td><%= reservacion.getDeparture_hour()%></td>
                    <td><%= reservacion.getReservator_name()%></td>
                    <td><%= reservacion.getReserved_id()%></td>
                    <td><%= reservacion.getReserved_name()%></td>
                    <td><%= reservacion.getReservation_state() == null ? "Sin estado":reservacion.getReservation_state()%></td>
                    <td><div class="form-group"><form action="UpdateReservation.jsp">
                                <label for="cama">Estado</label>
                                <select class="form-control" id="estado" name="ESTADO" required>
                                    <option value="En espera">En espera</option>
                                    <option value="Aceptada">Aceptada</option>
                                    <option value="Rechazada">Rechazada</option>
                                    <option value="Concluida">concluida</option>
                                </select>
                                <input hidden="true"type="text" name="roo_id" id="id" value="<%=reservacion.getRoom_id()%>">
                                <input hidden="true"type="text" name="be_id" id="id" value="<%=reservacion.getBed_id()%>">
                                <input hidden="true"type="text" name="arrive_dat" id="id" value="<%=reservacion.getArrive_date()%>">
                                <input hidden="true"type="text" name="arrive_hou" id="id" value="<%=reservacion.getArrive_hour()%>">
                                <input hidden="true"type="text" name="departure_dat" id="id" value="<%=reservacion.getDeparture_date()%>">
                                <input hidden="true"type="text" name="departure_hou" id="id" value="<%=reservacion.getDeparture_hour()%>">
                                <input hidden="true"type="text" name="reservator_nam" id="id" value="<%=reservacion.getReservator_name()%>">
                                <input hidden="true"type="text" name="reserv_id" id="id" value="<%=reservacion.getReserved_id()%>">
                                <input hidden="true"type="text" name="reserved_nam" id="id" value="<%=reservacion.getReserved_name()%>">
                                <button type="submit" class="btn btn-dark">actualizar</button>
                        </div></td></form>
                    <td><form action="DeleteReservation.jsp">
                            <input 
                                hidden="true"
                                type="text" 
                                name="eliminar" 
                                id="id" 
                                value="<%=reservacion.getReserved_id()%>">
                            <input                                        
                                class="bottom-100" 
                                type="submit"                                                                              
                                value="Eliminar" >
                        </form></td>
                </tr>
                <% temp = temp.getSiguiente();
                    }%>
            </table>
        </body>
    </html>
