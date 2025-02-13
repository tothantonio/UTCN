package centruSpatial;

import org.junit.Test;

import java.util.ArrayList;

public class testCentru {
    @Test
    public void testNrRachete() {

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

        assert centru.getNumarAeronave() == 3;
    }

    @Test
    public void numeRacheta() {
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

        assert apolo11.getNume().equals("Apolo 11");
    }
}
