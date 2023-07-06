/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class DoublyLinkedList {
         NodeDoubleLinked head;

    public DoublyLinkedList() {
        this.head = null;
    }

    public boolean estaVacia() {
        return head == null;
    }

    public void agregarReservacion(Reservation reserva) {
        NodeDoubleLinked nuevoNodo = new NodeDoubleLinked(reserva);
        if (estaVacia()) {
            head = nuevoNodo;
        } else {
            NodeDoubleLinked temp = head;
            while (temp.siguiente != null) {
                temp = temp.siguiente;
            }
            temp.siguiente = nuevoNodo;
            nuevoNodo.anterior = temp;
        }
    }
        public NodeDoubleLinked getHead() {
        return head;
    }
}
