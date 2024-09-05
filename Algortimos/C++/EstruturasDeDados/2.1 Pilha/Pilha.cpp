#include "Pilha.h"
#include <iostream>

using namespace  std;

Pilha::Pilha(){
    structure = new ItemType[MAX_ITENS];
    pont = 0;
}

Pilha::~Pilha(){
    delete [] structure;
}

bool Pilha::isEmpty() const{
    return (pont == 0);
}

bool Pilha::isFull() const{
    return (pont == MAX_ITENS);
}

void Pilha::enqueue(ItemType item){
    if(!isFull()){
        structure[pont] = item;
        pont++;
    }else{
        throw "Pilha cheia";
    }
}

ItemType Pilha::dequeue(){
    if(!isEmpty()){
        return structure[pont];
        pont--;
    }else{
        throw "ìlha vazia";
    }
}

void Pilha::print() const{
    cout << "Pilha: ";
    for(int i = 0; i <= pont; i++){
        cout << structure[pont - i];
    }
    cout << endl;
}