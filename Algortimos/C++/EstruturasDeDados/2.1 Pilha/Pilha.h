#include "item_type.h"

const int MAX_ITENS =100;

class Pilha{
    private:
        ItemType* structure;
        int pont;

    public:
        Pilha();
        ~Pilha();

        bool isEmpty() const;
        bool isFull() const;
        void print() const;

        void enqueue(ItemType);
        ItemType dequeue();
};