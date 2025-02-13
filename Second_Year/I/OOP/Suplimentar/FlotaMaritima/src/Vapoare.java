public class Vapoare extends Nava{
    private int nrContainere;

    public Vapoare(String nume, int tonaj, String motor, int anFabricatie, int nrContainere) {
        super(nume, tonaj, motor, anFabricatie);
        this.nrContainere = nrContainere;
    }

    public String toString() {
        return "Vapor " +
                "nume='" + getNume() + '\'' +
                ", tonaj=" + getTonaj() +
                ", motor='" + getMotor() + '\'' +
                ", anFabricatie=" + getAnFabricatie() +
                ", nrContainere=" + nrContainere;
    }
}
