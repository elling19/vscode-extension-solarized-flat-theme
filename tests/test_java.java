
// Java Advanced Syntax Test for Solarized Flat Theme
import java.util.*;
import java.util.function.*;
import java.util.stream.*;

@FunctionalInterface
interface Greetable {
    void greet(String name);
}

enum Color { RED, GREEN, BLUE, RGB(int r, int g, int b); int r, g, b; Color() { r = g = b = 0; } Color(int r, int g, int b) { this.r = r; this.g = g; this.b = b; } }

@interface Info {
    String value();
}

abstract class Animal {
    protected String name;
    public Animal(String name) { this.name = name; }
    public abstract void speak();
}

class Dog extends Animal implements Greetable {
    public Dog(String name) { super(name); }
    @Override
    public void speak() {
        System.out.println(name + " barks!");
    }
    @Override
    public void greet(String name) {
        System.out.println("Hello, " + name + "!");
    }
}

record User(int id, String name, boolean active) {}

public class TestJava {
    @Info("Main entry point")
    public static void main(String[] args) {
        List<User> users = List.of(new User(1, "Alice", true), new User(2, "Bob", false));
        users.stream().filter(User::active).forEach(u -> System.out.println(u.name()));

        Dog dog = new Dog("Buddy");
        dog.speak();
        dog.greet("World");

        Map<String, Integer> map = new HashMap<>();
        map.put("a", 1); map.put("b", 2);
        map.forEach((k, v) -> System.out.println(k + ": " + v));

        try {
            int x = 1 / 0;
        } catch (ArithmeticException e) {
            System.err.println("Caught: " + e.getMessage());
        }

        Color c = Color.RGB;
        switch (c) {
            case RED -> System.out.println("Red");
            case GREEN -> System.out.println("Green");
            case BLUE -> System.out.println("Blue");
            case RGB -> System.out.println("RGB color");
        }

        class Inner {
            void show() { System.out.println("Inner class"); }
        }
        new Inner().show();

        Runnable r = () -> System.out.println("Lambda!");
        r.run();
    }
}
