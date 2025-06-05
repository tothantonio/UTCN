package org.example;

import java.util.Map;

public class Student implements User{
    private String name;
    private Map<String, Double> grades;

    public Student(String name, Map<String, Double> grades) {
        this.name = name;
        this.grades = grades;
    }

    public String getName() { return name; }
    public Map<String, Double> getGrades() { return grades; }
    public String toString(){
        return "Nume: " + name + " | Note: " + grades;
    }
}
