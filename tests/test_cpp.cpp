
// C++ Advanced Syntax Test for Solarized Flat Theme
#include <iostream>
#include <vector>
#include <string>
#include <memory>
#include <map>
#include <algorithm>
#include <stdexcept>

namespace theme {
    enum class Color { Red, Green, Blue };

    template<typename T>
    class Box {
    public:
        Box(T value) : value_(value) {}
        T get() const { return value_; }
    private:
        T value_;
    };

    class Animal {
    public:
        Animal(std::string name) : name_(std::move(name)) {}
        virtual void speak() const { std::cout << name_ << " makes a sound.\n"; }
        virtual ~Animal() = default;
    protected:
        std::string name_;
    };

    class Dog : public Animal {
    public:
        Dog(std::string name) : Animal(std::move(name)) {}
        void speak() const override {
            Animal::speak();
            std::cout << name_ << " barks!\n";
        }
    };
}

constexpr int square(int x) { return x * x; }

int main() {
    using namespace theme;
    std::unique_ptr<Animal> dog = std::make_unique<Dog>("Buddy");
    dog->speak();

    Box<int> box(42);
    std::cout << "Boxed: " << box.get() << std::endl;

    std::vector<int> nums = {1, 2, 3, 4, 5};
    std::for_each(nums.begin(), nums.end(), [](int n) {
        std::cout << "Num: " << n << std::endl;
    });

    std::map<std::string, int> m = {{"a", 1}, {"b", 2}};
    for (const auto& [k, v] : m) {
        std::cout << k << ": " << v << std::endl;
    }

    try {
        if (nums.at(10)) {}
    } catch (const std::out_of_range& e) {
        std::cerr << "Caught: " << e.what() << std::endl;
    }

    Color c = Color::Green;
    switch (c) {
        case Color::Red: std::cout << "Red\n"; break;
        case Color::Green: std::cout << "Green\n"; break;
        case Color::Blue: std::cout << "Blue\n"; break;
    }

    std::cout << "Constexpr: " << square(7) << std::endl;
    return 0;
}
