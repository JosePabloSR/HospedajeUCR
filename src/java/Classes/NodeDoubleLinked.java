/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * NodeDoubleLinked represents a node in a doubly linked list.
 * It contains a reservation object and references to the next and previous nodes.
 */
public class NodeDoubleLinked {
    public Reservation reservation;
    public NodeDoubleLinked next;
    public NodeDoubleLinked previous;

    /**
     * Constructor for the NodeDoubleLinked class.
     * Initializes the node with the given reservation object.
     * @param reservation The Reservation object to be stored in the node.
     */
    public NodeDoubleLinked(Reservation reservation) {
        this.reservation = reservation;
        this.next = null;
        this.previous = null;
    }

    /**
     * Retrieves the reservation stored in the node.
     * @return The Reservation object.
     */
    public Reservation getReservation() {
        return reservation;
    }
}
