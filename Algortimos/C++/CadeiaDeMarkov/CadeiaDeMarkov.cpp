#include <iostream>
#include <vector>
#include <iomanip>

using namespace std;


int contarPalavras(const std::string& Frase){
    //Atualizar para reconhecer caracteres como "," "." etc
    int contador = 0;
    bool dentroPalavra = false;

    for(char c : Frase){
        if ((c == ' ' || c == '\t' || c == '\n')) {
            dentroPalavra = false;
        } else if (!dentroPalavra){
            dentroPalavra = true;
            contador ++;
        }

    }
    return contador;
}

int markovTexto(){
    //Tentar retornar os valores de cada palavra
    string texto = "Amanha o sol vai brilhar dutante o dia todo porem nao iremos sair";
    int QTDPalavra = contarPalavras(texto);
    int x [QTDPalavra][QTDPalavra];
}

void DadoBruto(const std::vector<std::vector<int>>& lista){
    cout << " -- Mostrar dados Bruto --" << endl;
    for(int i = 0; i < 10; i++){  
        cout << i << " :    ";
        for(int i2 = 0; i2 < 10; i2++){
            if (lista[i][i2] < 10)
                cout << lista[i][i2] << "  |";
            else
                cout << lista[i][i2] << " |";
        }
        cout << endl;
    }

}

vector <int> ListaNumero(){
    //100 algarimos de PI
    std::vector <int> sequencia = {
    3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5,0,2,8,8,4,1,
    9,7,1,6,9,3,9,9,3,7,5,1,0,5,8,2,0,9,7,4,9,4,4,5,9,2,3,0,7,8,1,6,4,0,6,2,8,6,
    2,0,8,9,9,8,6,2,8,0,3,4,8,2,5,3,4,2,1,1,7,0,6,7,9,8,2,1,4,8,0,8,6,5,1,3,2,8
    };
    return sequencia;
}

void PorcentagemRelativa(const std::vector<std::vector<int>>& lista){
    cout << " -- Porcentagem Relativa --" << endl;
        for(int i = 0; i < 10; i++){
            cout << i << " :    ";
            int total = 0;
            for(int i2 = 0; i2 < 10; i2++){
                total += lista[i][i2];
            }
            for (int i2 = 0; i2 < 10; i2++) {
            double percent = lista[i][i2] * 100.0 / total;
            if (percent < 10)
                std::cout << " " << std::setprecision(2) << std::fixed << percent << "  |";
            else
                std::cout << " " << std::setprecision(2) << std::fixed << percent << " |";
        }
        cout << endl;
        }
}


int main(){
// transição entre estados.
// Cadeia irredutível
    std::vector <int> sequencia = ListaNumero();
    std::vector<std::vector<int>> p(10, std::vector<int>(10, 0));

    int elemento ;
    int nextElemento;
    for(size_t i = 0; i < sequencia.size() - 1; i++){
        elemento = sequencia[i];
        if (i < sequencia.size() - 1) {
            nextElemento = sequencia[i + 1];
            if (elemento >= 0 && elemento < 10 && nextElemento >= 0 && nextElemento < 10) {
                p[elemento][nextElemento] += 1;
            }
        }
    }

    DadoBruto(p);

    PorcentagemRelativa(p);
    
    int fechar;
    cin >> fechar;
    return 0;
}