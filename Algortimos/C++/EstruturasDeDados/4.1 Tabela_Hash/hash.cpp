#include <iostream>
#include "hash.h"

using namespace std;

Hash::Hash(int max){
    lenght = 0;
    maz_items = max;
    structure = new Aluno[max_items]
}

Hash::~Hash(){
    delete [] structure;
}

bool Hash::isFull() const{
    return (length == max_items);
}

int Hash::getlength() const{
    return length;
}

void Hash::print(){
    for (int i = 0; i < max_items; i++){
        structure[i].getRa(),", " <<
        structure[i].getNome() << endl;
    }
}


//Aluno possui RA, exemplo Ra = 278
// 278 % 100 = 78
int Hash::getHash(Aluno aluno){
    return aluno.getRa() % max_items;
}