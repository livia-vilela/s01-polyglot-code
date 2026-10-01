#include <iostream>
#include <vector>

using namespace std;

class Hobbit {
public:
    string nome;

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome
             << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }
};

class Jardineiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O jardineiro " << nome
             << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O cozinheiro " << nome
             << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O fazendeiro " << nome
             << " esta colhendo vegetais e hortcalicas em suas terras!" << endl;
    }
};

int main() {

    Jardineiro jardineiro;
    Cozinheiro cozinheiro;
    Fazendeiro fazendeiro;

    cout << "Digite o nome do jardineiro: ";
    cin >> jardineiro.nome;

    cout << "Digite o nome do cozinheiro: ";
    cin >> cozinheiro.nome;

    cout << "Digite o nome do fazendeiro: ";
    cin >> fazendeiro.nome;

    vector<Hobbit*> hobbits;

    hobbits.push_back(&jardineiro);
    hobbits.push_back(&cozinheiro);
    hobbits.push_back(&fazendeiro);

    for (Hobbit* h : hobbits) {
        h->fazerAtividade();
    }

    return 0;
}