import java.util.Scanner;

public class Autovehicul implements Comparable<Autovehicul>{
    private String numePropietar;
    private String tip;

    public Autovehicul() {
        Scanner s = new Scanner(System.in);
        System.out.println("Adauga numele proprietarului: ");
        this.numePropietar = s.nextLine();

        System.out.println("Adauga tipul de autovehicul: (A = autoturism, C = camion)");
        tip = s.nextLine();

        if(tip.equals("A")){
            Autoturism a= new Autoturism();
        } else if(tip.equals("C")){
            Camion c = new Camion();
        }
    }

    public String getNumePropietar(){return this.numePropietar;}
    public int compareTo(Autovehicul a){
        return this.numePropietar.compareTo(a.getNumePropietar());
    }
    public String toString(){
        return "Numele proprietarului: " + this.numePropietar + " Tipul autovehiculului: " + a.getClass().getName();
    }
}
