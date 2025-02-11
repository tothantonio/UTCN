import java.util.Scanner;

public class Revista extends Publicatie{
    private boolean esteColor;

    public Revista() {
        super();
        System.out.println("Este color? ");
        Scanner s = new Scanner(System.in);
        String raspuns = s.nextLine();
        if(raspuns.equals("da")) {
            esteColor = true;
        } else {
            esteColor = false;
        }
    }

    public boolean getEsteColor() {return esteColor;}
}
