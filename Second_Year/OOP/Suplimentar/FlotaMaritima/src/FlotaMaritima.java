import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class FlotaMaritima {
    ArrayList<Nava> nave = new ArrayList<>();

    public void adaugaNava(Nava nava) {
        nave.add(nava);
    }

    public void afiseazaNave() {
        for (Nava nava : nave) {
            System.out.println(nava);
        }
    }

    public int getNumarNave() {
        return nave.size();
    }

    public void afiseazaSubmarinDupaData() throws NoSubmarineException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduceti anul: ");
        int an = sc.nextInt();
        sc.close();
        boolean exista = false;
        for(Nava nava : nave) {
            if(nava instanceof Submarine) {
                Submarine submarin = (Submarine) nava;
                if(submarin.getAnPlecare() > an) {
                    System.out.println("Submarin " + submarin.getNume() + " a plecat dupa anul " + an + ", in anul " + submarin.getAnPlecare());
                    exista = true;
                }
            }
        }
        if(!exista) {
            throw new NoSubmarineException("Nu exista submarine plecate dupa anul " + an);
        }
    }

    public void afiseazaNaveAlfabetic() {

        System.out.println("Navele in ordine alfabetica: ");
        Collections.sort(nave, new Comparator<Nava>() {
            @Override
            public int compare(Nava n1, Nava n2) {
                return n1.getNume().compareTo(n2.getNume());
            }
        });

        for (Nava nava : nave) {
            System.out.println(nava);
        }
        System.out.println();
        System.out.println("Numarul total de nave: " + getNumarNave());
    }
}
