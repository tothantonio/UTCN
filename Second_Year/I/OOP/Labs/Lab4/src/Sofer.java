public class Sofer {
    private String nume;
    private int varsta;
    private int numarPermisConducere;

    public Sofer(String nume, int varsta, int numarPermisConducere) {
        this.nume = nume;
        this.varsta = varsta;
        this.numarPermisConducere = numarPermisConducere;
    }

    public String getNume(String nume) {
        return nume;
    }

    public int getVarsta(int varsta) {
        return varsta;
    }

    public int getNumarPermisConducere(int numarPermisConducere) {
        return numarPermisConducere;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public void setVarsta(int varsta) {
        this.varsta = varsta;
    }

    public void setNumarPermisConducere(int numarPermisConducere) {
        this.numarPermisConducere = numarPermisConducere;
    }

    public String toString() {
        return "Sofer {" +
                "nume = '" + nume + '\'' +
                ", varsta = " + varsta +
                ", numarPermisConducere = " + numarPermisConducere +
                '}';
    }
}

