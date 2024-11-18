public class Persoana {
    private String nume;
    private String prenume;
    private int varsta;

    public Persoana(String nume, String prenume, int varsta) {
        this.nume = nume;
        this.prenume = prenume;
        this.varsta = varsta;
    }

    public int compareTo(Object o) {
        //sortez dupa nume alfabetic
        Persoana p = (Persoana) o;
        return nume.compareTo(p.nume);
    }

    public String toString() {
        return nume + " " + prenume + " " + varsta;
    }
}
