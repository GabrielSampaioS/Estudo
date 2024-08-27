#include "fila.h"
#include <iostream>

using namespace std;

Fila::Fila(){
    front = 0;
    back = 0;
    structure = new ItemType[MAX_ITENS];
}

Fila::~Fila(){
    delete [] structure;
}

bool Fila::isEmpty() const{
    return (front == back);
}

bool Fila::isFull() const{
    return (back - front == MAX_ITENS);
}

void Fila::enqueue(ItemType item){
    if(!isFull()){
        structure[back % MAX_ITENS] = item;
        back++;
    }else{
        throw "Fila cheia";
    }
}

//ItemType é o tipo de retorno.
ItemType Fila::dequeue(){
    if(!isEmpty()){
        front++;
        return structure[(front-1) % MAX_ITENS];
    }else{
        throw "Fila vazia";
    }
}

void Fila::print() const{
    cout << "Fila: ";
    for(int i = front; i < back; i++){
        cout << structure[i % MAX_ITENS];
    }
    cout << endl;
}

