enum class Color { RED, GREEN, BLUE }

// Kotlin Advanced Syntax Test for Solarized Flat Theme
import kotlinx.coroutines.*

data class User(val id: Int, val name: String, var active: Boolean = true)

sealed class Result<out T>
data class Success<T>(val value: T): Result<T>()
data class Failure(val error: Throwable): Result<Nothing>()

interface Greeter {
    fun greet(name: String)
}

enum class Color { RED, GREEN, BLUE }

class Dog(val name: String): Greeter {
    override fun greet(name: String) {
        println("Hello, $name!")
    }
    fun speak() = println("$name barks!")
}

fun <T> List<T>.squared(transform: (T) -> Int): List<Int> = this.map(transform).map { it * it }

fun tryDivide(a: Int, b: Int): Result<Int> =
    if (b == 0) Failure(ArithmeticException("/ by zero")) else Success(a / b)

suspend fun asyncAdd(a: Int, b: Int): Int = withContext(Dispatchers.Default) { a + b }

fun main() = runBlocking {
    val user = User(1, "Alice")
    val dog = Dog("Buddy")
    dog.greet(user.name)
    dog.speak()
    val nums = listOf(1, 2, 3)
    println(nums.squared { it })
    when(val res = tryDivide(10, 0)) {
        is Success -> println("Result: ${res.value}")
        is Failure -> println("Error: ${res.error}")
    }
    val sum = asyncAdd(2, 3)
    println("Async sum: $sum")
    val color: Color = Color.GREEN
    when(color) {
        Color.RED -> println("Red")
        Color.GREEN -> println("Green")
        Color.BLUE -> println("Blue")
    }
    val obj = object { val x = 42 }
    println("Object expr: ${obj.x}")
    val (id, name, active) = user
    println("Destructured: $id, $name, $active")
    val closure: (String) -> Unit = { println("Closure: $it") }
    closure("Test")
}
