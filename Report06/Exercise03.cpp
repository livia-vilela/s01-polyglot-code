#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
public:
    string nome;

    void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: "
             << nome << "." << endl;
    }
};

class Aluno : public MembroInatel {
public:
    string curso;

    void seApresentar() {
        cout << "Meu nome e " << nome
             << " e estudo no curso de "
             << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
public:
    string disciplina;

    void seApresentar() {
        cout << "Meu nome e " << nome
             << " e leciono a disciplina de "
             << disciplina << "." << endl;
    }
};

int main() {

    Aluno aluno;
    Professor professor;

    cout << "Digite o nome do aluno: ";
    cin >> aluno.nome;

    cout << "Digite o curso do aluno: ";
    cin >> aluno.curso;

    cout << "\nDigite o nome do professor: ";
    cin >> professor.nome;

    cout << "Digite a disciplina: ";
    cin >> professor.disciplina;

    cout << "\n";

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}