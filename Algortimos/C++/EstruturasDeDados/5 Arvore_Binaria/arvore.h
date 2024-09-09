#include "no.h"

class Arvore
{
private:
    No *raiz;

public:
    Arvore() : raiz(nullptr) {};

    ~Arvore() { destruirArvore(raiz); };

    bool isEmpty() const;

    // Validar como ?
    // bool isFull() const;

    void inserir(int valor);

    // RetriveItem precisa atualizaar a structure No para apontar para Aluno ao inves de int valor
    // void retrieveItem();

    // Imprime os valores da árvore em pré-ordem (visita raiz, esquerda, direita)
    void printPre() { printPreOrder(raiz); }

    // Imprime os valores da árvore em ordem (visita esquerda, raiz, direita)
    void printIn() { printInOrder(raiz); }

    // Imprime os valores da árvore em pós-ordem (visita esquerda, direita, raiz)
    void printPost() { printPostOrder(raiz); }

    void removerItem(int valor) { deletarNo(raiz, valor);}

private: // As funções públicas chamam funções privadas recursivas
    void destruirArvore(No *&raiz);

    void printPreOrder(No *raiz);

    void printInOrder(No *raiz);

    void printPostOrder(No *raiz);

    void deletarNo(No *&tree, int valor);

    No *encontrarNo(No *&raiz, int valor);

};
