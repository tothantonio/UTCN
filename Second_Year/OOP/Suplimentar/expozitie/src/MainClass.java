public class MainClass {
    public static void main(String[] args){
        Expozitie e = new Expozitie();

        Loc l1 = new Loc();
        Loc l2 = new Loc();

        e.adaugaPublicatie(l1);
        e.adaugaPublicatie(l2);

        e.scoatePublicatie(l1);

        System.out.println(e.nrCartiPeColoana(0));
        System.out.println(e.nrRevisteColor());

        e.afisarePublicatii();
    }
}