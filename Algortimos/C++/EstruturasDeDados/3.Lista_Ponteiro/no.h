#include "item_type.h"

class No
{
private:
    ItemTpe valor;
    No* prox;
public:
    No(int v);
   //~No();

    int getValor() const;

    No* getProx() const;

    void setProx(No* p);

};