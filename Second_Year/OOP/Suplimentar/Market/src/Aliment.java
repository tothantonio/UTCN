public class Aliment extends Produs{

    public Aliment(String denumire, double pret) {
        super(denumire, pret);
    }

    public String getCategorie() {
        return "Aliment";
    }
}
