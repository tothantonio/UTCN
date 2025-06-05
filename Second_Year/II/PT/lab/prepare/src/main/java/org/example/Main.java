package org.example;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.stream.Collectors;

public class Main{
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        //afisarea metodelor
        Class<?> clazz = Student.class;
        Method[] methods = clazz.getDeclaredMethods();
        for(Method m: methods){
            System.out.println(m.getName());
        }

        //invocarea unei metode fara a stii clasa
        Object obj = new Instructor("John", List.of("AC", "PSN", "EGC"));
        Class<?> clazz1 = obj.getClass();
        if(Arrays.stream(clazz1.getMethods()).anyMatch(met -> met.getName().equals("getLectures"))){
            Method m = clazz1.getDeclaredMethod("getLectures");
            List<String> cursuri = (List<String>)m.invoke(obj);
            System.out.println(cursuri);
        } else System.out.println("Nu exista metoda");


        //afisarea tuturor campurilor
        Object s = new Student("Antonio", Map.of("OOP", 10.0, "AC", 9.0));
        Class<?> clazz2 = s.getClass();
        Field[] fields = clazz2.getDeclaredFields();
        for(Field f: fields){
            f.setAccessible(true);
            Object val = f.get(s);
            System.out.println("Field: " + f.getName() + " | Value: " + val);
        }

        //verifica daca un obiect implementeaza interfata User
        Object b = new Box("Hello");
        Class<?> clazz3 = b.getClass();
        int ok = 0;
        while(clazz3 != null){
            Class<?>[] interfaces = clazz3.getInterfaces();
            for(Class<?> i: interfaces){
                if(i.equals(User.class)){
                    ok = 1;
                }
            }
            clazz3 = clazz3.getSuperclass();
        }
        if(ok == 1){
            System.out.println("Implementeaza User");
        } else System.out.println("Nu implementeaza User");

        List<String> lista = unwrap(List.of(new Box<>("OOP"), new Box<>("AC")));
        System.out.println(lista);

        //testeaza o clasa generica Pair
        List<Pair<String, Integer>> pereche = List.of(new Pair<>("OOfdelP", 10), new Pair<>("AC", 5));
        System.out.println(pereche);

        System.out.println(longestToString(pereche));

        List<Student> students = List.of(new Student("Ion", Map.of("CN", 2.0, "AC", 9.0)),
                new Student("Ana", Map.of("PSN", 10.0, "SO", 10.0)),
                new Student("Bogdan", Map.of("TS", 4.0, "EGC", 6.0)));

        Map<String, Double> medii = calculateAveragePerStudent(students);
        medii.forEach((nume, medie) -> System.out.println("Nume: " + nume + " | Medie: " + medie));

        List<Instructor> instructors = List.of(new Instructor("Vasile", List.of("CN", "MSI")),
                new Instructor("Ioan", List.of("EGC", "PL", "MSI")));

        List<String> lectures = cursuriDiferite(instructors);
        lectures.forEach(l -> System.out.println(l));

        List<Student> studentiPeste8 = mediePeste8(students);
        studentiPeste8.forEach(stu -> System.out.println(stu.getName()));

        //instantiere dinamica a unui Student
        Class<?> clazz4 = Student.class;
        Constructor<?> ctor = clazz4.getConstructor(String.class, Map.class);

        Object student = ctor.newInstance("Popescu", Map.of("AC", 4, "OOP", 10));
        String numeStudent = (String)clazz4.getMethod("getName").invoke(student);
        System.out.println(numeStudent);

        System.out.println("Studenti Sortati:");
        List<Student> studentiSortati = sortDescresc(students);
        studentiSortati.forEach(stu -> System.out.println(stu.getName()));

        System.out.println("Studenti Sortati dupa nume:");
        sortByName(students);

        if(notaPeste5(students)){
            System.out.println("Exista nota peste 5");
        } else System.out.println("Nu exista nota peste 5");
    }
    //metoda generica care extinde user
    public static Box<? extends User> boxUser(User user){
        return new Box<>(user);
    }
    //metoda generica pentru cel mai lung toString
    public static <T> T longestToString(List<T> list){
        return list.stream()
                .max(Comparator.comparing(e -> e.toString().length()))
                .orElse(null);
    }
    //media notelor fiecarui student
    public static Map<String, Double> calculateAveragePerStudent(List<Student> students) {
        return students.stream()
                .collect(Collectors.toMap(
                        Student::getName,
                        s -> s.getGrades().values().stream()
                                .mapToDouble(Double::doubleValue)
                                .average()
                                .orElse(0.0)
                ));
    }
    //cursurile diferite din lista de profesori
    public static List<String> cursuriDiferite(List<Instructor> instructors){
        return instructors.stream()
                .flatMap(i -> i.getLectures().stream())
                .distinct()
                .toList();
    }

    //numele utilizatorilor din Box<User>
    public static List<String> numeUsers(List<Box<User>> users){
        return users.stream()
                .map(b -> b.getValue())
                .map(u -> u.getName())
                .toList();
    }
    //studentii cu media peste 8
    public static List<Student> mediePeste8(List<Student> studenti){
        return studenti.stream()
                .filter(s->s.getGrades().values().stream()
                        .mapToDouble(Double::doubleValue)
                        .average()
                        .orElse(0.0) > 8.0)
                .toList();
    }
    //returnez o Lista generica dintr o lista de boxes
    public static <T> List<T> unwrap(List<Box<T>> boxes){
        return boxes.stream()
                .map(b -> b.getValue())
                .toList();
    }

    //sorteaza studentii descrescator dupa medie
    public static List<Student> sortDescresc(List<Student> students){
        return students.stream()
                .sorted(Comparator.comparingDouble(
                        (Student s) -> s.getGrades().values().stream()
                                .mapToDouble(d -> d.doubleValue())
                                .average()
                                .orElse(0.0)
                ).reversed())
                .toList();
    }

    public static void sortByName(List<Student> list){
        list.stream().sorted(Comparator.comparing(s -> s.getName())).forEach(e -> System.out.println(e));
    }

    //returnez daca toti studentii au o nota peste 5
    public static boolean notaPeste5(List<Student> students){
        return students.stream()
                .allMatch(s -> s.getGrades().values().stream()
                        .anyMatch(nota -> nota > 5.0));
    }
}