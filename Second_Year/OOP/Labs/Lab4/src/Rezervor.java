public class Rezervor {
    private int capacitateMaxima;
    private int nivelCurentUmplere;

    public Rezervor() {
        capacitateMaxima = 100;
        nivelCurentUmplere = 0;
    }

    public Rezervor(int nivelCurentUmplere, int capacitateMaxima) {
        this.nivelCurentUmplere = nivelCurentUmplere;
        this.capacitateMaxima = capacitateMaxima;
    }

    public int getNivelCurentDeUmplere() {
        return nivelCurentUmplere;
    }

    public void setNivelCurentUmplere(int nivelCurentUmplere) {
        this.nivelCurentUmplere = nivelCurentUmplere;
    }

    public void umplere(int cantitate) {
        if (this.nivelCurentUmplere + cantitate <= capacitateMaxima)
            this.nivelCurentUmplere += cantitate;
    }

    public void golire(int cantitate) {
        if (this.nivelCurentUmplere - cantitate >= 0)
            this.nivelCurentUmplere -= cantitate;
    }

    public String toString() {
        return "Rezervor {" +
                "capacitate maxima = '" + capacitateMaxima + '\'' +
                ", nivel curent de umplere = " + nivelCurentUmplere +
                '}';
    }

    public int SupraIncarcare(int capacitateMaxima){
        return capacitateMaxima;
    }

    public int SupraIncarcare(byte capacitateMaxima){
        return capacitateMaxima;
    }
}
