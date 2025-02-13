import java.util.Scanner;

public class Motocicleta extends Autovehicul{
    private boolean areAtas;

    public Motocicleta() {
        super();
        Scanner s = new Scanner(System.in);
        System.out.println("Motocicleta are atas? (Y = are atas, N = nu are atas)");
        String are = s.nextLine();
        if(are.equals("Y")){
            areAtas = true;
        } else if (are.equals("N")){
            areAtas = false;
        }
    }

    public boolean getAreAtas() {return areAtas;}
}
