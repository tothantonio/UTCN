package org.example;

public class ReparatieAuto extends InterventieAuto{
    private String tipReparatie;
    private int nrOreLucru;
    private double costPerOraDeLucru;

    public ReparatieAuto(String nrInmatriculare, int anFabricatie, String marca, String tipReparatie, int nrOreLucru, double costPerOraDeLucru){
        super(nrInmatriculare, anFabricatie, marca);
        this.tipReparatie = tipReparatie;
        this.nrOreLucru = nrOreLucru;
        this.costPerOraDeLucru = costPerOraDeLucru;
    }

    public double cost(){
        return nrOreLucru * costPerOraDeLucru;
    }
}
