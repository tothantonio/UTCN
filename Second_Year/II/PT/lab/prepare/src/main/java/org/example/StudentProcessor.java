package org.example;

import java.util.ArrayList;
import java.util.List;

public class StudentProcessor extends Thread{
    private List<Student> studenti;

    public StudentProcessor(List<Student> studenti){this.studenti = studenti;}

    public void run(){
        for(Student s : studenti){
            double avg = s.getGrades().values().stream()
                    .mapToDouble(Double::doubleValue)
                    .average().orElse(0.0);
            System.out.println(s.getName() + " | " + avg);
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
