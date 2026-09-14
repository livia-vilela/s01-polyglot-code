package main

import "fmt"

func main() {

	var firstQuarter, secondQuarter, thirdQuarter int

	fmt.Print("Enter the sales for the 1st quarter: ")
	fmt.Scanln(&firstQuarter)

	fmt.Print("Enter the sales for the 2nd quarter: ")
	fmt.Scanln(&secondQuarter)

	fmt.Print("Enter the sales for the 3rd quarter: ")
	fmt.Scanln(&thirdQuarter)

	totalSales := firstQuarter + secondQuarter + thirdQuarter

	if totalSales < 100 {
		fmt.Println("\nError: Minimum annual goal not reached.")
		return
	}

	fmt.Printf("\nTotal sales: %d units\n", totalSales)

	switch {
	case totalSales >= 250:
		fmt.Println("Classification: Top Seller")

	case totalSales >= 180 && totalSales <= 249:
		fmt.Println("Classification: Senior")

	case totalSales >= 100 && totalSales <= 179:
		fmt.Println("Classification: Full")
	}
}