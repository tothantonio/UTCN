package centruSpatial;

public class Pilot {
    private String nume;
    private String prenume;
    private int varsta;
    private String grad;

    public Pilot(String nume, String prenume, int varsta, String grad) {
        this.nume = nume;
        this.prenume = prenume;
        this.varsta = varsta;
        this.grad = grad;
    }

    public String toString() {
        return "Pilot " +
                "nume='" + nume + '\'' +
                ", prenume='" + prenume + '\'' +
                ", varsta=" + varsta +
                ", grad='" + grad + '\'';
    }
}
