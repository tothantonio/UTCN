package org.example;

import java.time.LocalDate;
import java.util.Date;

public sealed abstract class EnergyRecord permits EnergyProduction, EnergyConsumption{
    private int ID;
    private LocalDate date;

    public EnergyRecord(int ID, Date LocalDate){
        this.ID = ID;
        this.date = date;
    }

    public String toString(){
        return "ID: " + this.ID + " Date: " + this.date;
    }

    public LocalDate getDate(){return date;}
}
