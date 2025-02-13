import java.util.ArrayList;
import java.util.Collections;

public class Biblioteca {
    private int numarRafturi;
    private int numarMaxPublicatii;
    private ArrayList<Publicatie> publicatii;
    private Raft raft;

    public Biblioteca(int numarRafturi, int numarMaxPublicatii) {
        this.numarRafturi = numarRafturi;
        this.numarMaxPublicatii = numarMaxPublicatii;
    }

    public void adaugaPublicatii(Publicatie p) throws Exception{
        int r = raft.getCapacitate();
        if(r > numarMaxPublicatii){
            throw new Exception("Raft plin");
        } else {
            publicatii.add(p);
        }
    }

    public void afisare(){
        Collections.sort(publicatii);
        for(Publicatie p : publicatii){
            System.out.println(p);
        }
    }
}
