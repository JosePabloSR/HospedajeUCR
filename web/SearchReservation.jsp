<%-- 
    Document   : SearchReservation
    Created on : 6 jul. 2023, 03:28:40
    Author     : dilan
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda de reservaciones</title>
    </head>
    <body>
        <h1>Bienvenido a la busqueda de reservaciones</h1>

        <div class="form-group">
            <label for="nombreReservado">Nombre de la persona asociada a la reservación:</label>
            <input type="text" class="form-control" id="nombreReservacion" name="nombreReservado" required>
        </div>

        <form method="POST" action="SearchReservation.jsp">
            <label for="searchInput">Valor de búsqueda:</label>
            <input type="text" id="searchInput" name="searchInput">
            <input type="submit" value="Buscar">
        </form>

        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<String> resultados = (List<String>) request.getAttribute("resultados");
                    for (String resultado : resultados) {
                %>
                <tr>
                    <td><%= resultado%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
