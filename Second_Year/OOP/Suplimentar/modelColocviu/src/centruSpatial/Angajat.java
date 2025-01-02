package centruSpatial;

public abstract class Angajat implements ActivitateAngajat{
    private String nume;

    public Angajat(String nume) {this.nume = nume;}

    public String getNume() {return nume;}
}
