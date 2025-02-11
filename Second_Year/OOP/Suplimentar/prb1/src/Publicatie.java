import java.util.Scanner;

public class Publicatie implements Comparable<Publicatie>{
    private String titlu;
    private String autor;
    private String editura;
    private String numarPagini;

    public Publicatie() {
        Scanner s = new Scanner(System.in);
        System.out.println("Titlu: ");
        titlu = s.nextLine();
        System.out.println("Autor: ");
        autor = s.nextLine();
        System.out.println("Editura: ");
        editura = s.nextLine();
        System.out.println("NumarPagini: ");
        numarPagini = s.nextLine();
    }

    public int compareTo(Publicatie p){
        return titlu.compareTo(p.titlu);
    }

    public String toString(){
        return titlu + "\t" + autor + "\t" + editura + "\t" + numarPagini;
    }
}
