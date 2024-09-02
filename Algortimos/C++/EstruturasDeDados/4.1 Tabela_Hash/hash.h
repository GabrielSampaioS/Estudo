// Criando apenas uma estrutura simples com busca, inserção e remoção
#include "aluno.h"

class Hash
{
private:
    int length;
    Aluno *structure; // Ponteiro para um array de objetos Aluno

    int getHash(Aluno aluno); // Função de hash para calcular o índic

public:
    Hash();
    ~Hash();

    bool isFull() const;
    int getlength() const;

    //
    void retriveItem(Aluno &aluno, bool &found);
    void insertItem(Aluno aluno);
    void deleteItem(Aluno);
    void print();
};
