package centruSpatial;

import java.util.ArrayList;
import java.util.List;

public class CentruSpatial {
    private ArrayList<Apolo> aeronave = new ArrayList<>();

    public void adaugaAeronava(Apolo apolo) {aeronave.add(apolo);}

    public void afiseazaAeronave() {
        for (Apolo apolo : aeronave) {
            System.out.println(apolo);
        }
    }

    public void pleacaRacheta(Apolo apolo, int anPlecare) {apolo.setAnPlecare(anPlecare);}

    public void printRachetaPlecareDupa(int an) throws NoRachetaException {
        List<Apolo> racheteDupaData = new ArrayList<>();
        for (Apolo apolo : aeronave) {
            if (apolo.getAnPlecare() > an) {
                racheteDupaData.add(apolo);
            }
        }
        if (racheteDupaData.isEmpty()) {
            throw new NoRachetaException("Nu exista rachete plecate dupa de data de " + an);
        }
        for (Apolo apolo : racheteDupaData) {
            System.out.println(apolo);
        }
    }

    public int getNumarAeronave() {return aeronave.size();}
}