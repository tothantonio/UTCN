import java.awt.*;

public class Autovehicul {
    private String model;
    private Color color;
    private int vitezaCurenta;
    private int vitezaMaxima;
    private static final int NUMAR_TREPTE = 6;
    private int treaptaVitezaCurenta;

    Sofer sofer;
    Rezervor rezervor;

    public Autovehicul(String model, Color color, int vitezaCurenta, int vitezaMaxima, int treaptaVitezaCurenta) {
        this.model = model;
        this.color = color;
        this.vitezaCurenta = vitezaCurenta;
        this.vitezaMaxima = vitezaMaxima;
        this.treaptaVitezaCurenta = treaptaVitezaCurenta;
    }

    public Autovehicul(){
        model = "BMW";
        color = Color.RED;
        vitezaCurenta = 100;
        vitezaMaxima = 320;
        treaptaVitezaCurenta = 3;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public Color getColor() {
        return color;
    }
    public void setColor(Color color) {
        this.color = color;
    }
    public int getVitezaCurenta() {
        return vitezaCurenta;
    }
    public void setVitezaCurenta(int vitezaCurenta) {
        this.vitezaCurenta = vitezaCurenta;
    }
    public int getVitezaMaxima() {
        return vitezaMaxima;
    }
    public void setVitezaMaxima(int vitezaMaxima) {
        this.vitezaMaxima = vitezaMaxima;
    }
    public int getTreaptaVitezaCurenta() {
        return treaptaVitezaCurenta;
    }
    public void setTreaptaVitezaCurenta(int treaptaVitezaCurenta) {
        this.treaptaVitezaCurenta = treaptaVitezaCurenta;
    }

    public void setAccelerare(int k){
        k = 20;
        if(vitezaCurenta > vitezaMaxima){
            vitezaCurenta = vitezaMaxima;
        }
        else{
            vitezaCurenta += k;
        }
    }

    public void setDecelerare(int k){
        if(vitezaCurenta - k > vitezaMaxima){
            vitezaCurenta = vitezaMaxima;
        }
        else{
            vitezaCurenta -= k;
        }
    }

    public void oprire(){
        this.treaptaVitezaCurenta = 0;
        this.vitezaCurenta = 0;
    }

    public void schimbaTreaptaViteza(int k){
        if(treaptaVitezaCurenta + k > NUMAR_TREPTE){
            treaptaVitezaCurenta = NUMAR_TREPTE;
        }
        else{
            treaptaVitezaCurenta += k;
        }
    }
    public String toString() {
        return "Marca: " + model + " Culoare: " + color.toString() + " Viteza: " + vitezaCurenta + " Viteza Maxima: " + vitezaMaxima + " Treapta: " + treaptaVitezaCurenta + " Numar Trepte " + NUMAR_TREPTE;
    }

    public Sofer getSofer() {
        return this.sofer;
    }

    public void setSofer(Sofer sofer) {
        this.sofer = sofer;
    }
}