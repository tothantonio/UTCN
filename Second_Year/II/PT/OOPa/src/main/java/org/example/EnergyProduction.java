package org.example;

import java.util.Date;

public final class EnergyProduction extends EnergyRecord{
    private int energyProduced;

    public EnergyProduction(int ID, Date date, int energyProduced){
        super(ID, date);
        this.energyProduced = energyProduced;
    }

    public String toString(){
        return "Type: Production, Value: " + this.energyProduced;
    }
}
