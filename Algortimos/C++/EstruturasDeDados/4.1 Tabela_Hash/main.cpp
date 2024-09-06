#include <iostream>
#include <string>
#include <cstdlib> // Necessário para usar system("pause")

#include "hash.h"

using namespace std;

int main()
{
    Hash alunosHash;

    //Criando dados
    int ras[10] = {
        414, 481, 999, 124, 617,
        507, 647, 778, 665, 163};

    //Criando dados
    string names[10] = {
        "Gabriel",
        "Ana",
        "Camila",
        "Diego",
        "Hellen",
        "Fernanda",
        "Gustavo",
        "Harry",
        "Lais",
        "Janaina"};

    //Lopp para criar obj aluno e add na lista Hash
    for (int i = 0; i < 10; i++)
    {
        Aluno aluno(ras[i], names[i]);
        alunosHash.insertItem(aluno);
    }

    alunosHash.print();

    cout << endl << "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-" << endl;
    Aluno aluno(414, "Gabriel");
    bool teste;

    //Que ?
    alunosHash.retriveItem(aluno, teste);
    alunosHash.print();

    system("pause");

    return 0;

}
