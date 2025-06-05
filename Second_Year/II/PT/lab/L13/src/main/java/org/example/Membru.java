package org.example;

public abstract class Membru {
    private String nume;

    public Membru(String nume){
        this.nume = nume;
    }

    public String getNume(){return nume;}
    public String toString(){
        return "Nume Membru: " + nume;
    }
}
