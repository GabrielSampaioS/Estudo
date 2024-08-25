#include "item_type.h"

const int MAX_ITENS = 100;

class Fila{
    private:
        int front;
        int back;
        ItemType* structure;

    public:
        Fila(); //Constructor
        ~Fila(); //Destrutor

        bool isEmpty() const;
        bool isFull() const;
        void print() const;

        void enqueue(ItemType);      
        ItemType dequeue();  
};
