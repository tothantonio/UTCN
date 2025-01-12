public class Tehnician extends Angajat{
    public Tehnician(String nume) {super(nume);}

    public void mananca() {System.out.println(getNume() + " mananca");}
    public void pauza() {System.out.println(getNume() + " face pauza");}
    public void lucreaza() {System.out.println(getNume() + " lucreaza");}
}
