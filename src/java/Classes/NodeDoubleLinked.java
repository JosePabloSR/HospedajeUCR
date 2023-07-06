/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class NodeDoubleLinked {
        public Reservation reserva;
    public NodeDoubleLinked siguiente;
    public NodeDoubleLinked anterior;

    public NodeDoubleLinked(Reservation reserva) {
        this.reserva = reserva;
        this.siguiente = null;
        this.anterior = null;
    }
        public Reservation getReservation() {
        return reserva;
    }
}
