#include "item_type.h"
#include "no.h"

class lista
{
private:
    No *cabeca;
    No *cauda;

public:
    lista();
    ~lista();

    lista(int v);

    bool vazia() const;

    void setcabeca(int v);

    void setcauda(int v);

    void mostrar() const; // Mosntar todos os elementos

    int tamanho() const;

    bool existe(int v);
};