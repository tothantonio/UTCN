package org.example;

import java.util.List;

public class Management<T>{
    private List<Produs<?>> produse;

    public void addProdus(Produs<T> produs){
        produse.add(produs);
    }


}
