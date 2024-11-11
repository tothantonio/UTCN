public abstract class Angajat {
    protected String nume;
    protected int varsta;
    protected int aniExperienta;
    protected double tarifPerOra;

    public Angajat() {
        nume = "Emi";
        varsta = 32;
        aniExperienta = 2;
        tarifPerOra = 40;
    }

    public Angajat(String nume, int varsta, int aniExperienta, double tarifPerOra) {
        this.nume = nume;
        this.varsta = varsta;
        this.aniExperienta = aniExperienta;
        this.tarifPerOra = tarifPerOra;
    }

    public abstract double calculeazaSalariu(int nrOreLucrate);

    public String getNume() {
        return nume;
    }
}