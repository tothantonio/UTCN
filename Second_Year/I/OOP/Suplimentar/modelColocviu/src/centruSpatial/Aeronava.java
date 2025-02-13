package centruSpatial;

public abstract class Aeronava implements Comparable<Aeronava> {
    private String nume;
    private int maxKm;
    private String culoare;
    private int anFabricatie;

    public Aeronava(String nume, int maxKm, String culoare, int anFabricatie) {
        this.nume = nume;
        this.maxKm = maxKm;
        this.culoare = culoare;
        this.anFabricatie = anFabricatie;
    }

    public String getNume() {return nume;}
    public int compareTo(Aeronava aeronava) {return this.nume.compareTo(aeronava.nume);}

    public String toString() {
        return "Aeronava " +
                "nume='" + nume + '\'' +
                ", maxKilometri=" + maxKm +
                ", culoare='" + culoare + '\'' +
                ", anFabricatie=" + anFabricatie;
    }
}
