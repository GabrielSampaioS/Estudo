#ifndef Hospedeiro_H_Included
#define Hospedeiro_H_Included
#include <iostream>


class Hospedeiro {
    
    
public:
    Hospedeiro();
    void Mostar();
    int Estado = 0; //1 Suscetivel, 2 Infectado, 3 Recuperada, 4 Morto
private:

};

Hospedeiro::Hospedeiro(){
    Estado = 1;
}

void Hospedeiro::Mostar(){
    std::cout << Estado;
}

#endif 