#include <iostream>
#include "aluno.h"

using namespace std;

Aluno::Aluno()
{
    this->ra = -1;
    this->name = "";
}

Aluno::Aluno(int ra, string name)
{
    this->ra = ra;
    this->name = name;
}

Aluno::~Aluno() {}

int Aluno::getRa() const
{
    return this->ra;
}

string Aluno::getName() const
{
    return this->name;
}