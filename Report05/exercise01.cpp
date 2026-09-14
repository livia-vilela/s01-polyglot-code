#include <iostream>
using namespace std;

int combine_teams(int n) {
    if (n == 0)
        return 0;
    
    if (n == 1)
        return 1;

    return combine_teams(n - 1) +combine_teams(n - 2);
}

int main() {
    int n;

    cout << "Enter the bracket size (n): ";
    cin >> n;

    cout << "Total number of possible confrontation scenarios: " << combine_teams(n) << endl;

    return 0;
}