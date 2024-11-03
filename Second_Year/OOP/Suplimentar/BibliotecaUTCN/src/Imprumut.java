public class Imprumut {
    private static int counter = 0;
    private int id;
    private Persoana persoana;
    private Carte carte;
    private Angajat angajat;

    public Imprumut(Persoana persoana, Carte carte, Angajat angajat) {
        this.id = ++counter;
        this.persoana = persoana;
        this.carte = carte;
        this.angajat = angajat;
        persoana.adaugaCarteImprumutata(carte);
    }

    public int getId() { return id; }
    public String toString() {
        return "Imprumut [id = " + id + ", persoana = " + persoana.getNume() + ", carte = " + carte.getNume() + ", angajat = " + angajat.getNume() + "]";
    }
}
