greet($user->name);

<?php
// PHP Advanced Syntax Test for Solarized Flat Theme

namespace ThemeTest;

#[Attribute]
class Info {
    public function __construct(public string $desc) {}
}

interface Greetable {
    public function greet(string $name): void;
}

trait Logger {
    public function log(string $msg): void {
        echo "[LOG] $msg\n";
    }
}

class User {
    use Logger;
    public function __construct(public string $name, public bool $active = true) {}
}

class Dog implements Greetable {
    use Logger;
    public function __construct(public string $name) {}
    public function greet(string $name): void {
        $this->log("Greeting $name");
        echo "Hello, $name!\n";
    }
}

function gen_numbers(int $n): 
    \Generator {
    for ($i = 0; $i < $n; $i++) {
        yield $i;
    }
}

function try_divide(int $a, int $b): int|null {
    try {
        return $a / $b;
    } catch (\DivisionByZeroError $e) {
        echo "Error: {$e->getMessage()}\n";
        return null;
    }
}

#[Info(desc: "Main entry point")]
function main() {
    $user = new User("Alice");
    $dog = new Dog("Buddy");
    $dog->greet($user->name);
    foreach (gen_numbers(3) as $num) {
        echo "Num: $num\n";
    }
    $result = try_divide(10, 0);
    $arr = array_map(fn($x) => $x * $x, [1, 2, 3]);
    print_r($arr);
}

main();
?>
