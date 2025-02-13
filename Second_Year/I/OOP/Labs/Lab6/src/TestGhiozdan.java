public class TestGhiozdan {
    public static void main(String[] args) {
        //la variabile ma uit la tip
        //la methode ma uit la instante
        // ca sa vad ce afiseaza(test 1)
        // se initializeaza mai intai variabilele statice(din super clasa), apoi constructorul, etc

        Ghiozdan ghiozdan = new Ghiozdan();

        Caiet c1 = new Caiet("Matematica");
        Caiet c2 = new Caiet("Geografie");
        Caiet c3 = new Caiet("Istorie");

        Manual m1 = new Manual("Algebra");
        Manual m2 = new Manual("Education");
        Manual m3 = new Manual("Analiza");

//        ghiozdan.addManual(c1);
//        ghiozdan.addManual(c2);
//        ghiozdan.addManual(c3);
//
//        ghiozdan.addManual(m1);
//        ghiozdan.addManual(m2);
//        ghiozdan.addManual(m3);
//
//        System.out.println(ghiozdan.getNrRechizite());
//        ghiozdan.getNrCaiet();
//        ghiozdan.getNrManual();
//
//        ghiozdan.listItems();
//        ghiozdan.listManual();
//        ghiozdan.listCaiet();

        //System.out.println("Gindac constructor");
        Gindac b = new Gindac();
        Buburuza buburuza = new Buburuza();
        Mamaruta mamaruta = new Mamaruta();
    }
}