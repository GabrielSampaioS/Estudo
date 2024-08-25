#include <iostream>
#include <cstdlib> // Necessário para usar system("pause")
#include <vector>
#include <string>

using namespace std;

int funcaoHash(string s, int M) {
    const int UMPRIMO = 31; // Definição de uma constante primo
    long h = 0;

    // unsigned para valores não negativos
    for (unsigned i = 0; i < s.length(); i++) {
        h = (UMPRIMO * h + s[i]) % M;  
    }
    return h;
}

int main() {
    int M = 100; // Tamanho do espaço de hash
    vector<string> TabelaHash(M); // Vetor para a tabela hash

    // Chaves e valores para armazenar
    string chaves[] = {"apple", "banana", "orange", "grape", "melon", "ll", "ll"};
    string valores[] = {"maca", "banana", "laranja", "uva", "melao", "l1", "l2"};

    int tamanhoArray = sizeof(chaves) / sizeof(chaves[0]); // Calcula o tamanho do array

    // Inserindo valores na tabela hash
    for (int i = 0; i < tamanhoArray; i++) {
        int indice = funcaoHash(chaves[i], M);
        TabelaHash[indice] = valores[i];
        cout << "Armazenando chave '" << chaves[i] << "' no indice " << indice << " | valor: " << valores[i] << endl;
    }

    // Acessando valores na tabela hash
    for (int i = 0; i < tamanhoArray; i++) {
        int indice = funcaoHash(chaves[i], M);
        cout << "Valor na chave '" << chaves[i] << "' e: " << TabelaHash[indice] << endl;
    }

    // Exemplo de acesso direto por índice
    cout << "Acessando por indice (27): " << TabelaHash[27] << endl;
    cout << "Acessando por indice (56): " << TabelaHash[56] << endl;
    cout << "Acessando por indice (55): " << TabelaHash[55] << endl;

    system("pause");

    return 0;
}
