g = Greeter.new("Ruby")
g.greet

# Ruby Advanced Syntax Test for Solarized Flat Theme
module Logger
  def log(msg)
    puts "[LOG] #{msg}"
  end
end

class User
  attr_accessor :id, :name, :active
  def initialize(id, name, active: true)
    @id, @name, @active = id, name, active
  end
  def to_s = "User(id: #{@id}, name: #{@name}, active: #{@active})"
end

class Dog
  include Logger
  attr_reader :name
  def initialize(name) = @name = name
  def greet(name)
    log("Greeting #{name}")
    puts "Hello, #{name}!"
  end
  def speak = puts "#{@name} barks!"
end

module EnumerableExt
  refine Enumerable do
    def squared
      map { |x| x * x }
    end
  end
end

def try_divide(a, b)
  raise ZeroDivisionError, 'div by zero' if b == 0
  a / b
end

def async_add(a, b)
  Thread.new { a + b }
end

using EnumerableExt

user = User.new(1, 'Alice')
dog = Dog.new('Buddy')
dog.greet(user.name)
dog.speak
nums = [1, 2, 3]
puts nums.squared.inspect
begin
  try_divide(10, 0)
rescue => e
  puts "Caught error: #{e}"
end
sum = async_add(2, 3).value
puts "Async sum: #{sum}"
color = :green
case color
when :red then puts 'Red'
when :green then puts 'Green'
when :blue then puts 'Blue'
end
closure = ->(msg) { puts "Closure: #{msg}" }
closure.call('Test')
