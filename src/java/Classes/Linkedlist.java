/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 * Linkedlist represents a singly linked list data structure.
 * It allows adding reservations and retrieving the head node.
 * The "cabeza" represents the first node in the linked list.
 */
public class Linkedlist {
    Node head;
    
    /**
     * Constructor for LinkedList class.
     * Initializes the "head" of the linked list to null.
     */
    public Linkedlist() {
        this.head = null;
    }

    /**
     * Adds a reservation to the singly linked list.
     * @param reservation The Reservation object to be added.
     */
    public void add(Reservation reservation) {
        Node newNode = new Node(reservation);

        if (head == null) {
            head = newNode;
        } else {
            Node temp = head;
            while (temp.getNext() != null) {
                temp = temp.getNext();
            }
            temp.setNext(newNode);
        }
    }

    /**
     * Retrieves the head node of the singly linked list.
     * @return The head node.
     */
    public Node getHead() {
        return head;
    }
}