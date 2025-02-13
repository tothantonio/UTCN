import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        Angajat tehnician = new Tehnician("Ion");
        Angajat robot = new Robot("R2D2");

        tehnician.lucreaza();
        tehnician.mananca();
        tehnician.pauza();
        robot.lucreaza();
        robot.mananca();
        robot.pauza();

        FlotaMaritima flota= new FlotaMaritima();

        ZoneMaritime zone1 = new ZoneMaritime(100, 200, "Marea Neagra", 2000);
        ZoneMaritime zone2 = new ZoneMaritime(200, 300, "Marea Mediterana", 3000);
        ZoneMaritime zone3 = new ZoneMaritime(300, 400, "Marea Baltica", 4000);

        ArrayList<ZoneMaritime> zone = new ArrayList<>();
        zone.add(zone1);
        zone.add(zone2);
        zone.add(zone3);

        for (ZoneMaritime z : zone) {
            System.out.println(z);
        }

        Submarine submarine1 = new Submarine("Vanatorul", 100, "MotorSmecher100", 2000, 2000, 2002);
        Submarine submarine2 = new Submarine("Sageata", 200, "MotorSmecher200", 2001, 3000, 2006);
        Submarine submarine3 = new Submarine("Rechinul", 300, "MotorSmecher300", 2002, 4000, 2008);
        Vapoare vapor1 = new Vapoare("Luxury ", 100, "MotorSmecher100", 2000, 1000);

        flota.adaugaNava(submarine1);
        flota.adaugaNava(submarine2);
        flota.adaugaNava(submarine3);
        flota.adaugaNava(vapor1);

        flota.afiseazaNave();

        try {
            flota.afiseazaSubmarinDupaData();
        } catch (NoSubmarineException e) {
            System.out.println(e.getMessage());
        }

        flota.afiseazaNaveAlfabetic();
    }
}