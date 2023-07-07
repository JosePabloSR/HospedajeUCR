/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * NodeCircular represents a node in a circular linked list.
 * It contains a reservation object and a reference to the next node.
 */
public class NodeCircular {

    Reservation data;
    NodeCircular next;

    /**
     * Constructor for the NodeCircular class.
     * Initializes the node with the given reservation object.
     * @param data The Reservation object to be stored in the node.
     */
    public NodeCircular(Reservation data) {
        this.data = data;
        this.next = null;
    }

    /**
     * Retrieves the reservation stored in the node.
     * @return The Reservation object.
     */
    public Reservation getData() {
        return data;
    }

    /**
     * Sets the reservation stored in the node.
     * @param data The Reservation object to be set.
     */
    public void setData(Reservation data) {
        this.data = data;
    }

    /**
     * Retrieves the next node in the circular linked list.
     * @return The next NodeCircular object.
     */
    public NodeCircular getNext() {
        return next;
    }

    /**
     * Sets the next node in the circular linked list.
     * @param next The next NodeCircular object to be set.
     */
    public void setNext(NodeCircular next) {
        this.next = next;
    }
}