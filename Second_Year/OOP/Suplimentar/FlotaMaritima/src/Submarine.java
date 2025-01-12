public class Submarine extends Nava{
    private int adancime;
    private int anPlecare;

    public Submarine(String nume, int tonaj, String motor, int anFabricatie, int adancime, int anPlecare) {
        super(nume, tonaj, motor, anFabricatie);
        this.adancime = adancime;
        this.anPlecare = anPlecare;
    }

    public int getAnPlecare() {return anPlecare;}

    public String toString() {
        return "Submarin " +
                "nume='" + getNume() + '\'' +
                ", tonaj=" + getTonaj() +
                ", motor='" + getMotor() + '\'' +
                ", anFabricatie=" + getAnFabricatie() +
                ", adancime=" + adancime +
                ", anPlecare=" + anPlecare;
    }
}
