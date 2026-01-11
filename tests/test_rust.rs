
// Rust Advanced Syntax Test for Solarized Flat Theme
use std::fmt::{self, Display};
use std::collections::HashMap;
use std::error::Error;
use std::future::Future;

#[derive(Debug, Clone, PartialEq)]
enum Color {
    Red,
    Green,
    Blue,
    Rgb(u8, u8, u8),
}

trait Speak {
    fn speak(&self);
}

struct Animal<'a> {
    name: &'a str,
}

impl<'a> Speak for Animal<'a> {
    fn speak(&self) {
        println!("{} makes a sound.", self.name);
    }
}

struct Dog<'a> {
    animal: Animal<'a>,
}

impl<'a> Speak for Dog<'a> {
    fn speak(&self) {
        self.animal.speak();
        println!("{} barks!", self.animal.name);
    }
}

struct Point<T> {
    x: T,
    y: T,
}

impl<T: Display> Display for Point<T> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "({}, {})", self.x, self.y)
    }
}

async fn async_add(a: i32, b: i32) -> i32 {
    a + b
}

fn test_type(a: i32, b: bool, c: &str, d: f64) {
    let _ = a;
    let _ = b;
    let _ = c;
    let _ = d;
}

macro_rules! say_hello {
    ($name:expr) => {
        println!("Hello, {}!", $name);
    };
}

fn try_divide(a: i32, b: i32) -> Result<i32, Box<dyn Error>> {
    if b == 0 {
        Err("division by zero".into())
    } else {
        Ok(a / b)
    }
}

mod utils {
    pub fn square(x: i32) -> i32 { x * x }
}

fn main() {
    let mut map: HashMap<&str, i32> = HashMap::new();
    map.insert("a", 1);
    map.insert("b", 2);
    for (k, v) in &map {
        println!("{}: {}", k, v);
    }

    let p = Point { x: 3, y: 4 };
    println!("Point: {}", p);

    let dog = Dog { animal: Animal { name: "Buddy" } };
    dog.speak();

    say_hello!("Rustacean");

    match Color::Rgb(128, 64, 32) {
        Color::Red => println!("Red"),
        Color::Green => println!("Green"),
        Color::Blue => println!("Blue"),
        Color::Rgb(r, g, b) => println!("RGB({}, {}, {})", r, g, b),
    }

    match try_divide(10, 0) {
        Ok(val) => println!("10/0 = {}", val),
        Err(e) => println!("Error: {}", e),
    }

    println!("Square: {}", utils::square(5));

    let fut = async_add(2, 3);
    let sum = futures::executor::block_on(fut);
    println!("Async sum: {}", sum);
}
