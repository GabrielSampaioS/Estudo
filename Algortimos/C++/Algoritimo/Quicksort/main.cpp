#include <iostream>
#include <cstdlib> // Necessário para usar system("pause")
#include <vector>

using namespace std;

vector<int> Quicksort(vector<int> lista) {
    if (lista.size() < 2) { // Caso base
        return lista;
    }

    int pivo = lista[lista.size() / 2];
    vector<int> listaMenor, listaMaior, listaPivo;

    // Separar a lista em menor, maior e igual ao pivô
    for (int i = 0; i < lista.size(); i++) {
        if (lista[i] < pivo) {
            listaMenor.push_back(lista[i]);
        } else if (lista[i] > pivo) {
            listaMaior.push_back(lista[i]);
        } else {
            listaPivo.push_back(lista[i]);
        }
    }

    // Recursão e concatenação de vetores
    vector<int> sortedMenor = Quicksort(listaMenor);
    vector<int> sortedMaior = Quicksort(listaMaior);

    // Juntando tudo: sortedMenor + listaPivo + sortedMaior
    sortedMenor.insert(sortedMenor.end(), listaPivo.begin(), listaPivo.end());
    sortedMenor.insert(sortedMenor.end(), sortedMaior.begin(), sortedMaior.end());

    return sortedMenor;
}

int main() {
    vector<int> lista = {4, 7, 6, 8, 1, 4, 7, 5, 8, 1, 23, 4, 6,54,65,1,87,1,87,1,89,1,4,7,87,0,87,54,87,0,-2,75, 2, 5};

    vector<int> sorted = Quicksort(lista);

    // Exibir resultado
    for (int i = 0; i < sorted.size(); i++) {
        cout << sorted[i] << " ";
    }
    cout << endl;

    system("pause");

    return 0;
}
