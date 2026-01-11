greeter.greet()

// Swift Advanced Syntax Test for Solarized Flat Theme
import Foundation

protocol Greetable {
    func greet(name: String)
}

enum Color: String {
    case red, green, blue
}

struct User: CustomStringConvertible {
    var id: Int
    var name: String
    var active: Bool = true {
        willSet { print("Will set active to \(newValue)") }
        didSet { print("Did set active from \(oldValue)") }
    }
    var description: String { "User(id: \(id), name: \(name), active: \(active))" }
}

class Dog: Greetable {
    var name: String
    init(name: String) { self.name = name }
    func greet(name: String) {
        print("Hello, \(name)!")
    }
    func speak() { print("\(name) barks!") }
}

extension Array where Element == Int {
    func squared() -> [Int] { self.map { $0 * $0 } }
}

func tryDivide(_ a: Int, _ b: Int) throws -> Int {
    if b == 0 { throw NSError(domain: "DivideByZero", code: 1) }
    return a / b
}

func asyncAdd(_ a: Int, _ b: Int) async -> Int { a + b }

func main() async {
    let user = User(id: 1, name: "Alice")
    print(user)
    var dog = Dog(name: "Buddy")
    dog.greet(name: user.name)
    dog.speak()
    let nums = [1, 2, 3]
    print(nums.squared())
    do {
        let _ = try tryDivide(10, 0)
    } catch {
        print("Caught error: \(error)")
    }
    let sum = await asyncAdd(2, 3)
    print("Async sum: \(sum)")
    let color: Color = .green
    switch color {
    case .red: print("Red")
    case .green: print("Green")
    case .blue: print("Blue")
    }
    let closure: (String) -> Void = { print("Closure: \($0)") }
    closure("Test")
}

@main
struct Entry {
    static func main() async {
        await main()
    }
}
