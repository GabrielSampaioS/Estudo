
#include <iostream>

#include "time.h"

using namespace  std;

int main() {
    Time t1(23, 5, 0);  // Cria um objeto Time com hora 23:58:00

    t1.print();          // Exibe o horário inicial

    t1.setHour(2);       // Altera a hora para 2

    t1.print();          // Exibe o horário atualizado
    
    system("pause");

    return 0;
}
