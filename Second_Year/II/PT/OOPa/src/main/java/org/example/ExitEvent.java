package org.example;

public final class ExitEvent extends ParkingEvent{

    public ExitEvent(int timeStamp, int vehicleId, String location){
        super(timeStamp, vehicleId, location);
    }
}
