package org.example;

import java.util.Objects;

public final class Vehicle {
    private final int vehicleId;
    private final String ownerName;
    private final String licensePlate;

    public Vehicle(int vehicleId, String ownerName, String licensePlate){
        this.vehicleId = vehicleId;
        this.ownerName = ownerName;
        this.licensePlate = licensePlate;
    }

    @Override
    public boolean equals(Object o){
        if(o == this) return true;
        if(!(o instanceof Vehicle)) return false;
        Vehicle v = (Vehicle) o;
        return v.vehicleId == this.vehicleId &&
                v.ownerName == this.ownerName &&
                v.licensePlate == this.licensePlate;
    }

    @Override
    public int hashCode(){
        return Objects.hash(vehicleId, ownerName, licensePlate);
    }

    public int getVehicleId(){return this.vehicleId;}
    public String getOwnerName(){return this.ownerName;}
    public String getLicensePlate(){return this.licensePlate;}

}
