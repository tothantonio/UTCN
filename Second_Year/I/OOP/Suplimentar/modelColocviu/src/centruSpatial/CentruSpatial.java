package centruSpatial;

import java.util.ArrayList;
import java.util.List;

public class CentruSpatial {
    private ArrayList<Aeronava> aeronave = new ArrayList<>();

    public void adaugaAeronava(Aeronava aeronava) {aeronave.add(aeronava);}

    public void afiseazaAeronave() {
        for (Aeronava apolo : aeronave) {
            System.out.println(apolo);
        }
    }

    public void pleacaRacheta(Apolo apolo, int anPlecare) {apolo.setAnPlecare(anPlecare);}

    public void printRachetaPlecareDupa(int an) throws NoRachetaException {
        List<Apolo> racheteDupaData = new ArrayList<>();
        for (Aeronava aeronava : aeronave) {
            if(aeronava instanceof Apolo) {
                if (((Apolo) aeronava).getAnPlecare() > an) {
                    racheteDupaData.add((Apolo) aeronava);
                }
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

    public void afisareSortareAlfabetic() {
        aeronave.sort(Aeronava::compareTo);
        for (Aeronava aeronava : aeronave) {
            System.out.println(aeronava);
        }
    }
}