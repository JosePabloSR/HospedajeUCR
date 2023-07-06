/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class Linkedlist {
        Node cabeza;
    
    public Linkedlist() {
        this.cabeza = null;
    }

    public void agregar(Reservation reservacion) {
        Node nuevoNodo = new Node(reservacion);

        if (cabeza == null) {
            cabeza = nuevoNodo;
        } else {
            Node temp = cabeza;
            while (temp.getSiguiente() != null) {
                temp = temp.getSiguiente();
            }
            temp.setSiguiente(nuevoNodo);
        }
    }

    public Node getCabeza() {
        return cabeza;
    }
}
