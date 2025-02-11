public class MainClass {
    public static void main(String[] args){
        Feribot f = new Feribot(1000, 5, 3);
        Autovehicul a1 = new Autovehicul();
        Autovehicul a2 = new Autovehicul();

        try {
            f.incarcareAutovehicul(a1);
            f.incarcareAutovehicul(a2);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println("Numarul de camioane periculoase: " + f.nrCamioanePericuloase());
        f.afisare();
    }
}