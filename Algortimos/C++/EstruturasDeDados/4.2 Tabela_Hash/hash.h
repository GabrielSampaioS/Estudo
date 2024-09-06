#include "aluno.h"

class Hash
{
private:
    int length;
    Aluno *structure;

    int getHash(Aluno aluno);

public:
    Hash();
    ~Hash();

    bool isFull() const;
    int getlength() const;

    //
    void retriveItem(Aluno &aluno, bool &found);
    void insertItem(Aluno aluno);
    void deleteItem(Aluno aluno);
    void print();
};