import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Introduceti numarul total de produse: ");
        int n = sc.nextInt();
        Preparate[] preparate = new Preparate[n];
        for (int i = 0; i < n; i++) {
            System.out.println("Introduceti numele produsului: ");
            String nume = sc.next();
            System.out.println("Introduceti pretul produsului: ");
            double pret = sc.nextDouble();
            System.out.println("Introduceti tipul produsului (Desert/Bautura/Pizza): ");
            String tip = sc.next();
            if (tip.equals("Desert")) {
                preparate[i] = new Desert(nume, pret);
            } else if (tip.equals("Bautura")) {
                preparate[i] = new Bautura(nume, pret);
            } else if (tip.equals("Pizza")) {
                preparate[i] = new Pizza(nume, pret);
            }
        }
        cs
        System.out.println("Toate preparatele sunt:\n");
        for (Preparate preparat : preparate) {
            System.out.println(preparat.getNume() + " " + preparat.getPret() + " " + preparat.getType());
        }

        Client client1 = new Client("John Doe");
        Order order1 = new Order();
        order1.addPreparate(preparate[0]);
        order1.addPreparate(preparate[1]);
        client1.addOrder(order1);

        Order order2 = new Order();
        order2.addPreparate(preparate[2]);
        order2.setStatus("Delivered");
        client1.addOrder(order2);

        System.out.println("Pending orders: ");
        for (Order order : client1.getOrders()) {
            if (order.getStatus().equals("Pending")) {
                System.out.println("Order number: " + order.getOrderNumber() + " with products: " + order.getPreparate() + " with total: " + order.getTotal());
            }
        }
    }
}