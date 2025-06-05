package org.example;

public sealed class ParkingEvent permits EntryEvent, ExitEvent{
    private int timeStamp;
    private int vehicleId;
    private String location;

    public ParkingEvent(int timeStamp, int vehicleId, String location){
        this.timeStamp = timeStamp;
        this.vehicleId = vehicleId;
        this.location = location;
    }

    public String getLocation(){return this.location;}
    public int getTimeStamp(){return this.timeStamp;}
}
