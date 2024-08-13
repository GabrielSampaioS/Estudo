#include <iostream>

using namespace std;

// Função para calcular o MDC usando o algoritmo de Euclides NÃO RECURSIVO
int MDC(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a; 
}

// Função para calcular o MDC usando o algoritmo de Euclides RECURSIVO
int MDCRecursivo(int a, int b){
    if(b == 0){ //Condição de Base
        return a;
    }else{
        return MDCRecursivo(b, a % b);
    }
}

int main() {
    int a, b;

    cout << "Entre com o primeiro valor: ";
    cin >> a;
    cout << "Entre com o segundo valor: ";
    cin >> b;

    cout << "MDC (Nao Recursivo): " << MDC(a, b) << endl;
    cout << "MDC Recursivo: " << MDCRecursivo(a, b) << endl;
    system("pause");
    return 0;
}
