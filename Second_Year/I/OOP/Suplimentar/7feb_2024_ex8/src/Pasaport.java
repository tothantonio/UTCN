public class Pasaport extends Document{
    private String judet;
    private String culoare;

    public Pasaport(String nume, String cnp, String judet, String culoare) {
        super(nume, cnp);
        this.judet = judet;
        this.culoare = culoare;
    }

    public String getJudet() {
        return judet;
    }
}
