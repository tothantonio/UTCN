public class MainClass {
    public static void main(String[] args){
        System.out.println("Toate persoanele sunt din " + Persoana.TARA);
        Persoana a = new Persoana();
        System.out.println(a.detalii());
        Persoana b = new Persoana("Alex", 1998);
        b.invataLimba("franceza");
        b.invataLimba("germana");
        System.out.println(b.detalii());
        System.out.println("Orice persoana poate invata maxim " + Persoana.NR_MAXIM_LIMBI + " limbi straine");
    }
}
