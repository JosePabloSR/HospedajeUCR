/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * CircularLinkedList represents a circular linked list data structure.
 * It allows adding nodes and filtering data by reservation state.
 * The head represents the first node in the linked list.
 */
public class CircularLinkedList {
    NodeCircular head;

    /**
     * Constructor for CircularLinkedList class.
     * Initializes the head of the linked list to null.
     */
    public CircularLinkedList() {
        this.head = null;
    }

    /**
     * Adds a new node to the circular linked list.
     * @param data The Reservation object to be added as the data of the new node.
     */
    public void add(Reservation data) {
        NodeCircular newNode = new NodeCircular(data);

        if (head == null) {
            head = newNode;
            newNode.setNext(head);
        } else {
            NodeCircular current = head;
            while (current.getNext() != head) {
                current = current.getNext();
            }
            current.setNext(newNode);
            newNode.setNext(head);
        }
    }

    /**
     * Filters the data in the circular linked list by reservation state and performs an action on the filtered data.
     * @param reservation_state The reservation state to filter by.
     */
    public void filterByState(String reservation_state) {
        if (head == null) {
            return;
        }

        NodeCircular current = head;
        do {
            Reservation data = current.getData();
            if (data.getReservation_state().equals(reservation_state)) {
                // You can print the data, add it to a new list, etc.
                System.out.println("Reservation ID: " + data.getReservation_id());
                System.out.println("Room ID: " + data.getRoom_id());
                System.out.println("Bed ID: " + data.getBed_id());
                System.out.println("Arrival Date: " + data.getArrive_date());
                System.out.println("Arrival Hour: " + data.getArrive_hour());
                System.out.println("Departure Date: " + data.getDeparture_date());
                System.out.println("Departure Hour: " + data.getDeparture_hour());
                System.out.println("Reservator Name: " + data.getReservator_name());
                System.out.println("Reserved ID: " + data.getReserved_id());
                System.out.println("Reserved Name: " + data.getReserved_name());
                System.out.println("Reservation State: " + data.getReservation_state());
                // ... and so on for the other attributes
            }
            current = current.getNext();
        } while (current != head);
    }

    /**
     * Retrieves the head node of the circular linked list.
     * @return The head node.
     */
    public NodeCircular getHead() {
        return head;
    }

    /**
     * Clears the circular linked list by setting the head to null.
     */
    public void clear() {
        head = null;
    }
}