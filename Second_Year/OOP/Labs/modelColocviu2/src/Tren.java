public abstract class Tren {
    protected String nume;
    protected int capacitate;
    protected int anFabricatie;
    protected int vitezaMaxima;
    protected String sursa;
    protected String destinatie;

    public Tren(String nume, int capacitate, int anFabricatie, int vitezaMaxima, String sursa, String destinatie) {
        this.nume = nume;
        this.capacitate = capacitate;
        this.anFabricatie = anFabricatie;
        this.vitezaMaxima = vitezaMaxima;
        this.sursa = sursa;
        this.destinatie = destinatie;
    }

    public int getCapacitate() {
        return capacitate;
    }

    public String getDestinatie() {
        return destinatie;
    }

    public int getVitezaMaxima() {
        return vitezaMaxima;
    }

    public String getNume() {
        return nume;
    }
}
