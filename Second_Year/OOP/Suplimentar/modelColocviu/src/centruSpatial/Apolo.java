package centruSpatial;

import java.util.ArrayList;

public class Apolo extends Aeronava{

    private ArrayList<String> planeteDestinatie;

    public Apolo(String nume, int maxKm, String culoare, int anFabricatie, ArrayList<String> planeteDestinatie) {
        super(nume, maxKm, culoare, anFabricatie);
        this.planeteDestinatie = planeteDestinatie;
    }

    public ArrayList<String> getPlaneteDestinatie() {return planeteDestinatie;}
    public String toString() {return super.toString() + ", Planete Destinatie=" + planeteDestinatie;}
}
