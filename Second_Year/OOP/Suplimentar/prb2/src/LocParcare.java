import java.util.Scanner;

public class LocParcare {
    private int linie;
    private int coloana;
    private Autovehicul autovehicul;

    public LocParcare(){
        Scanner s = new Scanner(System.in);
        System.out.println("Linie: ");
        linie = s.nextInt();
        System.out.println("Coloana: ");
        coloana = s.nextInt();
        autovehicul = new Autovehicul();
    }

    public int getLinie() {return linie;}
    public int getColoana() {return coloana;}
    public Autovehicul getAutovehicul() {return autovehicul;}
}
