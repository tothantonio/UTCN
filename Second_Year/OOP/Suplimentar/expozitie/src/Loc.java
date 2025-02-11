import java.util.Scanner;

public class Loc implements Comparable<Loc>{
    private Publicatie publicatie;
    private int linie;
    private int coloana;

    public Loc(){
        System.out.println("Tipul publicatiei: ");
        Scanner s = new Scanner(System.in);
        String tip = s.nextLine();
        if(tip.equals("carte")){
            publicatie = new Carte();
        } else if(tip.equals("Revista")){
            publicatie = new Revista();
        }
        System.out.println("Linie: ");
        linie = s.nextInt();
        System.out.println("Coloana: ");
        coloana = s.nextInt();
    }

    public Publicatie getPublicatie() {return publicatie;}
    public int getLinie() {return linie;}
    public int getColoana() {return coloana;}
    public int compareTo(Loc o){
        return Integer.compare(publicatie.getNumarPagini(), o.getPublicatie().getNumarPagini());
    }

    public String toString() {
        return publicatie.getTitlu() + " " + publicatie.getNumarPagini() + " " +
                linie + " " + coloana;
    }
}
