#include "no.h"

class Arvore
{
private:
    No *raiz;

public:
    Arvore() : raiz(nullptr){};

    void inserir(int valor);
};
