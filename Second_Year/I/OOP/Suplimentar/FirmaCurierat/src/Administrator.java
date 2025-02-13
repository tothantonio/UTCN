public class Administrator {
    private static int uid = 0;
    private String nume;
    private String functie;
    private Expeditie[] expeditii;

    public Administrator(int uid, String nume, String functie, Expeditie[] expeditii) {
        this.uid = ++uid;
        this.nume = nume;
        this.functie = functie;
        this.expeditii = expeditii;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getNume() {
        return nume;
    }

    public void setFunctie(String functie) {
        this.functie = functie;
    }

    public String getFunctie() {
        return functie;
    }

    public void setExpeditii(Expeditie[] expeditii) {
        this.expeditii = expeditii;
    }

    public Expeditie[] getExpeditii() {
        return expeditii;
    }

    public void afisare() {
        System.out.println("Administratorul " + nume + " are urmatoarele expeditii:");
        for (int i = 0; i < expeditii.length; i++) {
            System.out.println(expeditii[i].getSursa() + " -> " + expeditii[i].getDestinatie() + " (" + expeditii[i].getDistanta() + " km)");
        }
    }
}
