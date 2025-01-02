package centruSpatial;

public class Boeing extends Aeronava{
    private Pilot pilot;
    private int nrPasageri;

    public Boeing(String nume, int maxKm, String culoare, int anFabricatie, Pilot pilot, int nrPasageri) {
        super(nume, maxKm, culoare, anFabricatie);
        this.pilot = pilot;
        this.nrPasageri = nrPasageri;
    }

    public Pilot getPilot() {return pilot;}
    public int getNrPasageri() {return nrPasageri;}
    public String toString() {return super.toString() + ", Pilot=" + pilot + ", Numar Pasageri=" + nrPasageri;}
}
