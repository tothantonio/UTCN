import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ParcAuto parcAuto = new ParcAuto();

        Scanner sc = new Scanner(System.in);
        int numarVehicule = sc.nextInt();
        sc.nextLine();

        for(int i = 0 ; i < numarVehicule; i++) {
            String tip = sc.nextLine();
            String numarInmatriculare = sc.nextLine();

            if(tip.equals("Masina")) {
                Masina masina = new Masina(numarInmatriculare);
                parcAuto.addVehicul(masina);
            } else if(tip.equals("Motocicleta")) {
                Motocicleta motocicleta = new Motocicleta(numarInmatriculare);
                parcAuto.addVehicul(motocicleta);
            }
        }

        System.out.println("Numar total de vehicule: " + parcAuto.numarVehicule());
        System.out.println("Numar total de masini: " + parcAuto.numarMasini());
        System.out.println("Numar total de motociclete: " + parcAuto.numarMotociclete());

        parcAuto.listVehicule();
        sc.close();
    }
}