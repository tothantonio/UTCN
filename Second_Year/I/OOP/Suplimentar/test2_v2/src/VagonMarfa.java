public class VagonMarfa extends Vagon{
    private float masaMaxima;
    private float volum;
    public VagonMarfa(String identificator, float masaMaxima, float volum) {
        super(identificator);
        this.masaMaxima = masaMaxima;
        this.volum = volum;
    }

    public String toString() {
        return super.toString() + " MasaMaxima:" + masaMaxima + " Volum:" + volum;
    }
}
