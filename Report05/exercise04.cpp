#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int solar_matrix[5][5] = {0};
    int option = 0;
    int row, column;

    while (option != 3) {
        cout << "\n=== SOLAR PANEL TELEMETRY ===" << endl;
        cout << "1. Activate Cell" << endl;
        cout << "2. View Matrix Map" << endl;
        cout << "3. Exit" << endl;
        cout << "Choose an option: ";
        cin >> option;

        if (option == 1) {
            cout << "Enter the row (0-4): ";
            cin >> row;

            cout << "Enter the column (0-4): ";
            cin >> column;

            if (row >= 0 && row < 5 && column >= 0 && column < 5) {
                if (solar_matrix[row][column] == 0) {
                    solar_matrix[row][column] = 1;
                    cout << "Success: Solar cell activated!" << endl;
                } else {
                    cout << "Error: Solar cell is already operating!" << endl;
                }
            } else {
                cout << "Error: Invalid row or column!" << endl;
            }
        }

        else if (option == 2) {
            cout << "\n--- Solar Matrix Map ---" << endl;

            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << solar_matrix[i][j] << "] ";
                }
                cout << endl;
            }
        }

        else if (option == 3) {
            cout << "Exiting the system..." << endl;
        }

        else {
            cout << "Invalid option! Please try again." << endl;
        }
    }

    int activeCells = 0;
    int inactiveCells = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (solar_matrix[i][j] == 1) {
                activeCells++;
            } else {
                inactiveCells++;
            }
        }
    }

    float operationalPercentage = (activeCells / 25.0) * 100;

    cout << "\n=== FINAL OPERATION REPORT ===" << endl;
    cout << "Total ACTIVE cells: " << activeCells << endl;
    cout << "Total INACTIVE cells: " << inactiveCells << endl;

    cout << fixed << setprecision(2);
    cout << "Operational Capacity: " << operationalPercentage << "%" << endl;

    return 0;
}