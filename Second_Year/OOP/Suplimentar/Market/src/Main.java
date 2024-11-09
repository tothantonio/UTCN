import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Market market = new Market();

        Scanner sc = new Scanner(System.in);
        System.out.println("Introduceti numarul de produse:");
        int numarProduse = sc.nextInt();

        for(int i = 0; i < numarProduse; i++){
            String categorie = sc.next();
            String denumire = sc.next();
            double pret = Double.parseDouble(sc.next());

            if(categorie.equals("Aliment")){
                Aliment aliment = new Aliment(denumire, pret);
                market.adaugaProdus(aliment);
            } else if(categorie.equals("Electrocasnic")){
                Electrocasnic electrocasnic = new Electrocasnic(denumire, pret);
                market.adaugaProdus(electrocasnic);
            }
        }

        System.out.println("Numarul total de produse este: " + market.totalProduse());
        System.out.println("Numarul total de produse de tip Aliment este: " + market.totalAliment());
        System.out.println("Numarul total de produse de tip Electrocasnic este: " + market.totalElectrocasnic());
        System.out.println("Produsele sunt:");

        market.afiseazaProduse();
        sc.close();
    }
}