package org.example;

import java.util.Observable;
import java.util.Observer;

public class CalculatorVenitService implements Observer {
    public void update(Observable o, Object arg){
        if(arg instanceof InterventieAuto interventie){
            System.out.println("Venitul recalculat: " + interventie.cost());
        }
    }

    public void recalculareVenit(){}
}
