package centruSpatial;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;

public class CentruSpatial {
    private ArrayList<Aeronava> aeronave = new ArrayList<>();
    private ArrayList<Apolo> rachetePlecare = new ArrayList<>();

    public void adaugaAeronava(Aeronava aeronava) {
        aeronave.add(aeronava);
    }

    public void pleacaRacheta(Apolo racheta, LocalDate dataPlecare) {
        rachetePlecare.add(racheta);
        System.out.println("Racheta " + racheta.getNume() + " a plecat la data de " + dataPlecare);
    }

    public void printRachetaPlecareDupa(LocalDate data) throws NoRachetaException {
        boolean gasit = false;
        for(Apolo racheta : rachetePlecare) {
            if(data.isAfter(LocalDate.now())) {
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
