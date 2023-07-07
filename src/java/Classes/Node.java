/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * Node represents a node in a linked list.
 * It contains a reservation object and references to the next and previous nodes.
 */
public class Node {
    Reservation reservation;
    Node next;
    Node previous;

    /**
     * Constructor for the Node class.
     * Initializes the reservation and sets next and previous nodes to null.
     * @param reservation The Reservation object to be stored in the node.
     */
    public Node(Reservation reservation) {
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

    /**
     * Retrieves the next node.
     * @return The next node.
     */
    public Node getNext() {
        return next;
    }

    /**
     * Sets the next node.
     * @param next The next node to be set.
     */
    public void setNext(Node next) {
        this.next = next;
    }
}
