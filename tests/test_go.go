type Person struct {
	Name string
	Age  int
}
	fmt.Printf("Hello, %s!\n", p.Name)
}
	p := Person{"Ada", 28}
	p.Greet()
	for i := 0; i < 3; i++ {
		fmt.Println(i)
	}

// Go Advanced Syntax Test for Solarized Flat Theme
package main

import (
	"fmt"
	"errors"
	"sync"
	"time"
)

type Greeter interface {
	Greet(string) string
}

type Person struct {
	Name string
	Age  int
}

func (p *Person) Greet(prefix string) string {
	return fmt.Sprintf("%s, %s!", prefix, p.Name)
}

type Logger struct{}
func (Logger) Log(msg string) { fmt.Println("[LOG]", msg) }

type Employee struct {
	Person
	Logger
	ID int
}

func genNumbers(n int) <-chan int {
	ch := make(chan int)
	go func() {
		defer close(ch)
		for i := 0; i < n; i++ {
			ch <- i
		}
	}()
	return ch
}

func tryDivide(a, b int) (int, error) {
	if b == 0 {
		return 0, errors.New("division by zero")
	}
	return a / b, nil
}

func main() {
	emp := Employee{Person: Person{"Ada", 28}, ID: 1001}
	emp.Log(emp.Greet("Hello"))

	for n := range genNumbers(3) {
		fmt.Println("Num:", n)
	}

	if res, err := tryDivide(10, 0); err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Result:", res)
	}

	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		defer wg.Done()
		time.Sleep(10 * time.Millisecond)
		fmt.Println("Goroutine done")
	}()
	wg.Wait()

	nums := []int{1, 2, 3}
	squares := make([]int, len(nums))
	for i, v := range nums {
		squares[i] = func(x int) int { return x * x }(v)
	}
	fmt.Println("Squares:", squares)
}
