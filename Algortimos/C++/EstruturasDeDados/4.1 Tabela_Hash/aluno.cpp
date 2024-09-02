#include <iostream>
#include "aluno.h"

using namespace std;

Aluno::Aluno()
{
    this->ra = -1;
    this->nome = "Vazio";
}

Aluno::Aluno(int ra, string nome)
{
    this->ra = ra;
    this->nome = nome;
}

Aluno::~Aluno()
{
    // Não há necessidade de desalocar manualmente
    // delete Aluno;  // Isso causaria erro
}

int Aluno::getRa() const
{
    return ra;
}

string Aluno::getName() const
{   
    return  this->nome;
}