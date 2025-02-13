public abstract class Preparate {
    private String nume;
    private double pret;

    public Preparate(String nume, double pret) {
        this.nume = nume;
        this.pret = pret;
    }

    public String getNume() {
        return nume;
    }

    public double getPret() {
        return pret;
    }

    public abstract String getType();
}
