package org.example;

import java.util.Map;

public class Mentor implements User{
    private String name;
    private Map<String, Integer> courses;

    public Mentor(String name, Map<String, Integer> courses) {
        this.name = name;
        this.courses = courses;
    }

    public String getName() { return name; }
    public Map<String, Integer> getCourses() { return courses; }

    @Override
    public String toString() {
        return "Mentor: " + name + " Cursuri: " + courses;
    }
}
