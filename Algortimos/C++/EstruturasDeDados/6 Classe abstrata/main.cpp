#include <iostream>

using namespace std;

class FormaGeometrica {
    protected:
        int comprimento;
        int altura;

    public:
        FormaGeometrica(int c, int a){
            comprimento = c;
            altura = a;
        }

    //Função virtual pura
    virtual void Area() = 0
}