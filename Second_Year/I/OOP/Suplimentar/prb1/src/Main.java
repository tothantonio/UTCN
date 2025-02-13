public class Main{
    public static void main(String[] args) throws Exception {
        Biblioteca b = new Biblioteca(30, 6);

        Publicatie p1 = new Publicatie();
        Publicatie p2 = new Publicatie();

        b.adaugaPublicatii(p1);
        b.adaugaPublicatii(p2);
        b.afisare();
    }
}