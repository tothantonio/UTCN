import java.util.Scanner;

public class Carte extends Publicatie{
    private String categorie;

    public Carte(){
        super();
        Scanner s = new Scanner(System.in);
        System.out.println("Categoria cartii: ");
        categorie = s.nextLine();
    }
}
