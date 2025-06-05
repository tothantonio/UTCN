package org.example;

import java.util.ArrayList;
import java.util.HashMap;

public class ParkingSystem{
    HashMap<Vehicle, ArrayList<ParkingEvent>> parcare = new HashMap<>();
    private volatile boolean running = true;

    public ParkingSystem() {
        Thread thread = new Thread(() -> {
            while(running){
                try{
                    Thread.sleep(1000); // 12 ore
                    for(Vehicle v: parcare.keySet()){
                        ParkingEvent lastEntry = null;
                        for(ParkingEvent p : parcare.get(v)){
                            if(p.getLocation() == "In Parcare"){
                                lastEntry = p;
                            } else lastEntry = null;
                        }
                        if(lastEntry != null && lastEntry.getTimeStamp() > 24){
                            System.out.println("Vehiculul: " + v.getVehicleId()
                                    + " cu numarul: " + v.getLicensePlate()
                                    + " si propietatul: " + v.getOwnerName()
                                    + " a stationat mai mult de 24 de ore in parcare!");
                        }
                    }
                } catch(InterruptedException e){
                    break;
                }
            }
        });
        thread.start();
    }

    public void stopThread(){
        running = false;
    }

    public void addVehicle(Vehicle v){
        if(parcare.containsKey(v) == false){
            parcare.put(v, new ArrayList<>());
        }
    }

    public void addEvent(Vehicle v, ParkingEvent e){
        if(parcare.containsKey(v)){
            parcare.get(v).add(e);
        } else {
            addVehicle(v);
            parcare.get(v).add(e);
        }
    }

    public ArrayList<ParkingEvent> getEventsForVehicle(Vehicle v){
        return parcare.get(v);
    }

    public void sortVehicles(){
        parcare.entrySet()
                .stream()
                .sorted((e1, e2) -> Integer.compare(totalHours(e1.getValue()), totalHours(e2.getValue())))
                .forEach(e -> System.out.println(e.getKey().getVehicleId() + " " + totalHours(e.getValue()) + " ore"));
    }

    public int totalHours(ArrayList<ParkingEvent> events){
        int total = 0;
        for(ParkingEvent e : events){
            if(e instanceof EntryEvent){
                total += e.getTimeStamp();
            }
        }
        return total;
    }
}
