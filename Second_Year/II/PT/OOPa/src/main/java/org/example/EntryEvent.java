package org.example;

public final class EntryEvent extends ParkingEvent{

    public EntryEvent(int timeStamp, int vehicleId, String location){
        super(timeStamp, vehicleId, location);
    }
}
