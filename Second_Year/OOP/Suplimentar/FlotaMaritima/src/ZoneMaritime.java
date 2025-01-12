public class ZoneMaritime {
    private int latitudine;
    private int longitudine;
    private String nume;
    private int adancime;

    public ZoneMaritime(int latitudine, int longitudine, String nume, int adancime) {
        this.latitudine = latitudine;
        this.longitudine = longitudine;
        this.nume = nume;
        this.adancime = adancime;
    }

    public String toString() {
        return "ZonaMaritima{" +
                "latitudine=" + latitudine +
                ", longitudine=" + longitudine +
                ", nume='" + nume + '\'' +
                ", adancime=" + adancime +
                '}';
    }
}
