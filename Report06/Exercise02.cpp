#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:

    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    void subirRank() {
        rank++;
    }
};

int main() {

    LinkSocial link;

    string nome;
    string arcana;
    int rank;

    cout << "Digite o nome do personagem: ";
    cin >> nome;

    cout << "Digite a arcana: ";
    cin >> arcana;

    cout << "Digite o rank inicial: ";
    cin >> rank;

    link.setNome(nome);
    link.setArcana(arcana);
    link.setRank(rank);

    link.subirRank();

    cout << "\n--- LINK SOCIAL ---" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}