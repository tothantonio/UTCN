import java.util.Scanner;

public class Autoturism extends Autovehicul{
    private int kilometraj;

    public Autoturism(){
        super();
        Scanner s = new Scanner(System.in);
        System.out.println("Kilometraj: ");
        kilometraj = s.nextInt();
    }
}
