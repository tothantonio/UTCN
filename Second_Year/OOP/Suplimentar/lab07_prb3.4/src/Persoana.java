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
        //sortez dupa varsta
        Persoana p = (Persoana) o;
        return varsta - p.varsta;
    }
}
