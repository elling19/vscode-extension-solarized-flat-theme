enum Color { red, green, blue }

// Dart Advanced Syntax Test for Solarized Flat Theme
import 'dart:async';

abstract class Greeter {
  void greet(String name);
}

enum Color { red, green, blue }

mixin Logger {
  void log(String msg) => print('[LOG] $msg');
}

class User {
  final int id;
  final String name;
  bool active;
  User(this.id, this.name, {this.active = true});
  @override
  String toString() => 'User(id: $id, name: $name, active: $active)';
}

class Dog with Logger implements Greeter {
  final String name;
  Dog(this.name);
  @override
  void greet(String name) {
    log('Greeting $name');
    print('Hello, $name!');
  }
  void speak() => print('$name barks!');
}

extension IntListExt on List<int> {
  List<int> squared() => map((x) => x * x).toList();
}

Future<int> asyncAdd(int a, int b) async => a + b;

int tryDivide(int a, int b) {
  if (b == 0) throw Exception('Divide by zero');
  return a ~/ b;
}

void main() async {
  var user = User(1, 'Alice');
  var dog = Dog('Buddy');
  dog.greet(user.name);
  dog.speak();
  var nums = [1, 2, 3];
  print(nums.squared());
  try {
    tryDivide(10, 0);
  } catch (e) {
    print('Caught error: $e');
  }
  var sum = await asyncAdd(2, 3);
  print('Async sum: $sum');
  var color = Color.green;
  switch (color) {
    case Color.red:
      print('Red');
      break;
    case Color.green:
      print('Green');
      break;
    case Color.blue:
      print('Blue');
      break;
  }
  var closure = (String msg) => print('Closure: $msg');
  closure('Test');
}
