#include <iostream>

using namespace std;

class No
{
private:
    int valor;
    No* prox;
public:
    No(int v){ //Construtor
        this -> valor = v;
        this -> prox = nullptr;
    }

    int getValor(){
        return valor;
    }

    No* getProx(){
        return prox;
    }

    void setProx(No* p){
        prox = p;
    }

};


class lista
{
private:
    No* cabeca;
    No* cauda;
public:
    lista(){ //Construtor
        cabeca = nullptr;
        cauda = nullptr;
    };

    lista(int v){
        cabeca = new No(v);
        cauda = cabeca;
    }

    virtual ~lista(){
        No* atual = cabeca;

        while(atual){
            No* proximo = atual->getProx();
            delete atual;
            atual = proximo;
        }
    }

    bool vazia(){ //Verificar se lista esta vazia
        return (cabeca == nullptr);
    }

    void setcabeca(int v){
        No* novoNo = new No(v);
        if(vazia()){
            cabeca = novoNo;
            cauda = novoNo;
        }
        else{
            novoNo->setProx(cabeca);
            cabeca = novoNo;
        }
    }

    void setcauda(int v){
        No* novoNo = new No(v);
        if (vazia()){
            cabeca = novoNo;
            cauda = novoNo;
        }
        else{
            cauda->setProx(novoNo);
            cauda = novoNo;
        }
    }
 
    void mostrar(){ //Mosntar todos os elementos
        cout << "\n Mostrar todos os elementos \n";
        No* c = cabeca;

        if(vazia()){
            cout << "A lista NAO possui elementos!!\n";
        }
        else{
            while(c){ //Pecorrer cada elemento
                cout << c->getValor() << endl;
                c = c->getProx();
            }
            cout << endl;
        }  
    } 

    int tamanho(){
        int tam = 0;
        No* c = cabeca;

        while(c){
            c = c->getProx();
            tam ++;
        }
        return tam;
    }
    
    bool existe(int v){
        No* c = cabeca;

        while (c)
        {
            if(c->getValor() == v){
                return true;
            }
            c = c->getProx();
        }
        return false;
    }


};


int main(){

    lista l;

    if (l.vazia()){
        cout << "Lista vazia!!\n";
    }
    else{
        cout << "Lista NAO vazia!!\n";
    }

    l.mostrar();

    l.setcauda(1);
    l.setcauda(2);
    l.setcauda(3);
    l.setcauda(4);
    l.setcauda(5);

    l.mostrar();

    l.setcabeca(6);
    l.setcabeca(7);

    l.mostrar();

    if(l.tamanho() == 0){
        cout <<"Lista vazia";
    }else{
        cout << "lista contem " << l.tamanho() << " elemento(s)";
    }

    system("pause");
    return 0;
}