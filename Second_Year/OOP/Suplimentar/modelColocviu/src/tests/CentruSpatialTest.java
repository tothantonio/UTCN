package tests;

import centruSpatial.Apolo;
import centruSpatial.CentruSpatial;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;

public class CentruSpatialTest {

    @Test
    public void testNumarRachete() {
        CentruSpatial centru = new CentruSpatial();
        Apolo apolo1 = new Apolo("Apolo 1", 1000, "alb", 2000, new ArrayList<>(Arrays.asList("Marte", "Venus")));
        Apolo apolo2 = new Apolo("Apolo 2", 2000, "negru", 2001, new ArrayList<>(Arrays.asList("Marte", "Jupiter")));
        Apolo apolo3 = new Apolo("Apolo 3", 3000, "rosu", 2002, new ArrayList<>(Arrays.asList("Marte", "Saturn")));

        centru.adaugaAeronava(apolo1);
        centru.adaugaAeronava(apolo2);
        centru.adaugaAeronava(apolo3);

        assert centru.getNumarAeronave() == 3;

        centru.adaugaAeronava(apolo1);

        assert centru.getNumarAeronave() == 4;

        centru.adaugaAeronava(apolo2);

        assert centru.getNumarAeronave() == 5;

        centru.adaugaAeronava(apolo3);

        assert centru.getNumarAeronave() == 6;

        System.out.println("Testul testNumarRachete a trecut cu succes!");
    }
}
