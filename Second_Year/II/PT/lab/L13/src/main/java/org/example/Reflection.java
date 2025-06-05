package org.example;

import java.lang.reflect.Field;
import java.util.List;

public class Reflection{
    public static <T> List<T> filterByField(List<T> obj, String field, Object value){
        return obj.stream()
                .filter(o -> {
                    try {
                        Field f = o.getClass().getDeclaredField(field);
                        f.setAccessible(true);
                        Object fieldValue = f.get(o);
                        return f.equals(value);
                    }catch(Exception e){
                        return false;
                    }
                })
                .toList();
    }

    public static <T> void printAll(List<T> objects) throws IllegalAccessException {
        for(T obj : objects){
            Class<?> clazz = obj.getClass();
            System.out.println("Numele clasei: " + clazz.getSimpleName());

            for(Field f : clazz.getDeclaredFields()){
                f.setAccessible(true);
                Object value = f.get(obj);
                System.out.println("Field: " + f.getName() + " Valoare: " + value);
            }
        }
    }
}
