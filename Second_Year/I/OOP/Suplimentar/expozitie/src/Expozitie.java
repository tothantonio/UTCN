import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Expozitie {
    private int linii;
    private int coloane;
    private Loc[][] locuri;

    public Expozitie(){
        System.out.println("Linii: ");
        Scanner s = new Scanner(System.in);
        linii = s.nextInt();
        System.out.println("Coloane: ");
        coloane = s.nextInt();
        locuri = new Loc[linii][coloane];
    }

    public void adaugaPublicatie(Loc l){
        int linie = l.getLinie();
        int coloana = l.getColoana();
        for(int i = 0; i < linii; i++){
            for(Loc[] loc : locuri){
                if(loc[i].getLinie() == linie && loc[i].getColoana() == coloana){
                    System.out.println("Locul este ocupat");
                    return;
                } else {
                    locuri[linie][coloana] = l;
                }
            }
        }
    }

    public void scoatePublicatie(Loc l){
        int linie = l.getLinie();
        int coloana = l.getColoana();
        for(int i = 0; i < linii; i++){
            for(Loc[] loc : locuri){
                if(loc[i].getLinie() == linie && loc[i].getColoana() == coloana){
                    locuri[linie][coloana] = null;
                    return;
                }
            }
        }
    }

    public int nrCartiPeColoana(int coloana) {
        int cnt = 0;
        for (int i = 0; i < linii; i++) {
            if (locuri[i][coloana].getPublicatie() instanceof Carte) {
                cnt++;
            }
        }
        return cnt;
    }

    public int nrRevisteColor() {
        int cnt = 0;
        for(int i = 0; i < linii; i++){
            for(Loc[] loc: locuri){
                if(loc[i].getPublicatie() instanceof Revista r){
                    if(r.getEsteColor()){
                        cnt++;
                    }
                }
            }
        }
        return cnt;
    }

    public void afisarePublicatii() {
        ArrayList<Loc> a = new ArrayList<>();
        for(int i = 0; i < linii; i++){
            for(Loc[] loc: locuri){
                if(loc[i].getPublicatie() != null){
                    a.add(loc[i]);
            }
        }
        Collections.sort(a);
            for(Loc l : a) {
                System.out.println(l.toString());
            }
        }
    }
}
