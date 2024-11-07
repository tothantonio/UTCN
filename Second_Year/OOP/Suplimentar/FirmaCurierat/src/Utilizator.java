public class Utilizator {
    private static int uid = 0;
    private String nume;
    private Expeditie[] expeditii;

    public Utilizator(int uid, String nume, Expeditie[] expeditii) {
        this.uid = ++uid;
        this.nume = nume;
        this.expeditii = expeditii;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getNume() {
        return nume;
    }

    public void setExpeditii(Expeditie[] expeditii) {
        this.expeditii = expeditii;
    }

    public Expeditie[] getExpeditii() {
        return expeditii;
    }

    public void afisare() {
        System.out.println("Utilizatorul " + nume + " are urmatoarele expeditii:");
        for (int i = 0; i < expeditii.length; i++) {
            System.out.println(expeditii[i].getSursa() + " -> " + expeditii[i].getDestinatie() + " (" + expeditii[i].getDistanta() + " km)");
        }
    }
}
