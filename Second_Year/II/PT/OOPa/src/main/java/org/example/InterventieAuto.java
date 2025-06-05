package org.example;

public abstract class InterventieAuto {
    protected String nrInmatriculareMasina;
    private int anFabricatie;
    private String marca;

    public InterventieAuto(String nrInmatriculare, int anFabricatie, String marca){
        this.nrInmatriculareMasina = nrInmatriculareMasina;
        this.anFabricatie = anFabricatie;
        this.marca = marca;
    }

    public abstract double cost();

    public String getMarca(){return this.marca;}
}
