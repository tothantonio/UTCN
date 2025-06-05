package org.example;

public class InspectieTehnicaPeriodica extends InterventieAuto{
    private double cost;
    private int data;
    private String rezultatEvaluare;

    public InspectieTehnicaPeriodica(String nrInmatriculare, int anFabricatie, String marca, double cost, int data, String rezultatEvaluare){
        super(nrInmatriculare, anFabricatie, marca);
        this.cost = cost;
        this.data = data;
        this.rezultatEvaluare = rezultatEvaluare;
    }

    public double cost(){
        return this.cost;
    }

    public String getRezultatEvaluare(){return this.rezultatEvaluare;}
}
