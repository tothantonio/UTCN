package org.example;

import java.util.Objects;

public final class Student {
    private final int studentId;
    private final String name;
    private final String email;

    public Student(int studentId, String name, String email){
        this.studentId = studentId;
        this.name = name;
        this.email = email;
    }

    @Override
    public boolean equals(Object o){
        if(o == this) return true;
        if(!(o instanceof Student)) return false;
        Student s = (Student) o;
        return s.studentId == studentId && s.name == name && s.email == email;
    }

    @Override
    public int hashCode(){
        return Objects.hash(studentId, name, email);
    }

    public int getId(){return studentId;}
    public String getName(){return name;}
}
