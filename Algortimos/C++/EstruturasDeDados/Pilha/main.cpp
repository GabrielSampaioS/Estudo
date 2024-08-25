#include "Pilha.h"
#include <iostream>
#include <cstdlib> // Necessário para usar system("pause")

using namespace std;

int main(){
    Pilha Pilha;
    char caracter;
    char queueChar;

    cout << "Entre com uma string: " << endl;
    cin.get(caracter);

    while (caracter != '\n'){
        Pilha.enqueue(caracter);
        cin.get(caracter);
    }

    Pilha.print();
    system("pause");

};