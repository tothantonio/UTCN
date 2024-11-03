public abstract class Persoana {
    protected int id;
    protected String nume;
    protected Carte[] cartiImprumutate;
    protected int nrCartiImprumutate = 0;

    public Persoana(int id, String nume, int maxCarti) {
        this.id = id;
        this.nume = nume;
        this.cartiImprumutate = new Carte[maxCarti];
    }

    public int getId() {return id;}
    public String getNume() {return nume;}
    public int getNumarCarti() {return nrCartiImprumutate;}
    public void adaugaCarteImprumutata(Carte carte) {
        this.cartiImprumutate[nrCartiImprumutate] = carte;
    }
    public String toString() {
        return "Persoana [id=" + id + ", nume=" + nume + "]";
    }
}
