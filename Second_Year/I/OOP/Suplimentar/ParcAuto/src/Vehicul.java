public abstract class Vehicul {
    protected String numarInmatriculare;

    public Vehicul(String numarInmatriculare) {
        this.numarInmatriculare = numarInmatriculare;
    }
    public abstract String getTip();
}
