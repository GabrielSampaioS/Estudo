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
        printInOrder(raiz->Lfilho);
        cout << raiz->valor << " , ";
        printInOrder(raiz->Rfilho);
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

void Arvore::deletarNo(No *&tree, int valor)
{
    if (tree == nullptr)
        return; // Árvore vazia ou nó não encontrado

    if (valor < tree->valor)
    {
        deletarNo(tree->Lfilho, valor); // Buscar na subárvore esquerda
    }
    else if (valor > tree->valor)
    {
        deletarNo(tree->Rfilho, valor); // Buscar na subárvore direita
    }
    else
    {
        // Caso 1: O nó é uma folha
        if (tree->Lfilho == nullptr && tree->Rfilho == nullptr)
        {
            tree = nullptr;
        }
        // Caso 2: O nó tem um único filho
        else if (tree->Lfilho == nullptr)
        {
            tree = tree->Rfilho;
        }
        else if (tree->Rfilho == nullptr)
        {
            tree = tree->Lfilho;
        }

        // Caso 3: O nó tem dois filhos
        else
        {
            // Encontra o sucessor
            No *TempPtr = nullptr;
            TempPtr = tree->Rfilho;
            while (TempPtr->Lfilho != nullptr)
            {
                TempPtr = TempPtr->Lfilho;
            }
            // Substitui o valor do nó pelo valor do sucessor
            tree->valor = TempPtr->valor;
            // Deleta o sucessor recursivamente
            deletarNo(tree->Rfilho, TempPtr->valor);
        }
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
