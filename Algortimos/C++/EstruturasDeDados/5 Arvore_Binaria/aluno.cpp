#include "aluno.h"

Aluno::Aluno(){
    ra = -1;
    name = "";
}

Aluno::Aluno(int ra, string name){
    this->ra = ra;
    this->name = name;
}

int Aluno::getRa() const{
    return ra;
}

string Aluno::getName() const{
    return name;
}
