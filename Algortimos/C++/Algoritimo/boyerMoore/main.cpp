#include <iostream>
#include <string>
#include <vector>
#include <cstdlib> // Necessário para usar system("pause")

using namespace std;

// Função hash validada
int funcaoHash(char caracter, int M){
    const int numPrimo = 31;
    long h = 0;
    h = (numPrimo * h + caracter) % M;
    return h;
}

// Função para processar cada caractere da string de busca
void pegarCadaCaracter(string buscaStr, vector<int>& tabelaHash, int tamnhoArray) {
    for (int i = 0; i < buscaStr.length(); i++) {
        char caracter = buscaStr[i];
        cout << "Caracter: " << caracter << endl;

        int indice = funcaoHash(caracter, tamnhoArray);
        tabelaHash[indice] = 1; // Marca presença do caractere na tabelaHash
    }
}

int main(){
    string textoBase = "Exemplo de teste com texto";
    string buscaStr = "com";

    int tamnhoArray = 26;

    vector<int> tabelaHash(tamnhoArray);
    
    // Inicia todos os valores como -1
    for (int i = 0; i < tamnhoArray; i++){
        tabelaHash[i] = -1;
    } 

    // Chaves para armazenar
    char chaves[26] = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
        'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
        'u', 'v', 'w', 'x', 'y', 'z'
    };

    // Imprime o estado inicial da tabela
    for(int i = 0; i < tamnhoArray; i++){
        int indice = funcaoHash(chaves[i], tamnhoArray);
        cout << "chave: " << chaves[i] << " | indice: " << indice << " | valor: " << tabelaHash[i] << endl;
    }

    // Processa cada caractere da string de busca
    pegarCadaCaracter(textoBase, tabelaHash, tamnhoArray);

    // Imprime o estado final da tabela após processar buscaStr
    cout << "\nTabela Hash apos processar a string de busca:\n";
    for(int i = 0; i < tamnhoArray; i++){
        int indice = funcaoHash(chaves[i], tamnhoArray);
        cout << "chave: " << chaves[i] << " | indice: " << indice << " | valor: " << tabelaHash[indice] << endl;
    }

    system("pause");
    return 0;
}
