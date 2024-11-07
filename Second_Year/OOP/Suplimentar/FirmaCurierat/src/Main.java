public class Main {
    public static void main(String[] args) {

        Administrator administrator1 = new Administrator(1, "Administrator1", "Functie1", new Expeditie[0]);
        Administrator administrator2 = new Administrator(2, "Administrator2", "Functie2", new Expeditie[0]);

        Utilizator utilizator1 = new Utilizator(1, "Utilizator1", new Expeditie[0]);
        Utilizator utilizator2 = new Utilizator(2, "Utilizator2", new Expeditie[0]);

        Expeditie expeditie1 = new Expeditie(1, 1, 2, 100, administrator1, utilizator1);
        Expeditie expeditie2 = new Expeditie(2, 2, 3, 200, administrator2, utilizator2);

        expeditie1.afisare();
        expeditie2.afisare();

        administrator1.afisare();
        administrator2.afisare();

        utilizator1.afisare();
        utilizator2.afisare();

        //distanta medie
        Expeditie[] expeditii = {expeditie1, expeditie2};

        Expeditie.distantaMedie(expeditii);

    }
}