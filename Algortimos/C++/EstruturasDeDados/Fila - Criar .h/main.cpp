#include "fila.h"
#include <iostream>
#include <cstdlib> // Necessário para usar system("pause")

using namespace std;

int main(){
    char caracter;
    Fila Fila;
    char queueChar;

    cout << "Entre com ums string:" << endl;
    cin.get(caracter);

    while (caracter != '\n' and !Fila.isFull())
    {
        Fila.enqueue(caracter);
        cin.get(caracter);
    }

    while(!Fila.isEmpty()){
        queueChar = Fila.dequeue();
        cout << queueChar;
    }
    cout << endl;
    
    system("pause");
}