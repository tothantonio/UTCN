import java.util.Scanner;

public class Autoturism extends Autovehicul{
    private int numarLocuri;

    public Autoturism(){
        System.out.println("Adauga numarul de locuri: ");
        Scanner s = new Scanner(System.in);
        this.numarLocuri = s.nextInt();
    }

    public int getNumarLocuri(){
        return this.numarLocuri;
    }
}
