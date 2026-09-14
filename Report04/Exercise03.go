package main

import "fmt"

func GenerateOnCallSchedule(n int) {

	fmt.Println("\n--- Technical On-Call Schedule ---")

	for i := 1; i <= n; i++ {

		day := 1 + (i-1)*4

		fmt.Printf("On-call %d: Day %d of the month\n", i, day)
	}
}

func main() {

	var numberOfShifts int

	fmt.Print("Enter the number of required on-call shifts: ")
	fmt.Scanln(&numberOfShifts)

	GenerateOnCallSchedule(numberOfShifts)
}