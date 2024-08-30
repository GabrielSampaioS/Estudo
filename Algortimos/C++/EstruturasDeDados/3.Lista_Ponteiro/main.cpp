#include <iostream>
#include "lista.h"
#include <cstdlib> // Necessário para usar system("pause")

using namespace std;

int main()
{

    lista l;

    if (l.vazia())
    {
        cout << "Lista vazia!!\n";
    }
    else
    {
        cout << "Lista NAO vazia!!\n";
    }

    l.mostrar();

    l.setcauda(1);
    l.setcauda(2);
    l.setcauda(3);
    l.setcauda(4);
    l.setcauda(5);

    l.mostrar();


    if (l.tamanho() == 0)
    {
        cout << "Lista vazia";
    }
    else
    {
        cout << "lista contem " << l.tamanho() << " elemento(s)";
    }

    system("pause");
    return 0;
}