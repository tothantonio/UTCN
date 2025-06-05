package org.example;

import java.util.List;

import static org.example.Reflection.printAll;

public class App {
    public static void main(String[] args) throws IllegalAccessException {

        List<User> users = List.of(
                new User("Ana", 30),
                new User("Ion", 40),
                new User("Elena", 30)
        );

        List<User> result = Reflection.filterByField(users, "age", 30);

        result.forEach(System.out::println);

        printAll(users);
    }
}
