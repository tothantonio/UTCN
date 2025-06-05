package org.example;

import java.util.ArrayList;
import java.util.List;

public class Echipa <T extends Membru>{
    private List<T> membrii = new ArrayList<>();

    public void adaugaMembru(T membru){
        membrii.add(membru);
    }

    public List<T> getMembrii(){
        return membrii;
    }
}
