package centruSpatial;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws NoRachetaException {
        CentruSpatial centru = new CentruSpatial();
        ArrayList<String> planete = new ArrayList<>();

        planete.add("Luna");
        planete.add("Marte");
        planete.add("Venus");

        Apolo apolo2 = new Apolo("Apolo 2", 2000, "negru", 2001, planete);
        Apolo apolo11 = new Apolo("Apolo 11", 1000, "alb", 2000, planete);
        Apolo apolo3 = new Apolo("Apolo 3", 3000, "rosu", 2002, planete);

        centru.adaugaAeronava(apolo11);
        centru.adaugaAeronava(apolo2);
        centru.adaugaAeronava(apolo3);

        centru.afiseazaAeronave();

        Scanner sc =  new Scanner(System.in);
        System.out.println("Introduceti anul de plecare: ");
        int data = sc.nextInt();

        centru.pleacaRacheta(apolo11, 2009);
        centru.pleacaRacheta(apolo2, 2001);
        centru.pleacaRacheta(apolo3, 2003);

        centru.printRachetaPlecareDupa(data);
    }
}