public class Main {
    public static void main(String[] args){
        Parcare p = new Parcare();

        Autovehicul a1 = new Autoturism();
        Autovehicul a2 = new Autoturism();

        try {
            p.parcareAutovehicul(a1);
            p.parcareAutovehicul(a2);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println(p.numarAutoturismePeRand(0));
        System.out.println(p.nrMotocicleteFaraAtas());

        p.afisare();
    }
}