package org.example;

import java.util.Objects;

public class Prosumer {
    private final int prosumerId;
    final String name;
    private final String address;

    public Prosumer(int prosumerId, String name, String address){
        this.prosumerId = prosumerId;
        this.name = name;
        this.address = address;
    }

    @Override
    public boolean equals(Object o){
        if(o == this) return true;
        if(!(o instanceof Prosumer)) return false;
        Prosumer p = (Prosumer) o;
        return p.prosumerId == prosumerId && p.name == name && p.address == address;
    }

    @Override
    public int hashCode(){
        return Objects.hash(prosumerId, name, address);
    }

    public String toString(){
        return "ProsumersID: " + this.prosumerId +
                " Name: " + this.name +
                " Address: " + this.address;
    }

    public int getProsumerId(){return this.prosumerId;}
}
