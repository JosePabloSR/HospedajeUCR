/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * DoublyLinkedList represents a doubly linked list data structure.
 * It allows adding reservations and checking if the list is empty.
 * The head represents the first node in the linked list.
 */
public class DoublyLinkedList {
    NodeDoubleLinked head;

    /**
     * Constructor for DoublyLinkedList class.
     * Initializes the head of the linked list to null.
     */
    public DoublyLinkedList() {
        this.head = null;
    }

    /**
     * Checks if the doubly linked list is empty.
     * @return true if the list is empty, false otherwise.
     */
    public boolean isEmpty() {
        return head == null;
    }

    /**
     * Adds a reservation to the doubly linked list.
     * @param reservation The Reservation object to be added.
     */
    public void addReservation(Reservation reservation) {
        NodeDoubleLinked newNode = new NodeDoubleLinked(reservation);
        if (isEmpty()) {
            head = newNode;
        } else {
            NodeDoubleLinked temp = head;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = newNode;
            newNode.previous = temp;
        }
    }

    /**
     * Retrieves the head node of the doubly linked list.
     * @return The head node.
     */
    public NodeDoubleLinked getHead() {
        return head;
    }
}