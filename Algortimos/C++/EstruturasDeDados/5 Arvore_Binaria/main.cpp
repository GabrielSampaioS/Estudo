#include "arvore.h"
#include <iostream>

using namespace std;

int main()
{
    Arvore arvore;

    arvore.inserir(10);
    arvore.inserir(5);
    arvore.inserir(20);
    arvore.inserir(3);
    arvore.inserir(7);
    arvore.inserir(15);
    arvore.inserir(2);
    arvore.inserir(25);

    cout << "printPre(): ";
    arvore.printPre();
    cout << endl;

    arvore.removerItem(15);

    cout << "printPre(): ";
    arvore.printPre();
    cout << endl;

    system("pause");
    return 0;
}
