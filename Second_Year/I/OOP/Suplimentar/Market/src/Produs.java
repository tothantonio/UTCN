public abstract class Produs {
    String denumire;
    double pret;

    public Produs(String denumire, double pret) {
        this.denumire = denumire;
        this.pret = pret;
    }

    public abstract String getCategorie();
}
