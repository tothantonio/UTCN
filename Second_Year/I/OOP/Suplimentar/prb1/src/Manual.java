import java.util.Scanner;

public class Manual extends Publicatie{
    private String clasa;

    public Manual() {
        super();
        Scanner s = new Scanner(System.in);
        System.out.println("Clasa: ");
        clasa = s.nextLine();
    }
}
