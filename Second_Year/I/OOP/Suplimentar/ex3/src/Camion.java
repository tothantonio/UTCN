import java.util.Scanner;

public class Camion extends Autovehicul{
    private boolean marfuriPericuloase;

    public Camion() {
        Scanner s = new Scanner(System.in);
        System.out.println("Are marfuri periculoase? (da/nu)");
        String raspuns = s.nextLine();
        if(raspuns.equals("da")){
            this.marfuriPericuloase = true;
        } else {
            this.marfuriPericuloase = false;
        }
    }

    public boolean getMarfuriPericuloase(){
        return this.marfuriPericuloase;
    }
}
