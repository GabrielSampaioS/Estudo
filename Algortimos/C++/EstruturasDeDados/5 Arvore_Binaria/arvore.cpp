#include "arvore.h"
#include <iostream>

using namespace std;

// Atualizar pra ser recurcivo
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

        while (atual != nullptr) // Até encontrar um endereço vazio
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

        if (valor < anterior->valor)
        {
            anterior->Lfilho = novo;
        }
        else
        {
            anterior->Rfilho = novo;
        }
    }
}

bool Arvore::isEmpty() const
{
    return raiz == nullptr;
}

//*& ponteiro por referencia
void Arvore::destruirArvore(No *&raiz)
{
    if (raiz != nullptr)
    {
        destruirArvore(raiz->Lfilho);
        destruirArvore(raiz->Rfilho);
        delete raiz;
        raiz = nullptr; // Importante para evitar dangling pointers
    }
}

// Prints

// OK
void Arvore::printPreOrder(No *raiz)
{
    if (raiz != nullptr)
    {
        cout << raiz->valor << " , ";
        printPreOrder(raiz->Lfilho);
        printPreOrder(raiz->Rfilho);
    }
}

// Errado
void Arvore::printInOrder(No *raiz)
{
    if (raiz != nullptr)
    {
        printPreOrder(raiz->Lfilho);
        cout << raiz->valor << " , ";
        printPreOrder(raiz->Rfilho);
    }
}

// Errado
void Arvore::printPostOrder(No *raiz)
{
    if (raiz != nullptr)
    {
        printPostOrder(raiz->Lfilho);
        printPostOrder(raiz->Rfilho);
        cout << raiz->valor << " , ";
    }
}

// Entendi nada
// https://youtu.be/uum907bCjBw?t=367
void Arvore::deletarNo(No *&tree, int valor)
{
    /*temos 3 casos:
    1. O no é uma folha
    2. O no tem um filho
    3. O no tem dois filhos (buscar pelo sucessor)
    */

    // caso 1 e 2
    No *elemento = encontrarNo(tree, valor);
    No *TempPtr;
    cout << elemento->valor;

    if (elemento->Lfilho == nullptr)
    {
        raiz = raiz->Rfilho;
        delete TempPtr;
    }
    else if (elemento->Rfilho == nullptr)
    {
        raiz = raiz->Lfilho;
        delete TempPtr;
    }
    else
    {
        // caso 3
        TempPtr = elemento->Rfilho;
        cout << "teste:" << TempPtr->valor << endl;       
        cout << "teste:" << endl;       
        // 15
    }

}

No *Arvore::encontrarNo(No *&tree, int valor)
{
    if (tree == nullptr)
    {
        return nullptr; // Caso a árvore esteja vazia ou o nó não seja encontrado
    }

    if (valor > tree->valor)
    {
        return encontrarNo(tree->Rfilho, valor);
    }
    else if (valor < tree->valor)
    {
        return encontrarNo(tree->Lfilho, valor);
    }
    else
    {
        return tree; // Nó encontrado
    }
}
