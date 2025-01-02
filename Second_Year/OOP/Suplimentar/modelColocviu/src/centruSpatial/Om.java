package centruSpatial;

public class Om extends Angajat{

    public Om(String nume) {super(nume);}

    public void mananca() {System.out.println(getNume() + " mananca");}
    public void doarme() {System.out.println(getNume() + " doarme");}
    public void lucreaza() {System.out.println(getNume() + " lucreaza");}
    public void pauza() {System.out.println(getNume() + " face pauza");}
}
