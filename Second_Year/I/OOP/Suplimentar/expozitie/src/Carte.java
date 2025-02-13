import java.util.Scanner;

public class Carte extends Publicatie{
    private String autor;

    public Carte() {
        super();
        System.out.println("Autor: ");
        Scanner s = new Scanner(System.in);
        autor = s.nextLine();
    }

    public String getAutor() {return autor;}
}
