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
  // Establishing a connection to the MySQL database
  ConnectionMysql mysql = new ConnectionMysql("portal_sede_sur_users");
  Connection connection = mysql.conectar();

  try {
    // Creating a statement object for executing SQL queries
    Statement statement = connection.createStatement();

    // Deleting all data from the "hosting_history" table
    String query = "DELETE FROM hosting_history";
    int rowCount = statement.executeUpdate(query);
    // Verificar el número de filas afectadas o mostrar un mensaje de éxito

    // Closing the statement and connection
    statement.close();
    connection.close();
  } catch (Exception e) {
    // Handling any exceptions that occur and printing the stack trace
    e.printStackTrace();
  }

  // Redirecting to the "ReservationsHistory.jsp" page
  response.sendRedirect("ReservationsHistory.jsp");
%>

