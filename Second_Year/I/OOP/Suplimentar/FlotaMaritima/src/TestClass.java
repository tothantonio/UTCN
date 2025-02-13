import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestClass {

    @Test
    public void testNumarSubmarineDupaData() {
        FlotaMaritima flota = new FlotaMaritima();
        flota.adaugaNava(new Submarine("SSN-1", 10000, "YAYA11", 1999, 10000, 2009));
        flota.adaugaNava(new Submarine("SSN-2", 20000, "YAYA22", 2000, 20000, 2011));
        flota.adaugaNava(new Submarine("SSN-3", 30000, "YAYA33", 2001, 30000, 2011));

        int anPlecare = 2010;
        int expectedNumarSubmarine = 2;

        int actualNumarSubmarine = 0;
        for (Nava nava : flota.nave) {
            if (nava instanceof Submarine) {
                Submarine submarin = (Submarine) nava;
                if (submarin.getAnPlecare() > anPlecare) {
                    actualNumarSubmarine++;
                }
            }
        }

        assertEquals(expectedNumarSubmarine, actualNumarSubmarine);
    }

    @Test
    public void testPrimulSubmarinNume() {
        FlotaMaritima flota = new FlotaMaritima();
        flota.adaugaNava(new Submarine("Explorator 1", 10000, "YAYA11", 1999, 10000, 2009));
        flota.adaugaNava(new Submarine("SSN-2", 20000, "YAYA22", 2000, 20000, 2011));
        flota.adaugaNava(new Submarine("SSN-3", 30000, "YAYA33", 2001, 30000, 2011));

        Submarine primulSubmarin = (Submarine) flota.nave.get(0);
        String expectedNume = "Explorator 1";
        String actualNume = primulSubmarin.getNume();

        assertEquals(expectedNume, actualNume);
    }
}
