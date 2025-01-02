package centruSpatial;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;

public class CentruSpatial {
    private ArrayList<Aeronava> aeronave = new ArrayList<>();
    private ArrayList<Apolo> rachetePlecare = new ArrayList<>();
    int dataPlecare;

    public void adaugaAeronava(Aeronava aeronava) {
        aeronave.add(aeronava);
    }

    public void pleacaRacheta(Apolo racheta, int dataPlecare) {
        rachetePlecare.add(racheta);
        this.dataPlecare = dataPlecare;
        System.out.println("Racheta " + racheta.getNume() + " a plecat in anul " + dataPlecare);
    }

    public void printRachetaPlecareDupa(int data) throws NoRachetaException {
        boolean gasit = false;
        for(Apolo racheta : rachetePlecare) {
            if(dataPlecare > data) {
                System.out.println(racheta);
                gasit = true;
            }
        }
        if(!gasit) {
            throw new NoRachetaException("Nu exista rachete plecate dupa de data de " + data);
        }
    }

    public int getNumarAeronave() {
        return aeronave.size();
    }

    public void afiseazaAeronave() {
        Collections.sort(aeronave);
        for(Aeronava aeronava : aeronave) {
            System.out.println(aeronava);
        }
    }
}
