
// Scala Advanced Syntax Test for Solarized Flat Theme
import scala.concurrent._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util.{Try, Success, Failure}

sealed trait Result[+A]
case class Ok[A](value: A) extends Result[A]
case class Err(msg: String) extends Result[Nothing]

trait Greeter {
  def greet(name: String): Unit
}

object Color extends Enumeration {
  val Red, Green, Blue = Value
}

case class User(id: Int, name: String, active: Boolean = true)

class Dog(val name: String) extends Greeter {
  def greet(name: String): Unit = println(s"Hello, $name!")
  def speak(): Unit = println(s"$name barks!")
}

object Utils {
  def tryDivide(a: Int, b: Int): Result[Int] =
    if (b == 0) Err("/ by zero") else Ok(a / b)
  def squared(xs: List[Int]): List[Int] = xs.map(x => x * x)
}

object TestScala {
  def main(args: Array[String]): Unit = {
    val user = User(1, "Alice")
    val dog = new Dog("Buddy")
    dog.greet(user.name)
    dog.speak()
    val nums = List(1, 2, 3)
    println(Utils.squared(nums))
    Utils.tryDivide(10, 0) match {
      case Ok(v) => println(s"Result: $v")
      case Err(e) => println(s"Error: $e")
    }
    val color: Color.Value = Color.Green
    color match {
      case Color.Red => println("Red")
      case Color.Green => println("Green")
      case Color.Blue => println("Blue")
    }
    val closure: String => Unit = msg => println(s"Closure: $msg")
    closure("Test")
    val fut = Future { 2 + 3 }
    fut.onComplete {
      case Success(v) => println(s"Async sum: $v")
      case Failure(e) => println(s"Async error: $e")
    }
    for (i <- 1 to 3 if i % 2 == 1) yield println(s"Odd: $i")
    Thread.sleep(100) // Wait for future
  }
}
