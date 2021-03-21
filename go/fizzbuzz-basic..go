//Implements a basic FizzBuzz solution.
//Prioritizes readability over optimization.
package main

import (
	"fmt"
	"strconv"
)

func main() {
	for i := 1; i <= 100; i++ {

		out := line(i)
		fmt.Println(out)
	}
}

func line(num int) string {
	db3 := divisible(num, 3)
	db5 := divisible(num, 5)

	switch {
	case db3 && db5:
		return "FizzBuzz"
	case db3:
		return "Fizz"
	case db5:
		return "Buzz"
	default:
		return strconv.Itoa(num)
	}
}

func divisible(a int, b int) bool {
	return a%b == 0
}
