#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " esta duelando contra "
             << rival.nome << "!" << endl;

        rival.energia -= potenciaSom;
    }
};

int main() {

    Banda banda1;
    Banda banda2;

    cout << "Digite o nome da primeira banda: ";
    cin >> banda1.nome;

    cout << "Digite a quantidade de integrantes: ";
    cin >> banda1.integrantes;

    cout << "Digite a potencia do som: ";
    cin >> banda1.potenciaSom;

    cout << "Digite a energia da banda: ";
    cin >> banda1.energia;


    cout << "\nDigite o nome da segunda banda: ";
    cin >> banda2.nome;

    cout << "Digite a quantidade de integrantes: ";
    cin >> banda2.integrantes;

    cout << "Digite a potencia do som: ";
    cin >> banda2.potenciaSom;

    cout << "Digite a energia da banda: ";
    cin >> banda2.energia;


    banda1.duelar(banda2);


    cout << "\n--- STATUS FINAL ---" << endl;

    cout << "Banda: " << banda1.nome << endl;
    cout << "Integrantes: " << banda1.integrantes << endl;
    cout << "Potencia do som: " << banda1.potenciaSom << endl;
    cout << "Energia: " << banda1.energia << endl;

    cout << "\nBanda: " << banda2.nome << endl;
    cout << "Integrantes: " << banda2.integrantes << endl;
    cout << "Potencia do som: " << banda2.potenciaSom << endl;
    cout << "Energia: " << banda2.energia << endl;

    return 0;
}