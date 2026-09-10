package main

import "fmt"

func ValidateTrackingCode(code string) (bool, string) {

	if len(code) == 10 {
		return true, "Tracking code registered in the system!"
	}

	return false, "Error: The tracking code must have exactly 10 characters."
}

func main() {

	var code string
	var status bool
	var message string

	for !status {

		fmt.Print("Enter the tracking code: ")
		fmt.Scanln(&code)

		status, message = ValidateTrackingCode(code)

		fmt.Println(message)
	}
}