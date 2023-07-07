/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

import java.sql.Time;
import java.util.Date;

/**
 * Reservation represents a reservation for a room and bed.
 * It contains information such as reservation ID, room ID, bed ID, arrival and departure dates,
 * the name of the person making the reservation, and the state of the reservation.
 */
public class Reservation {
    
     private int reservation_id;
    private int room_id;
    private int bed_id;
    private Date arrive_date;
    private Time arrive_hour;
    private Date departure_date;
    private Time departure_hour;
    private String reservator_name;
    private String reserved_id;
    private String reserved_name;
    private String reservation_state;

    /**
     * Constructor for the Reservation class.
     * Initializes the reservation with the provided values.
     * @param reservation_id The ID of the reservation.
     * @param room_id The ID of the room.
     * @param bed_id The ID of the bed.
     * @param arrive_date The arrival date.
     * @param arrive_hour The arrival time.
     * @param departure_date The departure date.
     * @param departure_hour The departure time.
     * @param reservator_name The name of the person making the reservation.
     * @param reserved_id The ID of the person being reserved for.
     * @param reserved_name The name of the person being reserved for.
     * @param reservation_state The state of the reservation.
     */
    public Reservation(int reservation_id, int room_id, int bed_id, Date arrive_date, Time arrive_hour, Date departure_date, Time departure_hour, String reservator_name, String reserved_id, String reserved_name, String reservation_state) {
        this.reservation_id = reservation_id;
        this.room_id = room_id;
        this.bed_id = bed_id;
        this.arrive_date = arrive_date;
        this.arrive_hour = arrive_hour;
        this.departure_date = departure_date;
        this.departure_hour = departure_hour;
        this.reservator_name = reservator_name;
        this.reserved_id = reserved_id;
        this.reserved_name = reserved_name;
        this.reservation_state = reservation_state;
    }

    /**
     * Alternate constructor for the Reservation class.
     * Initializes the reservation with the provided values.
     * The reservation ID is not specified and will be assigned later.
     * @param room_id The ID of the room.
     * @param bed_id The ID of the bed.
     * @param arrive_date The arrival date.
     * @param arrive_hour The arrival time.
     * @param departure_date The departure date.
     * @param departure_hour The departure time.
     * @param reservator_name The name of the person making the reservation.
     * @param reserved_id The ID of the person being reserved for.
     * @param reserved_name The name of the person being reserved for.
     * @param reservation_state The state of the reservation.
     */
    public Reservation(int room_id, int bed_id, Date arrive_date, Time arrive_hour, Date departure_date, Time departure_hour, String reservator_name, String reserved_id, String reserved_name, String reservation_state) {
        this.room_id = room_id;
        this.bed_id = bed_id;
        this.arrive_date = arrive_date;
        this.arrive_hour = arrive_hour;
        this.departure_date = departure_date;
        this.departure_hour = departure_hour;
        this.reservator_name = reservator_name;
        this.reserved_id = reserved_id;
        this.reserved_name = reserved_name;
        this.reservation_state = reservation_state;
    }

    /**
     * Constructor for the Reservation class.
     * Initializes the reservation with the provided reserved ID and reservation state.
     * @param reserved_id The ID of the person being reserved for.
     * @param reservation_state The state of the reservation.
     */
    public Reservation(String reserved_id, String reservation_state) {
        this.reserved_id = reserved_id;
        this.reservation_state = reservation_state;
    }

    /**
     * Constructor for the Reservation class.
     * Initializes the reservation with the provided reserved name.
     * @param reserved_name The name of the person being reserved for.
     */
    public Reservation(String reserved_name) {
        this.reserved_name = reserved_name;
    }

    /**
     * Default constructor for the Reservation class.
     */
    public Reservation() {
    }

    // Getters and Setters

    public int getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getBed_id() {
        return bed_id;
    }

    public void setBed_id(int bed_id) {
        this.bed_id = bed_id;
    }

    public Date getArrive_date() {
        return arrive_date;
    }

    public void setArrive_date(Date arrive_date) {
        this.arrive_date = arrive_date;
    }

    public Time getArrive_hour() {
        return arrive_hour;
    }

    public void setArrive_hour(Time arrive_hour) {
        this.arrive_hour = arrive_hour;
    }

    public Date getDeparture_date() {
        return departure_date;
    }

    public void setDeparture_date(Date departure_date) {
        this.departure_date = departure_date;
    }

    public Time getDeparture_hour() {
        return departure_hour;
    }

    public void setDeparture_hour(Time departure_hour) {
        this.departure_hour = departure_hour;
    }

    public String getReservator_name() {
        return reservator_name;
    }

    public void setReservator_name(String reservator_name) {
        this.reservator_name = reservator_name;
    }

    public String getReserved_id() {
        return reserved_id;
    }

    public void setReserved_id(String reserved_id) {
        this.reserved_id = reserved_id;
    }

    public String getReserved_name() {
        return reserved_name;
    }

    public void setReserved_name(String reserved_name) {
        this.reserved_name = reserved_name;
    }

    public String getReservation_state() {
        return reservation_state;
    }

    public void setReservation_state(String reservation_state) {
        this.reservation_state = reservation_state;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservation_id=" + reservation_id +
                ", room_id=" + room_id +
                ", bed_id=" + bed_id +
                ", arrive_date=" + arrive_date +
                ", arrive_hour=" + arrive_hour +
                ", departure_date=" + departure_date +
                ", departure_hour=" + departure_hour +
                ", reservator_name='" + reservator_name + '\'' +
                ", reserved_id='" + reserved_id + '\'' +
                ", reserved_name='" + reserved_name + '\'' +
                ", reservation_state='" + reservation_state + '\'' +
                '}';
    }
    
    
}
