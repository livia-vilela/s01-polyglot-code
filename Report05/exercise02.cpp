#include <iostream>
using namespace std;

float calculate_system_reliability(float probabilities[], int size) {
    float reliability = 1.0;

    for (int i = 0; i < size; i++) {
        reliability *= probabilities[i];
    }

    return reliability;
}

int main() {
    int size;

    cout << "Enter the number of components: ";
    cin >> size;

    float probabilities[size];

    for (int i = 0; i < size; i++) {
        cout << "Enter the operating probability of component " << i << ": ";
        cin >> probabilities[i];
    }

    float result = calculate_system_reliability(probabilities, size);

    cout << "Combined probability of system operation: " << result << endl;

    return 0;
}