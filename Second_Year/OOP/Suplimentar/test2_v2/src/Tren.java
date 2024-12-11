import java.util.Arrays;

public class Tren {
    private Vagon[] vagoane;
    private int nrVagoaneInGarnitura, nrMaximVagoane;
    public Tren(int nrMaximVagoane) {
        this.nrMaximVagoane = nrMaximVagoane;
        vagoane = new Vagon[nrMaximVagoane];
    }

    public void addVagon(Vagon v) throws Exception {
        if(nrVagoaneInGarnitura < nrMaximVagoane) {
            if(nrVagoaneInGarnitura > 0 && v.getClass() != vagoane[0].getClass()) {
                throw new Exception("Nu se port adauga vagoane de marfa la un tren de calatori si nici vagoane de calatori in tren de marfa!");
            }
            vagoane[nrVagoaneInGarnitura++] = v;
        }
    }

    private void sorteazaVagoane() {
        Arrays.sort(vagoane, 0, nrVagoaneInGarnitura);
    }

    public String toString(){
        String s = "Tren cu urmatoarele vagoane (in ordine invers lexicografica a idetificatorilor lor) : \n";
        sorteazaVagoane();
        for(Vagon v : vagoane) {
            if(v != null) {
                s += v + "\n";
            }
        }
        return s;
    }
}
