#include <iostream>

using namespace std;

int fatRec(int num){
    if(num == 1){
        return 1;
    }else{   
        return (num * fatorial(num - 1));
    }
}

int fatInteracao(int num){
    int res;
    for (i = 0; i < num;i++)
    {
        res = i * (i - 1);
    }

    return num;
}

int main(){
    int numero;
    cout << "Digite um numero: ";
    cin >> numero;

    cout << "Resultado fatorialRec e: " << fatorial(numero);
    cout << "Resultado fatorialInteracao e: " << fatInteracao(numero);

    cin>> numero;
}

