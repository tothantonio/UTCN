import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Biblioteca biblioteca = new Biblioteca();

        try (Scanner sc = new Scanner(System.in))
        {
            System.out.println("Introduceti numarul de carti:");
            int nrCarti = sc.nextInt();
            sc.nextLine();

            System.out.println("Introduceti cartile:");
            for (int i = 0; i < nrCarti; i++) {
                String titlu = sc.nextLine();
                String autor = sc.nextLine();
                String tip = sc.nextLine();

                if (tip.equals("Carte Beletristica")) {
                    CarteBeletristica carteBeletristica = new CarteBeletristica(titlu, autor);
                    biblioteca.addCarte(carteBeletristica);
                } else if (tip.equals("Carte Stiintifica")) {
                    CarteStiintifica carteStiintifica = new CarteStiintifica(titlu, autor);
                    biblioteca.addCarte(carteStiintifica);
                }
            }
        }

        System.out.println("Numarul total de carti: " + biblioteca.getNrCarti());
        System.out.println("Numarul de carti beletristica: " + biblioteca.getNrCartiBeletristica());
        System.out.println("Numarul de carti stiintifica: " + biblioteca.getNrCartiStiinta());

        biblioteca.listCarti();

    }
}