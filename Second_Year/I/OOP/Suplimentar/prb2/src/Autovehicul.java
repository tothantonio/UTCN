import java.util.Scanner;

public class Autovehicul implements Comparable<Autovehicul>{
    private LocParcare loc;
    private String marca;
    private int caiPutere;

    public Autovehicul(){
        Scanner s = new Scanner(System.in);
        System.out.println("Marca : ");
        marca = s.nextLine();
        System.out.println("Cai Putere : ");
        caiPutere = s.nextInt();
        loc = new LocParcare();
    }

    public LocParcare getLocParcare() {return loc;}
    public String getMarca() {return marca;}
    public int getCaiPutere() {return caiPutere;}
    public int compareTo(Autovehicul a){
        return Integer.compare(a.getCaiPutere(), caiPutere);
    }
    public String toString(){
        return "Marca: " + marca + " Cai Putere: " + caiPutere
                + " Loc Parcare: " + loc.getLinie() + " " + loc.getColoana();
    }
}
