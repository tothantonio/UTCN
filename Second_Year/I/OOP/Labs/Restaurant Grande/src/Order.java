public class Order {
    private int orderCount = 0;
    private int orderNumber;
    private Preparate[] preparate;
    private String status;

    public Order() {
        this.preparate = new Preparate[10];
        this.status = "Pending";
        this.orderNumber = ++orderCount;
    }

    public void addPreparate(Preparate preparat) {
        for (int i = 0; i < preparate.length; i++) {
            if (preparate[i] == null) {
                preparate[i] = preparat;
                break;
            }
        }
    }

    public double getTotal() {
        double total = 0;
        for (Preparate preparat : preparate) {
            if (preparat != null) {
                total += preparat.getPret();
            }
        }
        return total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public String getPreparate() {
        String result = "";
        for (Preparate preparat : preparate) {
            if (preparat != null) {
                result += preparat.getNume() + ", ";
            }
        }
        return result;
    }
}
