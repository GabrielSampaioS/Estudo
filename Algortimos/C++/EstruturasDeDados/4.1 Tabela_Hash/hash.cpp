#include <iostream>
#include "hash.h"

const int max_items = 100;

using namespace std;

Hash::Hash()
{
    int lenght = 0;

    // Cada espaço na memoria sera um obj Aluno, certo ?
    structure = new Aluno[max_items];
}

Hash::~Hash()
{
    delete[] structure;
}

bool Hash::isFull() const
{
    return (length == max_items);
}

int Hash::getlength() const
{
    return length;
}

void Hash::print()
{
    for (int i = 0; i < max_items; i++)
    {
        if (structure[i].getRa() != -1){
            cout << i << ": " << structure[i].getRa() << ',' << structure[i].getName() << endl;
        }
    }
}

// Aluno possui RA, exemplo Ra = 278
//  278 % 100 = 78
int Hash::getHash(Aluno aluno)
{
    return aluno.getRa() % max_items;
}

// Caso tenha iniciado o aluno e não tenha insert na tabela hash
void Hash::retriveItem(Aluno &aluno, bool &found)
{
    int indice = getHash(aluno);
    Aluno aux = structure[indice];
    

    if (aluno.getRa() != aux.getRa())
    {
        found = false;
    }
    else
    {
        found = true;
        aluno = aux;
    }
}
void Hash::insertItem(Aluno aluno)
{

    int indice = getHash(aluno);
    // cout << "Teste:" << indice << "Aluno: " << aluno.getName() << endl;
    structure[indice] = aluno;
    length++;
}
void Hash::deleteItem(Aluno aluno)
{

    int indice = getHash(aluno);

    // passando o construtor Aluno()
    structure[indice] = Aluno();
    length--;
}

