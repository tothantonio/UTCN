package centruSpatial;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Om om1 = new Om("Ion");
        Om om2 = new Om("Vasile");
        Om om3 = new Om("Gheorghe");

        Robot robot1 = new Robot("R2D2");
        Robot robot2 = new Robot("C3PO");

        om1.mananca();
        om2.doarme();
        om3.lucreaza();
        om1.pauza();

        robot1.mananca();
        robot2.doarme();
        robot1.lucreaza();
        robot2.pauza();

        CentruSpatial centru = new CentruSpatial();
        ArrayList<String> planete = new ArrayList<>();

        planete.add("Luna");
        planete.add("Marte");
        planete.add("Venus");

        Apolo apolo2 = new Apolo("Apolo 11", 2000, "negru", 2001, planete);
        Apolo apolo11 = new Apolo("Dakar", 1000, "alb", 2000, planete);
        Apolo apolo3 = new Apolo("Paris", 3000, "rosu", 2002, planete);
        Boeing boeing1 = new Boeing("Boeing 1", 1000, "alb", 2000, new Pilot("Ion", "Smecheru", 40, "Boss"), 300);

        centru.adaugaAeronava(apolo11);
        centru.adaugaAeronava(apolo2);
        centru.adaugaAeronava(apolo3);
        centru.adaugaAeronava(boeing1);

        Scanner sc = new Scanner(System.in);
        System.out.println("Introduceti anul de plecare: ");
        int data = sc.nextInt();

        centru.pleacaRacheta(apolo11, 2009);
        centru.pleacaRacheta(apolo2, 2001);
        centru.pleacaRacheta(apolo3, 2003);

        try {
            centru.printRachetaPlecareDupa(data);
        } catch (NoRachetaException e) {
            System.out.println(e.getMessage());
        }

        centru.afiseazaAeronave();
        centru.afisareSortareAlfabetic();
    }
}