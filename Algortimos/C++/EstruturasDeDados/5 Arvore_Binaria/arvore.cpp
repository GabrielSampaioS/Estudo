#include "arvore.h"
#include <iostream>


//teste
#include <iomanip> // Para usar std::setw
//
using namespace std;

void Arvore::inserir(int valor) 
{
    No *novo = new No(valor);
    if (raiz == nullptr)
    {
        raiz = novo; // se raiz não tiver nenhum valor
    }
    else
    {
        No *atual = raiz;
        No *anterior = nullptr;

        while (atual != nullptr) //Até encontrar um endereço vazio
        {
            anterior = atual;

            if (valor < anterior->valor)
            {
                atual = atual->Lfilho;
            }
            else
            {
                atual = atual->Rfilho;
            }
        }

        if (valor < atual->valor)
        {
            anterior->Lfilho = novo;
        }
        else
        {
            anterior->Rfilho = novo;
        }
    }
}


