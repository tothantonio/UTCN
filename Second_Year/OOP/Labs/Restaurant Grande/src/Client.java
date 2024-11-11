public class Client {
    private String nume;
    private Order[] orders;

    public Client(String nume) {
        this.nume = nume;
        this.orders = new Order[0];
    }

    public String getNume() {
        return nume;
    }

    public Order[] getOrders() {
        return orders;
    }

    public void addOrder(Order order) {
        Order[] newOrders = new Order[orders.length + 1];
        for (int i = 0; i < orders.length; i++) {
            newOrders[i] = orders[i];
        }
        newOrders[orders.length] = order;
        orders = newOrders;
    }
}
