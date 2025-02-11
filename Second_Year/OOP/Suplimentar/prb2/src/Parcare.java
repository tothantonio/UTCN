import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Parcare {
    private int linii;
    private int coloane;
    private LocParcare[][] locuri;

    public Parcare() {
        Scanner s = new Scanner(System.in);
        System.out.println("Linii: ");
        linii = s.nextInt();
        System.out.println("Coloane: ");
        coloane = s.nextInt();
        locuri = new LocParcare[linii][coloane];
    }

    public void parcareAutovehicul(Autovehicul a) throws Exception{
        int l = a.getLocParcare().getLinie();
        int c = a.getLocParcare().getColoana();
        if(locuri[l][c] != null) {
            throw new Exception("Loc ocupat!");
        } else {
            locuri[l][c] = a.getLocParcare();
        }
    }

    public void eliberareLoc(LocParcare loc) {
        int l = loc.getLinie();
        int c = loc.getColoana();
        if(locuri[l][c] == null) {
            System.out.println("Loc liber!");
        }
    }

    public int numarAutoturismePeRand(int rand) {
        int count = 0;
        for (int c = 0; c < coloane; c++) {
            LocParcare loc = locuri[rand][c];
            if (loc != null && loc.getAutovehicul() instanceof Autoturism) {
                count++;
            }
        }
        return count;
    }

    public int nrMotocicleteFaraAtas(){
        int count = 0;
        for(int l = 0; l < linii; l ++){
            for(int c = 0; c < coloane; c++){
                LocParcare loc = locuri[l][c];
                if(loc != null && loc.getAutovehicul() instanceof Motocicleta){
                    Motocicleta m = (Motocicleta) loc.getAutovehicul();
                    if(!m.getAreAtas()){
                        count++;
                    }
                }
            }
        }
        return count;
    }

    public void afisare(){
        ArrayList<Autovehicul> a = new ArrayList<>();
        for(int l = 0; l < linii; l++){
            for(LocParcare loc : locuri[l]){
                if(loc != null){
                    a.add(loc.getAutovehicul());
                }
            }
        }
        Collections.sort(a);
        for(Autovehicul autovehicul : a){
            System.out.println(autovehicul);
        }
    }
}
