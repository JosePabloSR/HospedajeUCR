/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class Node {
    Reservation reservacion;
     Node siguiente;
     Node anterior;

    public Node(Reservation reservacion) {
        this.reservacion = reservacion;
        this.siguiente = null;
        this.anterior = null;
    }

    public Reservation getReservacion() {
        return reservacion;
    }

    public Node getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Node siguiente) {
        this.siguiente = siguiente;
    }
}
