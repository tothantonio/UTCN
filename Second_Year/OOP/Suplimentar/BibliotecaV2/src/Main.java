public class Main {
    public static void main(String[] args) {
        Biblioteca biblioteca = new Biblioteca();

        Autor autor1 = new Autor("Ion", "Creanga", "50");
        Autor autor2 = new Autor("Mihai", "Eminescu", "60");
        Autor autor3 = new Autor("Liviu", "Rebreanu", "70");

        Carte carte1 = new Carte("Amintiri din copilarie", autor1, 1, 5);
        Carte carte2 = new Carte("Luceafarul", autor2, 2, 3);
        Carte carte3 = new Carte("Ion", autor3, 3, 2);

        System.out.println("Adauga carti in biblioteca");

        biblioteca.addCarte(carte1);
        biblioteca.addCarte(carte2);
        biblioteca.addCarte(carte3);

        System.out.println("Listeaza carti");
        biblioteca.listeazaCarti();

        System.out.println("Gaseste carte dupa titlu");
        Carte carte = biblioteca.gasesteCarteDupaTitlu("Ion");
        System.out.println(carte);
    }
}