package org.example;

public class EnergyChecker extends Thread{
    private ProsumersManagement management;
    private int consumptionThreshold;
    private int productionThreshold;

    public EnergyChecker(ProsumersManagement management, int consumptionThreshold, int productionThreshold){
        this.management = management;
        this.consumptionThreshold = consumptionThreshold;
        this.productionThreshold = productionThreshold;
    }

    public void run(){

    }
}
