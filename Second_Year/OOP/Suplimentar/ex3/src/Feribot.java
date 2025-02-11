import java.util.ArrayList;
import java.util.Collections;

public class Feribot {
    private int masaMaxima;
    private int capacitateAutoturisme;
    private int capacitateCamioane;
    private ArrayList<Autoturism> autoturisme;
    private ArrayList<Camion> camioane;

    public Feribot(int masaMaxima, int capacitateAutoturisme, int capacitateCamioane){
        this.masaMaxima = masaMaxima;
        this.capacitateAutoturisme = capacitateAutoturisme;
        this.capacitateCamioane = capacitateCamioane;
        this.autoturisme = new ArrayList<Autoturism>();
        this.camioane = new ArrayList<Camion>();
    }

    public int calculeazaMasa(){
        int masa = 0;
        for(Autoturism a: autoturisme){
            masa += a.getMasaAutovehicul();
        }

        for(Camion c: camioane){
            masa += c.getMasaAutovehicul();
        }

        return masa;
    }

    public void incarcareAutovehicul(Autovehicul a) throws Exception{
        int m1 = a.getMasaAutovehicul();
        if(calculeazaMasa() + m1 > masaMaxima){
            throw new Exception("Feribotul este prea incarcat");
        }
        if(a instanceof Autoturism){
            if(autoturisme.size() < capacitateAutoturisme){
                autoturisme.add((Autoturism) a);
            } else {
                throw new Exception("Nu mai sunt locuri pentru autoturisme");
            }
        } else if(a instanceof Camion){
            if(camioane.size() < capacitateCamioane){
                camioane.add((Camion) a);
            } else {
                throw new Exception("Nu mai sunt locuri pentru camioane");
            }
        }
    }

    public int nrCamioanePericuloase() {
        int cnt = 0;
        for(Camion c: camioane) {
            if(c.getMarfuriPericuloase()) {
                cnt++;
            }
        }
        return cnt;
    }

    public void afisare() {
        ArrayList<Autovehicul> autovehicule = new ArrayList<Autovehicul>();
        autovehicule.addAll(autoturisme);
        autovehicule.addAll(camioane);
        Collections.sort(autovehicule);
        for(Autovehicul a: autovehicule) {
            System.out.println(a);
        }
    }
}
