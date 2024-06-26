/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package databasemysql;

import Users.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 * This class represents a connection to a MySQL database.
 * @author dilan
 */
public class ConnectionMysql {

    // Establecer la conexión
    String bd = "portal_sede_sur_users";
    String url = "jdbc:mysql://localhost:3306/";
    String usuario = "root";
    String contraseña = "J0s1254";
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx;
    /**
     * Constructs a ConnectionMysql object with the specified database name.
     * @param bd The name of the database.
     */
    public ConnectionMysql(String bd) {
        this.bd = bd;
        cx = connect();
    }
    /**
     * Connects to the MySQL database.
     * @return The connection object.
     */
    public Connection connect() {
        try {
            Class.forName(driver);
            try {
                cx = DriverManager.getConnection(url + bd, usuario, contraseña);
                System.out.println("ingreso " + bd);
            } catch (SQLException ex) {

                Logger.getLogger(ConnectionMysql.class.getName()).log(Level.SEVERE, null, ex);

            }
        } catch (ClassNotFoundException ex) {
            System.out.println("no ingreso " + bd);
            Logger.getLogger(ConnectionMysql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cx;

    }
    /**
     * Retrieves a list of users from the database.
     * @return An ArrayList of User objects.
     * @throws SQLException If an SQL exception occurs.
     */
    public ArrayList<User> getUsers() throws SQLException {
        Statement stmt = cx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users;");
        ArrayList<User> users = new ArrayList<>();
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("user_name");
                String password = rs.getString("password");
                String acLevel = rs.getString("access_level");
                Date dateCreated = rs.getDate("date_created");
                String appAccess = rs.getString("app_access");
                Date dateUpdate = rs.getDate("date_modify");

                User user = new User(id, userName, password, acLevel,
                        dateCreated, appAccess, dateUpdate);
                users.add(user);

            }
            return users;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;

        } finally {
            rs.close();

        }
    }
    /**
     * Deletes a user with the specified ID from the database.
     * @param id The ID of the user to be deleted.
     * @return true if the user was successfully deleted, false otherwise.
     */
    public boolean deleteUser(int id) {
        try {

            String query = "delete from users where id = ?";
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setInt(1, id);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }
    /**
     * Updates a user in the database with the provided user object.
     * @param user The User object containing the updated information.
     * @return true if the user was successfully updated, false otherwise.
     */
    public boolean updateUser(User user) {
        System.out.println(user.toString());
        Calendar calendar = Calendar.getInstance();
        java.sql.Date updateDate = new java.sql.Date(calendar.getTime().getTime());
        try {

            String query = "UPDATE users "
                    + "     SET user_name = ?, password= ?, access_level= ?,  app_access= ?,  date_modify= ?"
                    + "     WHERE id = " + user.getId() + ";";

            PreparedStatement preparedStmt = cx.prepareStatement(query);

            preparedStmt.setString(1, user.getUserName());
            preparedStmt.setString(2, user.getPassword());
            preparedStmt.setString(3, user.getAccessLevel());
            preparedStmt.setString(4, user.getAppAccess());
            preparedStmt.setDate(5, updateDate);

            // execute the preparedstatement
            preparedStmt.executeUpdate();

            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }
    /**
     * Validates a user's credentials in the database.
     * @param userName The username of the user.
     * @param password The password of the user.
     * @return true if the user's credentials are valid, false otherwise.
     * @throws SQLException If an SQL exception occurs.
     */
    public boolean userValidation(String userName, String password) throws SQLException {
        cx = connect();
        Statement stmt = cx.createStatement();
        String consulta = "select * from users where user_name ='" + userName.trim() + "' and password = '" + password.trim() + "';";
        System.out.println(consulta);
        ResultSet rs = stmt.executeQuery(consulta);

        try {
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } finally {
            try {
                rs.close();
            } catch (SQLException ignore) {
                System.out.println("Exeption on login: " + ignore.getMessage());
            }
        }

    }
    /**
     * Inserts a new user into the database.
     * @param userName The username of the user.
     * @param password The password of the user.
     * @param level The access level of the user.
     * @return true if the user was successfully inserted, false otherwise.
     */
    public boolean insertUser(String userName, String password, String level) {

        try {
            Calendar calendar = Calendar.getInstance();
            java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());

            // the mysql insert statement
            String query = " insert into users (user_name, password, access_level, date_created, app_access)"
                    + " values (?, ?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setString(1, userName);
            preparedStmt.setString(2, password);
            preparedStmt.setString(3, level);
            preparedStmt.setDate(4, startDate);
            preparedStmt.setString(5, "Hotel");

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

        return false;
    }
    /**
     * Inserts a new reservation into the database.
     * @param room_id The ID of the room for the reservation.
     * @param bed_id The ID of the bed for the reservation.
     * @param arrive_date The arrival date of the reservation.
     * @param arrive_hour The arrival hour of the reservation.
     * @param departure_date The departure date of the reservation.
     * @param departure_hour The departure hour of the reservation.
     * @param reservator_name The name of the reservator.
     * @param reserved_id The ID of the reserved item.
     * @param reserved_name The name of the reserved item.
     * @return true if the reservation was successfully inserted, false otherwise.
     * @throws SQLException If an SQL exception occurs.
     * @throws ParseException If a parsing exception occurs.
     */
    public boolean insertReservation(String room_id, String bed_id, String arrive_date, String arrive_hour, String departure_date, String departure_hour, String reservator_name, String reserved_id, String reserved_name) throws SQLException, ParseException {
        int room_ids = Integer.parseInt(room_id);
        int bed_ids = Integer.parseInt(bed_id);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        LocalTime arrive_hours = parsearHora(arrive_hour);
        Time tiempoBD = Time.valueOf(arrive_hours);
        java.sql.Date arrive_dates = new java.sql.Date(formato.parse(arrive_date).getTime());
        java.sql.Date departure_dates = new java.sql.Date(formato.parse(departure_date).getTime());
        LocalTime departure_hours = parsearHora(departure_hour);
        Time tiempoBDs = Time.valueOf(departure_hours);
        try {
            // the mysql insert statement
            String query = " insert into lodging (room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setInt(1, room_ids);
            preparedStmt.setInt(2, bed_ids);
            preparedStmt.setDate(3, arrive_dates);
            preparedStmt.setTime(4, tiempoBD);
            preparedStmt.setDate(5, departure_dates);
            preparedStmt.setTime(6, tiempoBDs);
            preparedStmt.setString(7, reservator_name);
            preparedStmt.setString(8, reserved_id);
            preparedStmt.setString(9, reserved_name);

            // execute the preparedstatement
            preparedStmt.execute();

            int room_ids2 = Integer.parseInt(room_id);
            int bed_ids2 = Integer.parseInt(bed_id);
            SimpleDateFormat formato2 = new SimpleDateFormat("yyyy-MM-dd");
            LocalTime arrive_hours2 = parsearHora(arrive_hour);
            Time tiempoBD2 = Time.valueOf(arrive_hours);
            java.sql.Date arrive_dates2 = new java.sql.Date(formato.parse(arrive_date).getTime());
            java.sql.Date departure_dates2 = new java.sql.Date(formato.parse(departure_date).getTime());
            LocalTime departure_hours2 = parsearHora(departure_hour);
            Time tiempoBDs2 = Time.valueOf(departure_hours);
            String reservator_names = reservator_name;
            String reserved_ids = reserved_id;
            String reserved_names = reserved_name;

            String query2 = " insert into hosting_history (room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt2 = cx.prepareStatement(query2);
            preparedStmt2.setInt(1, room_ids2);
            preparedStmt2.setInt(2, bed_ids2);
            preparedStmt2.setDate(3, arrive_dates2);
            preparedStmt2.setTime(4, tiempoBD2);
            preparedStmt2.setDate(5, departure_dates2);
            preparedStmt2.setTime(6, tiempoBDs2);
            preparedStmt2.setString(7, reservator_names);
            preparedStmt2.setString(8, reserved_ids);
            preparedStmt2.setString(9, reserved_names);
            preparedStmt2.execute();
            cx.close();
            return true;
        } catch (Exception ex) {
            System.out.println("Fallo la inserción" + ex.getMessage());
        }

        return false;
    }
    /**
     * Parses a string representation of an hour into a LocalTime object.
     * @param arrive_hour The string representation of the hour.
     * @return The parsed LocalTime object.
     */
    public LocalTime parsearHora(String arrive_hour) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalTime hora = null;

        try {
            hora = LocalTime.parse(arrive_hour, formatter);
        } catch (DateTimeParseException e) {
            System.out.println("Error al parsear la cadena: " + e.getMessage());
        }

        return hora;
    }
    /**
     * Deletes a reservation with the specified reserved ID from the database.
     * @param reserved_id The reserved ID of the reservation to be deleted.
     * @return true if the reservation was successfully deleted, false otherwise.
     */
    public boolean deleteReservation(String reserved_id) {
        try {

            String query = "delete from lodging where reserved_id = ?";
            PreparedStatement preparedStmt = cx.prepareStatement(query);
            preparedStmt.setString(1, reserved_id);

            // execute the preparedstatement
            preparedStmt.execute();

            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }
    /**
     * Updates the reservation state of a reservation in the database.
     * @param room_id The ID of the room for the reservation.
     * @param bed_id The ID of the bed for the reservation.
     * @param arrive_date The arrival date of the reservation.
     * @param arrive_hour The arrival hour of the reservation.
     * @param departure_date The departure date of the reservation.
     * @param departure_hour The departure hour of the reservation.
     * @param reservator_name The name of the reservator.
     * @param reserved_name The name of the reserved item.
     * @param reserved_id The ID of the reserved item.
     * @param reservation_state The new reservation state.
     * @return true if the reservation state was successfully updated, false otherwise.
     */
    public boolean updateReservationState(String room_id, String bed_id, String arrive_date, String arrive_hour, String departure_date, String departure_hour, String reservator_name, String reserved_name, String reserved_id, String reservation_state) {
        try {
            System.out.println("reservation_state = " + reservation_state);
            System.out.println("reserved_id = " + reserved_id);
            String query = "UPDATE lodging SET reservation_state = ? WHERE reserved_id = " + reserved_id + ";";

            PreparedStatement preparedStmt = cx.prepareStatement(query);

            preparedStmt.setString(1, reservation_state);

            // execute the preparedstatement
            preparedStmt.executeUpdate();
            
        int room_ids2 = Integer.parseInt(room_id);
        int bed_ids2 = Integer.parseInt(bed_id);
        SimpleDateFormat formato3 = new SimpleDateFormat("yyyy-MM-dd");
        LocalTime arrive_hours2 = parsearHora(arrive_hour);
        Time tiempoBD3 = Time.valueOf(arrive_hours2);
        java.sql.Date arrive_dates2 = new java.sql.Date(formato3.parse(arrive_date).getTime());
        java.sql.Date departure_dates2 = new java.sql.Date(formato3.parse(departure_date).getTime());
        LocalTime departure_hours2 = parsearHora(departure_hour);
        Time tiempoBDs3 = Time.valueOf(departure_hours2);
            String query2 = " insert into hosting_history (room_id, bed_id, arrive_date, arrive_hour, departure_date, departure_hour, reservator_name, reserved_id, reserved_name, reservation_state)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt2 = cx.prepareStatement(query2);
            preparedStmt2.setInt(1, room_ids2);
            preparedStmt2.setInt(2, bed_ids2);
            preparedStmt2.setDate(3, (Date) arrive_dates2);
            preparedStmt2.setTime(4, (Time) tiempoBD3);
            preparedStmt2.setDate(5, (Date) departure_dates2);
            preparedStmt2.setTime(6, (Time) tiempoBDs3);
            preparedStmt2.setString(7, reservator_name);
            preparedStmt2.setString(8, reserved_id);
            preparedStmt2.setString(9, reserved_name);
            preparedStmt2.setString(10, reservation_state);
            preparedStmt2.execute();
            cx.close();
            return true;
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
            return false;
        }

    }

}
