
// Definição da estrutura No
struct No
{
    int valor;
    No *Lfilho;
    No *Rfilho;

    No(int valor) : valor(valor), Lfilho(nullptr), Rfilho(nullptr) {} // construtor
};
