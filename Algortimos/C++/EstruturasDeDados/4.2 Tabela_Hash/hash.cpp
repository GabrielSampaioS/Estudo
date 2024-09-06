#include <iostream>
#include "hash.h"

const int max_itens = 100;

using namespace std;

Hash::Hash()
{
    int length = 0;

    structure = new Aluno[max_itens];
}

Hash::~Hash()
{
    delete[] structure;
}

bool Hash::isFull() const
{
    return (length == max_itens);
}

int Hash::getlength() const
{
    return length;
}

void Hash::print()
{
    for (int i = 0; i < max_itens; i++)
    {
        // Os unicos valores possiveis < 0 são:
        //  -1 Não iniciado
        //  -2 Iniciado, porem excluido
        if (structure[i].getRa() < 0)
        {
            cout << i << ": " << structure[i].getRa() << " , " << structure[i].getName() << endl;
        }
    }
}

int Hash::getHash(Aluno aluno)
{
    return aluno.getRa() % max_itens;
}

// voids

//Precisa validar se isFull()
void Hash::insertItem(Aluno aluno)
{
    int indice = aluno.getRa();

    //Se for >= 0 já foi iniciado e não esta apagado
    while (structure[indice].getRa() >= 0)
    {
        indice++;
    }
    
    structure[indice] = aluno;
    length++;
}

void Hash::deleteItem(Aluno aluno)
{
    int indice = aluno.getRa();
    bool moroToSearch = true;
    int location = indice;

    do
    {
        if ((structure[location].getRa() == aluno.getRa()) || (structure[location].getRa() == -1))
        {
            moroToSearch = false;
        }
        else
        {
            location = (location + 1) % max_itens;
        }
    } while (location != indice && moroToSearch);

    if (structure[location].getRa() == aluno.getRa())
    {
        //-2 para informar que foi apagado
        structure[location] = Aluno(-2, "");
        length--;
    }
}

// Atualizar
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