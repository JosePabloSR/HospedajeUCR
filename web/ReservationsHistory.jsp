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
        <title>Reservas</title>
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
        ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
        Connection connection = mysql.conectar();
    %>
    <%
        DoublyLinkedList listaEnlazada = new DoublyLinkedList();
       
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM hosting_history");

            while (resultSet.next()) {
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

                Reservation reservacion = new Reservation(idCuarto, idCama, fechaEntrada, horaEntrada,
                        fechaSalida, horaSalida, nombreReservador, idReservado, nombreReservado, estadoReservacion);

                listaEnlazada.agregarReservacion(reservacion);
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
            <title>Historial de reservaciones</title>
        </head>
        <body>
            <h1>Historial de reservaciones</h1>
            <form method="post" action="SearchReservation.jsp">
                <div class="form-group">
                    <label for="searchName">Digite el nombre de la persona reservada que desea buscar:</label>
                    <input type="text" class="form-control" id="searchName" name="searchName" required>
                </div>
                <button type="submit" class="btn btn-dark">Buscar reservación</button>

            </form>
            <br></br>
            <form method="post" action="DeleteAllData.jsp">
                <button type="submit" class="btn-right">Eliminar todos los datos</button>
            </form>
            <br></br>
            <table>
                <tr>
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
                </tr>
                
                <%
                    NodeDoubleLinked temp = listaEnlazada.getHead();
                    while (temp != null) {
                        Reservation reservacion = temp.getReservation();
                %>
                <tr>
                    <td><%= reservacion.getRoom_id()%></td>
                    <td><%= reservacion.getBed_id()%></td>
                    <td><%= reservacion.getArrive_date()%></td>
                    <td><%= reservacion.getArrive_hour()%></td>
                    <td><%= reservacion.getDeparture_date()%></td>
                    <td><%= reservacion.getDeparture_hour()%></td>
                    <td><%= reservacion.getReservator_name()%></td>
                    <td><%= reservacion.getReserved_id()%></td>
                    <td><%= reservacion.getReserved_name()%></td>
                    <td><%= reservacion.getReservation_state() == null ? "Sin estado" : reservacion.getReservation_state()%></td>
                </tr>
                <%
                        temp = temp.siguiente;
                    }
                %>
            </table>
        </body>
    </html>


