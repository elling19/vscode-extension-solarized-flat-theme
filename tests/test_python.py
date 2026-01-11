
# Python Advanced Syntax Test for Solarized Flat Theme
from __future__ import annotations
import asyncio
from dataclasses import dataclass, field
from typing import Any, Callable, Generator, List, Optional, TypeVar, Generic, Union

T = TypeVar('T')

def decorator(func: Callable) -> Callable:
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@dataclass
class User:
    id: int
    name: str
    is_active: bool = True
    tags: List[str] = field(default_factory=list)

class Box(Generic[T]):
    def __init__(self, value: T):
        self.value = value

class Animal:
    def __init__(self, name: str):
        self.name = name
    def speak(self) -> None:
        print(f"{self.name} makes a sound.")

class Dog(Animal):
    @decorator
    def speak(self) -> None:
        super().speak()
        print(f"{self.name} barks.")

async def async_add(a: int, b: int) -> int:
    await asyncio.sleep(0.1)
    return a + b

def gen_numbers(n: int) -> Generator[int, None, None]:
    for i in range(n):
        yield i

def context_manager():
    class Dummy:
        def __enter__(self):
            print("Enter context")
        def __exit__(self, exc_type, exc_val, exc_tb):
            print("Exit context")
    return Dummy()

def main():
    users = [User(1, "Alice"), User(2, "Bob", False)]
    dog = Dog("Buddy")
    dog.speak()
    box = Box[User](users[0])
    print(box.value)
    nums = [x**2 for x in range(5) if x % 2 == 0]
    print(nums)
    with context_manager():
        print("In context")
    try:
        1 / 0
    except ZeroDivisionError as e:
        print(f"Caught: {e}")
    print(list(gen_numbers(3)))
    print({x: x**2 for x in range(3)})

    async def run_async():
        result = await async_add(2, 3)
        print(f"Async result: {result}")
    asyncio.run(run_async())

if __name__ == "__main__":
    main()
