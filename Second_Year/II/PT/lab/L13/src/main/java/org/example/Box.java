package org.example;

public class Box <T>{
    private T value;

    public void set(T value){this.value = value;}
    public T get(){return this.value;}

    public <T> void printTwice(T value){
        System.out.println(value);
        System.out.println(value);
    }
}
