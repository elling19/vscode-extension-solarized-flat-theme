
// C# Advanced Syntax Test for Solarized Flat Theme
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ThemeTest {
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class InfoAttribute : Attribute {
        public string Description { get; }
        public InfoAttribute(string desc) => Description = desc;
    }

    public enum Color { Red, Green, Blue }

    public interface IGreetable {
        void Greet(string name);
    }

    public delegate void Notify(string message);

    public record User(int Id, string Name, bool IsActive);

    public class Animal {
        public string Name { get; set; }
        public event Notify? OnSpeak;
        public Animal(string name) => Name = name;
        public virtual void Speak() {
            OnSpeak?.Invoke($"{Name} makes a sound.");
        }
    }

    public class Dog : Animal, IGreetable {
        public Dog(string name) : base(name) { }
        public override void Speak() {
            base.Speak();
            Console.WriteLine($"{Name} barks.");
        }
        public void Greet(string name) {
            Console.WriteLine($"Hello, {name}!");
        }
    }

    public static class Utils {
        public static (int, int) Swap(int a, int b) => (b, a);
        public static IEnumerable<T> FilterActive<T>(IEnumerable<T> items) where T : User => items.Where(u => u.IsActive);
        public static async Task<int> ComputeAsync(int x) {
            await Task.Delay(100);
            return x * x;
        }
    }

    [Info("Main entry point")]
    class Program {
        static async Task Main(string[] args) {
            var users = new List<User> {
                new(1, "Alice", true),
                new(2, "Bob", false),
                new(3, "Carol", true)
            };
            var active = Utils.FilterActive(users);
            foreach (var u in active) {
                Console.WriteLine($"Active: {u.Name}");
            }

            var dog = new Dog("Buddy");
            dog.OnSpeak += msg => Console.WriteLine($"Event: {msg}");
            dog.Speak();
            dog.Greet("World");

            var (x, y) = Utils.Swap(1, 2);
            Console.WriteLine($"Swapped: {x}, {y}");

            try {
                int result = await Utils.ComputeAsync(5);
                Console.WriteLine($"Async result: {result}");
            } catch (Exception ex) {
                Console.WriteLine($"Error: {ex.Message}");
            }

            object obj = dog;
            switch (obj) {
                case Dog d:
                    Console.WriteLine($"Pattern matched: {d.Name}");
                    break;
                case Animal a:
                    Console.WriteLine($"Animal: {a.Name}");
                    break;
                default:
                    Console.WriteLine("Unknown type");
                    break;
            }
        }
    }
}
