package org.example;

import java.util.Map;

public class Student implements User{
    private String name;
    private int id;
    private Map<String, Double> courses;

    public Student(String name, int id, Map<String, Double> courses) {
        this.name = name;
        this.id = id;
        this.courses = courses;
    }

    public String getName() { return name; }
    public Map<String, Double> getCourses() { return courses; }
    public int getId() { return id; }

    @Override
    public String toString() {
        return name + " (" + id + ")";
    }
}
