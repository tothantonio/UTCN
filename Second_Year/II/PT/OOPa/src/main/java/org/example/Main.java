package org.example;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        //here I am going to revisit some of the most important OOP and Java concepts
        //In the first Lecture there is nothing special

        //Lecture 2 -> UML diagrams (easy)

        //Lecture 3 -> OOP paradigms (Inheritance, Abstractization, Encapsulation, Polymorphism)

        //Lecture 4 -> Abstract Classes and Interfaces

        //Lecture 5 -> Threads

//        ProsumersManagement management = new ProsumersManagement();
//
//        Prosumer p1 = new Prosumer(10, "Ion", "123 aednoa");
//        Prosumer p2 = new Prosumer(11, "Gica", "453 svssv");
//
//        EnergyRecord e1 = new EnergyProduction(101, new Date(2025, 5, 20), 20);
//        EnergyRecord e2 = new EnergyConsumption(102, new Date(2025, 6, 15), 10);
//
//        management.addProsumer(p1);
//        management.addProsumer(p2);
//
//        management.addEnergyRecord(10, e1);
//        management.addEnergyRecord(11, e2);
//
//        List<EnergyRecord> lista = management.getEnergyRecord(11);
//        lista.forEach(r -> System.out.println(r));
//
////        System.out.println();
//
//        Set<Prosumer> set = management.getAllProsumers();
//        set.forEach(p -> System.out.println(p));
//
//        //Reflection:
//        Field[] prosumerFields = p1.getClass().getDeclaredFields();
//        Method[] prosumerMethods = p1.getClass().getDeclaredMethods();
//
//        for(Field f: prosumerFields){
//            System.out.println(f.getName());
//        }
//
//        for(Method m: prosumerMethods){
//            System.out.println(m.getName());
//        }
//
//        //Threads
//        MyThread thread = new MyThread();
//        thread.start();
//        System.out.println(thread.isAlive());
//
//        List<String> angajati = List.of("Alice", "John", "Bob");
//
//        List<String> angajatiNoi = angajati
//                .stream()
//                .filter(e->e.startsWith("J"))
//                .toList();
//
//        System.out.println(angajatiNoi);

//        ParkingSystem parking = new ParkingSystem();
//
//        Vehicle v1 = new Vehicle(1, "Ion Popescu", "B123ABC");
//        Vehicle v2 = new Vehicle(2, "Maria Ionescu", "B456DEF");
//        Vehicle v3 = new Vehicle(3, "George Pavel", "B789GHI");
//
//        parking.addVehicle(v1);
//        parking.addVehicle(v2);
//        parking.addVehicle(v3);
//
//        parking.addEvent(v1, new EntryEvent(4, 1, "In Parcare"));    // 5 ore în parcare
//        parking.addEvent(v1, new ExitEvent(5, 1, "Iesire"));
//        parking.addEvent(v1, new EntryEvent(10, 1, "In Parcare"));  // încă 10 ore
//        parking.addEvent(v1, new ExitEvent(10, 1, "Iesire"));
//
//        parking.addEvent(v2, new EntryEvent(15, 2, "In Parcare"));  // 15 ore în parcare
//        parking.addEvent(v2, new ExitEvent(15, 2, "Iesire"));
//
//        parking.addEvent(v3, new EntryEvent(30, 3, "In Parcare"));  // 30 ore - va declanșa avertizarea
//
//        System.out.println("Vehicule sortate după numărul de ore:");
//        parking.sortVehicles();
//
//        // Aștept câteva secunde să văd dacă thread-ul de monitorizare funcționează
//        System.out.println("\nAștept thread-ul de monitorizare...");

//        parking.stopThread();

//        ExamManagementSystem sesiune = new ExamManagementSystem();
//
//        Student s1 = new Student(1, "Ion Luca Caragiale", "ionboss@yahoo.com");
//        Student s2 = new Student(2, "Mircea Bravo", "bravo@yahoo.com");
//        Student s3 = new Student(3, "Calin Georgescu", "romaniaLibera@yahoo.com");
//
//        sesiune.addStudent(s1);
//        sesiune.addStudent(s2);
//        sesiune.addStudent(s3);
//
//        sesiune.addExamToStudent(s1, new ExamSession(50, "PT", LocalDate.of(2025, 6, 10)));
//        sesiune.addExamToStudent(s1, new ExamSession(100, "EGC", LocalDate.of(2025, 6, 10)));
//        sesiune.addExamToStudent(s2, new ExamSession(50, "PC", LocalDate.of(2025, 6, 14)));
//        sesiune.addExamToStudent(s2, new ExamSession(130, "AC", LocalDate.of(2025, 6, 14)));
//        sesiune.addExamToStudent(s2, new ExamSession(50, "TS", LocalDate.of(2025, 6, 14)));
//        sesiune.addExamToStudent(s2, new ExamSession(60, "CN", LocalDate.of(2025, 6, 18)));
//        sesiune.addExamToStudent(s3, new ExamSession(50, "OOP", LocalDate.of(2025, 6, 11)));
//
//        System.out.println("Studenti sortati dupa nr de ore in examene:");
//        sesiune.sortStudent();
//
//        System.out.println("Studentii cu examene de peste 120 de minute intr-o zi:");
//        sesiune.displayStudentsWithLongerExams();
//
//        System.out.println("Incepe Thread-ul...");
//        sesiune.stopThread();

        ManagementFirma firma = new ManagementFirma();

        Departament dep = new Departament();
        firma.addDepartament(dep);

        firma.addEmployee(new Programator(), dep);
        firma.addEmployee(new Programator(), dep);

        firma.addEmployee(new Manager(), dep);


    }
}