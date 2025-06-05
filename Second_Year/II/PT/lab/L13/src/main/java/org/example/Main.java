package org.example;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) throws IOException, ClassNotFoundException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException, NoSuchFieldException {
        List<MonitoredData> monitoredList = Files.lines(Paths.get("/media/toni/stuff/TUCN/UTCN/Second_Year/II/PT/lab/L13/src/main/java/org/example/file.txt"))
                .map(line -> {
                    String[] parts = line.split("\\s{2,}");
                    return new MonitoredData(parts[0], parts[1], parts[2]);
                })
                .toList();

        MonitoredData obj = new MonitoredData("10", "11", "Golf");
        Method[] method = obj.getClass().getDeclaredMethods();
        for(Method m : method){
            System.out.println(m.getName());
        }

        System.out.println("Fields:");

        Class<?> clazz = MonitoredData.class;
        for(Field f : clazz.getDeclaredFields()){
            System.out.println(f.getName());
        }

//        Class<?> clazz1 = Dog.class;
//        Constructor<?> ctor = clazz1.getConstructor();
//        Dog d2 = (Dog) ctor.newInstance();

        Field f = obj.getClass().getDeclaredField("activity");
        f.setAccessible(true);
        System.out.println(f.get(obj));

        f.set(obj, "Baschet");
        System.out.println(f.get(obj));

        Method m = obj.getClass().getDeclaredMethod("sayHello");
        m.invoke(obj);

        Box<String> box1 = new Box<>();
        box1.set("Salut");
        System.out.println(box1.get());

        Box<Integer> box2 = new Box<>();
        box2.set(123);
        System.out.println(box2.get());

        List<Animal> animals = List.of(
                new Dog("Rex"),
                new Cat("Mimi"),
                new Dog("Buddy"),
                new Cat("Tom"),
                new Dog("Max")
        );

        Map<String, Integer> res = getNumberOfMethods(animals);
        res.forEach((nume, val) -> System.out.println("Nume: " + nume + " numar de metode: " + val));
    }
    public static Map<String, Integer> getNumberOfMethods(List<Animal> animals){
        return animals.stream()
                .collect(Collectors.toMap(
                        a -> a.getName(),
                        animal -> {
                            Method[] methods = animal.getClass().getDeclaredMethods();
                            return (int)Arrays.stream(methods)
                                    .count();
                        }
                ));
    }
}