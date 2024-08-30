//Criando apenas uma estrutura simples com busca, inserção e remoção

#include "aluno.h"

class Hash
{
private:
    int max_items;
    int length;
    aluno* structure; /*Entender melhor como isso funciona */
    
    int getHash(aluno aluno);

public:
    Hash(int max_items = 100);
    ~Hash();

    bool isFull() const;
    int getlength() const;

    //
    void retriveItem(aluno& aluno, bool& found);
    void insertItem(aluno aluno);
    void deleteItem(aluno);
    void print();

};


