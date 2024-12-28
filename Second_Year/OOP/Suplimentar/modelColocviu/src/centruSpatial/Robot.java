package centruSpatial;

public class Robot extends Angajat{
    public Robot(String nume) {
        super(nume);
    }

    public void lucreaza() {
        System.out.println(getNume() + "lucreaza continuu.");
    }

    public void pauza() {
        System.out.println(getNume() + "nu face pauza");
    }
}
