public class TrenMarfa extends Tren {
    private String tipMarfa;

    public TrenMarfa(String nume, int capacitate, int anFabricatie, int vitezaMaxima, String sursa, String destinatie, String tipMarfa) {
        super(nume, capacitate, anFabricatie, vitezaMaxima, sursa, destinatie);
        this.tipMarfa = tipMarfa;
    }
}