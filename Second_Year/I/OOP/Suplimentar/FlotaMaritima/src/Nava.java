public abstract class Nava {
    private String nume;
    private int tonaj;
    private String motor;
    private int anFabricatie;

    public Nava(String nume, int tonaj, String motor, int anFabricatie) {
        this.nume = nume;
        this.tonaj = tonaj;
        this.motor = motor;
        this.anFabricatie = anFabricatie;
    }

    public String getNume() {return nume;}
    public int getTonaj() {return tonaj;}
    public String getMotor() {return motor;}
    public int getAnFabricatie() {return anFabricatie;}
    public String toString() {
        return "Nava " +
                "nume='" + nume + '\'' +
                ", tonaj=" + tonaj +
                ", motor='" + motor + '\'' +
                ", anFabricatie=" + anFabricatie;
    }
}
