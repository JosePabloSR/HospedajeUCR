/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

/**
 *
 * @author dilan
 */
public class CircularLinkedList {
        NodeCircular head;

    // Constructor
    public CircularLinkedList() {
        this.head = null;
    }

    // Método para agregar un nodo a la lista enlazada
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

    // Método para filtrar los datos por estado de reserva
    public void filterByState(String reservation_state) {
        if (head == null) {
            return;
        }

        NodeCircular current = head;
        do {
            Reservation data = current.getData();
            if (data.getReservation_state().equals(reservation_state)) {
                // Puedes imprimir los datos, agregarlos a una nueva lista, etc.
                System.out.println("Reservation ID: " + data.getReservation_id());
                System.out.println("Room ID: " + data.getRoom_id());
                System.out.println("Bed ID: " + data.getBed_id());
                System.out.println("Arrive_date: " + data.getArrive_date());
                System.out.println("Arrive_hour: " + data.getArrive_hour());
                System.out.println("Departure_date: " + data.getDeparture_date());
                System.out.println("Departure_hour: " + data.getDeparture_hour());
                System.out.println("Reservator_name: " + data.getReservator_name());
                System.out.println("Reserved_id: " + data.getReserved_id());
                System.out.println("Reserved_name: " + data.getReserved_name());
                System.out.println("Reservation_state: " + data.getReservation_state());
                // ... y así sucesivamente para los demás atributos
            }
            current = current.getNext();
        } while (current != head);
    }

    // Getter para obtener el nodo cabeza
    public NodeCircular getHead() {
        return head;
    }
    
    public void clear() {
    head = null;
}
}
