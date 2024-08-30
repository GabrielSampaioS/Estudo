#include <iostream> 
#include  "aluno.h"

using namespace std;

Aluno::Aluno(){
    this->ra = -1;
    this->nome = "";
}

Aluno::Aluno(int ra, std::string nome){
    this->ra = ra;
    this->nome = nome;
}

Aluno::getRa const{
    return ra;
}

Aluno::getName const{
    return nome;
}