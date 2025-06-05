package org.example;

import java.util.List;

public class Instructor implements User{
    private String name;
    private List<String> lectures;

    public Instructor(String name, List<String> lectures){
        this.name = name;
        this.lectures = lectures;
    }
    public String getName() { return name; }
    public List<String> getLectures() { return lectures; }
}
