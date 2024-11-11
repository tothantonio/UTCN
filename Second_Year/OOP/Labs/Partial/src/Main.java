import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Introduceti numarul total de angajati: ");
        int numarTotalAngajati = scanner.nextInt();
        System.out.println("Numarul total de angajati: " + numarTotalAngajati);

        //un sir pentru developeri
        Developer[] developeri = new Developer[5];
        developeri[0] = new Developer("Dan", 25, 3, 50, "Problema 1");
        developeri[1] = new Developer("Alina", 28, 4, 55, "Problema 2");
        developeri[2] = new Developer("Mihai", 30, 5, 60, "Problema 3");
        developeri[3] = new Developer("Ioana", 27, 4, 52, "Problema 4");
        developeri[4] = new Developer();

        //creez Team Leader
        TeamLeader leader1 = new TeamLeader("Andrei", 35, 10, 80);
        TeamLeader leader2 = new TeamLeader("Bianca", 32, 8, 75);

        //creez Managaer
        Manager manager = new Manager("Maria", 45, 20, 100);

        //sir pentru echipe
        Echipa[] echipe = new Echipa[2];
        echipe[0] = new Echipa("Echipa A", leader1, 2);
        echipe[0].adaugaDeveloper(developeri[0]);
        //echipe[0].adaugaDeveloper(developeri[1]);
        echipe[0].adaugaDeveloper(developeri[4]);

        echipe[1] = new Echipa("Echipa B", leader2, 2);
        echipe[1].adaugaDeveloper(developeri[2]);
        echipe[1].adaugaDeveloper(developeri[3]);

        developeri[0].rezolvaTask();
        developeri[1].rezolvaTask();
        developeri[2].rezolvaTask();
        developeri[3].rezolvaTask();
        developeri[3].rezolvaTask();
        developeri[4].rezolvaTask();

        /*la afisarea anagajatiilor cu cele mai multe task uri rezolvate
          nu am apucat sa modific functia de rezolvaTask pentru a afisa mai frumos
          In ideea ca odata ce task-ul curent e rezolvat, developerul sa il rezolve pe urmatorul task
          De asta afiseaza:
          Ioana rezolva problema Problema 4
          Ioana rezolva problema Problema 4
          Pentru ca a rezolvat 2 task uri practic :(
        */

        //am calculat primii doi developeri care au rezolvat cele mai multe task uri
        Developer devMaxTaskuri1 = developeri[0];
        Developer devMaxTaskuri2 = null;
        for (int i = 1; i < developeri.length; i++) {
            if (developeri[i].getNrTaskuriRezolvate() > devMaxTaskuri1.getNrTaskuriRezolvate()) {
                devMaxTaskuri2 = devMaxTaskuri1;
                devMaxTaskuri1 = developeri[i];
            } else if (devMaxTaskuri2 == null || developeri[i].getNrTaskuriRezolvate() > devMaxTaskuri2.getNrTaskuriRezolvate()) {
                devMaxTaskuri2 = developeri[i];
            }
        }
        System.out.println("Primul developer cu cele mai multe taskuri rezolvate: " + devMaxTaskuri1.getNume() +
                ", Task: " + devMaxTaskuri1.getTaskCurent() + ", Numar taskuri rezolvate: " + devMaxTaskuri1.getNrTaskuriRezolvate());

        System.out.println("Al doilea developer cu cele mai multe taskuri rezolvate: " + devMaxTaskuri2.getNume() +
                ", Task: " + devMaxTaskuri2.getTaskCurent() + ", Numar taskuri rezolvate: " + devMaxTaskuri2.getNrTaskuriRezolvate());


        Angajat[] angajati = {developeri[0], developeri[1], developeri[2], developeri[3], developeri[4], leader1, leader2, manager};
        int nrOreLucrate = 160;

        //sortez angajatii descrescator dupa salariu
        for (int i = 0; i < angajati.length - 1; i++) {
            for (int j = i + 1; j < angajati.length; j++) {
                if (angajati[i].calculeazaSalariu(nrOreLucrate) < angajati[j].calculeazaSalariu(nrOreLucrate)) {
                    Angajat temp = angajati[i];
                    angajati[i] = angajati[j];
                    angajati[j] = temp;
                }
            }
        }
        System.out.println("Angajati si salarii in ordine descrescatoare:");
        for (Angajat angajat : angajati) {
            System.out.println(angajat.getNume() + " - Salariu: " + angajat.calculeazaSalariu(nrOreLucrate));
        }

        //sortez echipele dupa numarul de task uri rezolvate
        for (int i = 0; i < echipe.length - 1; i++) {
            for (int j = i + 1; j < echipe.length; j++) {
                if (echipe[i].getTotalTaskuriRezolvate() < echipe[j].getTotalTaskuriRezolvate()) {
                    Echipa temp = echipe[i];
                    echipe[i] = echipe[j];
                    echipe[j] = temp;
                }
            }
        }

        System.out.println("Echipe in ordinea eficientei:");
        for (Echipa echipa : echipe) {
            System.out.println(echipa.getNume() + " - Team Leader: " + echipa.getTeamLeader().getNume() +
                    ", Cost Total Echipa: " + echipa.getCostTotalEchipa(nrOreLucrate) +
                    ", Taskuri Rezolvate: " + echipa.getTotalTaskuriRezolvate());
        }
    }
}
