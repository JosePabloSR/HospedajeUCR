/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author josep
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
        this.reservation_state=reservation_state;
    }
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
        this.reservation_state=reservation_state;
    }

    public Reservation() {
    }

    /**
     * @return the reservation_id
     */
    public int getReservation_id() {
        return reservation_id;
    }

    /**
     * @param reservation_id the reservation_id to set
     */
    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    /**
     * @return the room_id
     */
    public int getRoom_id() {
        return room_id;
    }

    /**
     * @param room_id the room_id to set
     */
    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    /**
     * @return the bed_id
     */
    public int getBed_id() {
        return bed_id;
    }

    /**
     * @param bed_id the bed_id to set
     */
    public void setBed_id(int bed_id) {
        this.bed_id = bed_id;
    }

    /**
     * @return the arrive_date
     */
    public Date getArrive_date() {
        return arrive_date;
    }

    /**
     * @param arrive_date the arrive_date to set
     */
    public void setArrive_date(Date arrive_date) {
        this.arrive_date = arrive_date;
    }

    /**
     * @return the arrive_hour
     */
    public Date getArrive_hour() {
        return arrive_hour;
    }

    /**
     * @param arrive_hour the arrive_hour to set
     */
    public void setArrive_hour(Time arrive_hour) {
        this.arrive_hour = arrive_hour;
    }

    /**
     * @return the departure_date
     */
    public Date getDeparture_date() {
        return departure_date;
    }

    /**
     * @param departure_date the departure_date to set
     */
    public void setDeparture_date(Date departure_date) {
        this.departure_date = departure_date;
    }

    /**
     * @return the departure_hour
     */
    public Date getDeparture_hour() {
        return departure_hour;
    }

    /**
     * @param departure_hour the departure_hour to set
     */
    public void setDeparture_hour(Time departure_hour) {
        this.departure_hour = departure_hour;
    }

    /**
     * @return the reservator_id
     */
    public String getReservator_name() {
        return reservator_name;
    }

    /**
     * @param reservator_name
     */
    public void setReservator_name(String reservator_name) {
        this.reservator_name = reservator_name;
    }

    /**
     * @return the reserved_id
     */
    public String getReserved_id() {
        return reserved_id;
    }

    /**
     * @param reserved_id the reserved_id to set
     */
    public void setReserved_id(String reserved_id) {
        this.reserved_id = reserved_id;
    }

    /**
     * @return the reserved_name
     */
    public String getReserved_name() {
        return reserved_name;
    }

    /**
     * @param reserved_name the reserved_name to set
     */
    public void setReserved_name(String reserved_name) {
        this.reserved_name = reserved_name;
    }
    /**
     * 
     * @param reservation_state 
     */
    public String getReservation_state(){
    return reservation_state;
    }
/**
 * 
 * @param reservation_state 
 */
    public void setReservation_state(String reservation_state) {
        this.reservation_state = reservation_state;
    }
    

    @Override
    public String toString() {
        return "Reservation{" + "reservation_id=" + reservation_id + ", room_id=" + room_id + ", bed_id=" + bed_id + ", arrive_date=" + arrive_date + ", arrive_hour=" + arrive_hour + ", departure_date=" + departure_date + ", departure_hour=" + departure_hour + ", reservator_id=" + reservator_name + ", reserved_id=" + reserved_id + ", reserved_name=" + reserved_name + ", reservation_state"+ reservation_state+'}';
    }
    
    
    
}
