/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class NodeCircular {

     Reservation data;
     NodeCircular next;

    // Constructor
    public NodeCircular(Reservation data) {
        this.data = data;
        this.next = null;
    }

    // Métodos getter y setter para data
    public Reservation getData() {
        return data;
    }

    public void setData(Reservation data) {
        this.data = data;
    }

    // Métodos getter y setter para next
    public NodeCircular getNext() {
        return next;
    }

    public void setNext(NodeCircular next) {
        this.next = next;
    }
}
