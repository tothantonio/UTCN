package org.example;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class ProsumersManagement {
    private HashMap<Prosumer, ArrayList<EnergyRecord>> map = new HashMap<>();

    public void addProsumer(Prosumer p){
        if(map.containsKey(p) == false){
            map.put(p, new ArrayList<>());
        }
    }

    public void addEnergyRecord(Prosumer p, EnergyRecord record){
        if(map.containsKey(p)){
            map.get(p).add(record);
        } else {
            addProsumer(p);
            map.get(p).add(record);
        }
    }

    public ArrayList<EnergyRecord> getEnergyRecord(Prosumer p){
        return map.get(p);
    }

    public void displayOverloadeProsumers(){

    }
}
