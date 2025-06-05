package org.example;

interface Animal {
    String getName();
}


public class Dog implements Animal {
    private String name;
    public Dog(String name) { this.name = name; }
    public String getName() { return name; }
    public void hamham(){
        System.out.println("Ham");
    }
}

class Cat implements Animal {
    private String name;
    public Cat(String name) { this.name = name; }
    public String getName() { return name; }
}

