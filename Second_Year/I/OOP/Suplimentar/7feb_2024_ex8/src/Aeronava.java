import java.util.ArrayList;
import java.util.List;

public class Aeronava {
    private Loc[][] locuri;
    private List<Pasager> pasageri;

    public Aeronava(int rows, int cols) {
        locuri = new Loc[rows][cols];
        pasageri = new ArrayList<>();
        for(int i = 0; i < rows; i++) {
            for(int j = 0; j < cols; j ++) {
                locuri[i][j] = new Loc();
            }
        }
    }

    public void addPasager(Pasager pasager) throws Exception{
        int row = pasager.getRow() - 1;
        int col = pasager.getCol() - 1;

        if(row < 0 || row >= locuri.length || col < 0 || col >= locuri[0].length) {
            throw new Exception("Locul nu exista");
        }
        locuri[row][col].ocupa(pasager);
        pasageri.add(pasager);
    }

    public int pasageriDinJudet(String judet) {
        int cnt = 0;
        for(Pasager pasager: pasageri) {
            if(pasager.getDocument() instanceof Pasaport) {
                Pasaport pasaport = (Pasaport) pasager.getDocument();
                if(pasaport.getJudet().equals(judet)) {
                    cnt++;
                }
            }
        }
        return cnt;
    }

    public void printOrdineAlfabeticaNume() {
        pasageri.sort((p1, p2) -> p1.getDocument().getNume().compareTo(p2.getDocument().getNume()));
        for(Pasager pasager: pasageri) {
            System.out.println("Nume: " + pasager.getDocument().getNume() + "Loc: " + pasager.getRow() + " " + pasager.getCol());
        }
    }
}
