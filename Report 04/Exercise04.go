package main

import "fmt"

func ValidateTicket(sector string, code int) bool {

	if sector == "VIP" && code == 2026 {
		return true
	}

	return false
}

func main() {

	var sector string
	var code int

	for {

		fmt.Print("Enter the ticket sector: ")
		fmt.Scanln(&sector)

		fmt.Print("Enter the ticket code: ")
		fmt.Scanln(&code)

		// Calls the function and checks the returned value
		if ValidateTicket(sector, code) {
			fmt.Println("Access granted to the VIP area!")
			break
		} else {
			fmt.Println("Invalid ticket or sector. Please try again.")
		}
	}
}