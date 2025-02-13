package centruSpatial;

public class Robot extends Angajat{
    public Robot(String nume) {super(nume);}

    public void mananca() {System.out.println(getNume() + " nu mananca");}
    public void doarme() {System.out.println(getNume() + " nu doarme");}
    public void lucreaza() {System.out.println(getNume() + " lucreaza continuu.");}
    public void pauza() {System.out.println(getNume() + " nu face pauza");}
}
