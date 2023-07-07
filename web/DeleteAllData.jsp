<%-- 
    Document   : DeleteAllData
    Created on : 6 jul. 2023, 19:45:15
    Author     : dilan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="databasemysql.ConnectionMysql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%
  ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
  Connection connection = mysql.conectar();

  try {
    Statement statement = connection.createStatement();
    String query = "DELETE FROM hosting_history";
    int rowCount = statement.executeUpdate(query);
    // Verificar el número de filas afectadas o mostrar un mensaje de éxito

    statement.close();
    connection.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
  response.sendRedirect("ReservationsHistory.jsp");
%>

