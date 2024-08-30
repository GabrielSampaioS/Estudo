#include <iostream>
#include "lista.h"

using namespace std;


lista::lista()
{ 
    cabeca = nullptr;
    cauda = nullptr;
};


lista::lista(int v)
{
    cabeca = new No(v);
    cauda = cabeca;
}

//virtual lista::~lista()
lista::~lista()
{
    No *atual = cabeca;

    while (atual)
    {
        No *proximo = atual->getProx();
        delete atual;
        atual = proximo;
    }
}

bool lista::vazia() const
{ // Verificar se lista esta vazia
    return (cabeca == nullptr);
}

void lista::setcabeca(int v)
{
    No *novoNo = new No(v);
    if (vazia())
    {
        cabeca = novoNo;
        cauda = novoNo;
    }
    else
    {
        novoNo->setProx(cabeca);
        cabeca = novoNo;
    }
}

void lista::setcauda(int v)
{
    No *novoNo = new No(v);
    if (vazia())
    {
        cabeca = novoNo;
        cauda = novoNo;
    }
    else
    {
        cauda->setProx(novoNo);
        cauda = novoNo;
    }
}

void lista::mostrar() const
{ // Mosntar todos os elementos
    cout << "\n Mostrar todos os elementos \n";
    No *c = cabeca;

    if (vazia())
    {
        cout << "A lista NAO possui elementos!!\n";
    }
    else
    {
        while (c)
        { // Pecorrer cada elemento
            cout << c->getValor() << endl;
            c = c->getProx();
        }
        cout << endl;
    }
}

int lista::tamanho() const
{
    int tam = 0;
    No *c = cabeca;

    while (c)
    {
        c = c->getProx();
        tam++;
    }
    return tam;
}

bool lista::existe(int v)
{
    No *c = cabeca;

    while (c)
    {
        if (c->getValor() == v)
        {
            return true;
        }
        c = c->getProx();
    }
    return false;
}
