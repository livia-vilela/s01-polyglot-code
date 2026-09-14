#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    float maximumCapacity;
    float currentLoad = 0.0;
    float packageWeight;
    int option;

    cout << "Enter the drone's maximum load capacity (kg): ";
    cin >> maximumCapacity;

    do {
        cout << "\n=== DRONE CARGO SYSTEM ===" << endl;
        cout << "1. Check Current Load" << endl;
        cout << "2. Load Package" << endl;
        cout << "3. Unload Package" << endl;
        cout << "4. End Operation" << endl;
        cout << "Choose an option: ";
        cin >> option;

        switch (option) {
            case 1:
                cout << fixed << setprecision(2);
                cout << "Current Load: " << currentLoad << " kg / " << maximumCapacity << " kg" << endl;
                cout << "Available Space: " << maximumCapacity - currentLoad << " kg" << endl;
                break;

            case 2:
                cout << "Enter the weight of the package to load (kg): ";
                cin >> packageWeight;

                if (currentLoad + packageWeight <= maximumCapacity) {
                    currentLoad += packageWeight;
                    cout << "Package loaded successfully!" << endl;
                } else {
                    cout << "Alert: Maximum takeoff weight exceeded! Operation canceled." << endl;
                }
                break;

            case 3:
                cout << "Enter the weight to unload (kg): ";
                cin >> packageWeight;

                if (packageWeight <= currentLoad) {
                    currentLoad -= packageWeight;
                    cout << "Package unloaded successfully!" << endl;
                } else {
                    cout << "Alert: Cannot unload more weight than the current load!" << endl;
                }
                break;

            case 4:
                cout << "Shutting down telemetry system..." << endl;
                break;

            default:
                cout << "Invalid option! Please try again." << endl;
        }

    } while (option != 4);

    return 0;
}