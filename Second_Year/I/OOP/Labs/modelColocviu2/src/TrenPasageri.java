public class TrenPasageri extends Tren {
    private int locuriClasa1;
    private int locuriClasa2;

    public TrenPasageri(String nume, int capacitate, int anFabricatie, int vitezaMaxima, String sursa, String destinatie, int locuriClasa1, int locuriClasa2) {
        super(nume, capacitate, anFabricatie, vitezaMaxima, sursa, destinatie);
        this.locuriClasa1 = locuriClasa1;
        this.locuriClasa2 = locuriClasa2;
    }
}