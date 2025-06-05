package org.example;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class Main{
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        Box b1 = new Box("Antonio");
        Box b2 = new Box("Gica");
        Box b3 = new Box("Ionel");

        List<Box<String>> lista1 = List.of(b1, b2, b3);

        List<String> unwrappedList = unwrap(lista1);

        unwrappedList.forEach(e -> System.out.println(e));

        User u1 = new Student("Antonio", 1, Map.of("AC", 10.0, "PSN", 7.0));
        Box b4 = userBox(u1);
        System.out.println(b4.getValue());

        System.out.println("Longest toString: " + longestToString(unwrappedList));

        User obj = new Student("Ionut", 2, Map.of("PL", 10.0, "PC", 7.0));
        Class<?> clazz = obj.getClass();
        Method m = clazz.getMethod("getCourses");
        Map<String, Double> cursuri = (Map<String, Double>) m.invoke(obj);
        cursuri.forEach((nume, nota) -> System.out.println("Curs: " + nume + " | Nota: " + nota));

        Student s1 = new Student("Dan", 2, Map.of("OOP", 10.0, "PC", 10.0));
        Class<?> clazz1 = s1.getClass();
        Field[] fields = clazz1.getDeclaredFields();
        for(Field f: fields){
            f.setAccessible(true);
            System.out.println(f.getName() + " | " + f.get(s1));
        }

        Class<?> clazz2 = Mentor.class;
        Constructor ctor = clazz2.getConstructor(String.class, Map.class);
        Object o = ctor.newInstance("Antonio", Map.of("EGC", 4.0, "MSI", 10.0));
        System.out.println(o);
    }

    public static <T> List<T> unwrap(List<Box<T>> boxes){
        return boxes.stream()
                .map(b -> b.getValue())
                .toList();
    }

    public static Box<? extends User> userBox(User user){
        return new Box<>(user);
    }

    public static <T> T longestToString(List<T> list){
        return list.stream()
                .max(Comparator.comparing(e -> e.toString().length()))
                .orElse(null);
    }
    public static List<Student> mediaPeste8(List<Student> students){
        return students.stream()
                .filter(s->s.getCourses().values().stream()
                        .mapToDouble(Double::doubleValue)
                        .average()
                        .orElse(0.0) > 8.0)
                .toList();
    }
    public static List<String> numeUsers(List<Box<User>> lista){
        return lista.stream()
                .map(b -> b.getValue())
                .map(u -> u.getName())
                .toList();
    }
    public static List<Student> sortStudents(List<Student> students){
        return students.stream()
                .sorted(Comparator.comparingDouble(
                        (Student s) -> s.getCourses().values().stream()
                                .mapToDouble(Double::doubleValue)
                                .average()
                                .orElse(0.0)
                ).reversed())
                .toList();
    }
}