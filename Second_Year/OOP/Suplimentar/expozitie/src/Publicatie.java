import java.util.Scanner;

public class Publicatie{
    private String titlu;
    private int numarPagini;

    public Publicatie() {
        System.out.println("Titlu: ");
        Scanner s = new Scanner(System.in);
        titlu = s.nextLine();
        System.out.println("Numar pagini: ");
        numarPagini = s.nextInt();
    }

    public int getNumarPagini() {return numarPagini;}
    public String getTitlu() {return titlu;}
}
