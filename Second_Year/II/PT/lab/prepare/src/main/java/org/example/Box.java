package org.example;

import java.util.List;

public class Box<T> {
    private T value;
    public Box(T value){this.value = value;}
    public T getValue(){return value;}
}
