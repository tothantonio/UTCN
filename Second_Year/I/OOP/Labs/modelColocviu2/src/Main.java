import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Tren> trenuri = new ArrayList<>();
        trenuri.add(new TrenPasageri("Tren1", 200, 2010, 120, "Cluj", "Bucuresti", 50, 150));
        trenuri.add(new TrenMarfa("Tren2", 500, 2015, 9, "Cluj", "Constanta", "Carbune"));
        trenuri.add(new TrenPasageri("Tren3", 300, 2012, 100, "Cluj", "Timisoara", 100, 200));

        // Sortare trenuri după capacitate
        Collections.sort(trenuri, new Comparator<Tren>() {
            @Override
            public int compare(Tren t1, Tren t2) {
                return t2.getCapacitate() - t1.getCapacitate();
            }
        });

        // Afișare trenuri sortate
        for (Tren tren : trenuri) {
            System.out.println(tren.getNume() + " - Capacitate: " + tren.getCapacitate());
        }

        // Calculare timp estimat de sosire
        try {
            System.out.println("Timp estimat de sosire: " + calculeazaTimpSosire(trenuri.get(0), 300) + " ore");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static double calculeazaTimpSosire(Tren tren, int distanta) throws Exception {
        if (tren.getVitezaMaxima() < 10) {
            throw new Exception("Tren defect, viteza prea mica!");
        }
        return (double) distanta / tren.getVitezaMaxima();
    }
}