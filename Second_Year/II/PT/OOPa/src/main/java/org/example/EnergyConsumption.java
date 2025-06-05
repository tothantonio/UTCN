package org.example;

import java.util.Date;

public final class EnergyConsumption extends EnergyRecord{
    private int energyConsumed;

    public EnergyConsumption(int ID, Date date, int energyConsumed){
        super(ID, date);
        this.energyConsumed = energyConsumed;
    }

    public String toString(){
        return "Type: Consumption, Value: " + this.energyConsumed;
    }
}
