public class Main {
    public static void main(String[] args) {
        Biblioteca biblioteca = new Biblioteca(10, 5, 5, 10);

        biblioteca.adaugaCarte("Java Basics", "Editura Teora");
        biblioteca.adaugaCarte("Advanced Java", "Editura Polirom");
        biblioteca.adaugaCarte("Data Structures", "Editura Humanitas");
        biblioteca.adaugaCarte("Design Patterns", "Editura Litera");

        biblioteca.adaugaAngajati("Ion Popescu", "Bibliotecar");
        biblioteca.adaugaAngajati("Matei Corvin", "Bibliotecar");

        biblioteca.adaugaStudenti("Maria Ioana");
        biblioteca.adaugaStudenti("John Cena");
        biblioteca.adaugaStudenti("Ioana Popa");


        Persoana student1 = biblioteca.gasestePersoana(3); // Maria Georgescu
        Persoana student2 = biblioteca.gasestePersoana(4); // George Vasilescu
        Persoana student3 = biblioteca.gasestePersoana(5); // Ioana Popa
        Angajat angajat1 = (Angajat) biblioteca.gasestePersoana(1); // Ion Popescu
        Angajat angajat2 = (Angajat) biblioteca.gasestePersoana(2); // Ana Ionescu
        Carte carte1 = biblioteca.gasesteCarte(1); // Java Basics
        Carte carte2 = biblioteca.gasesteCarte(2); // Advanced Java
        Carte carte3 = biblioteca.gasesteCarte(3); // Data Structures
        Carte carte4 = biblioteca.gasesteCarte(4); // Design Patterns


        if (student1 != null && carte1 != null) biblioteca.adaugaImprumuturi(student1, carte1, angajat1);
        if (student1 != null && carte2 != null) biblioteca.adaugaImprumuturi(student1, carte2, angajat1);
        if (student2 != null && carte3 != null) biblioteca.adaugaImprumuturi(student2, carte3, angajat2);
        if (student2 != null && carte4 != null) biblioteca.adaugaImprumuturi(student2, carte4, angajat1);
        if (student3 != null && carte1 != null) biblioteca.adaugaImprumuturi(student3, carte1, angajat2);

        biblioteca.celeMaiMulteCartiImprumutate();

        double media = biblioteca.medieAritmeticaPerPersoana();
        System.out.println("Media aritmetica a nr de carti imprumutate per persoana: " + media);
    }
}