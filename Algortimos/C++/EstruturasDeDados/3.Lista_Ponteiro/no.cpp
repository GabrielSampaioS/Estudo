#include "no.h"

using namespace std; 

No::No(int v){ //Construtor
    this -> valor = v;
    this -> prox = nullptr;
}

//No::~No(){
  //  delete [] ; //Funciuona :
//}

int No::getValor() const{
    return valor;
    }


No* No:: getProx() const{
    return prox;
}

void No::setProx(No* p){
    prox = p;
}

