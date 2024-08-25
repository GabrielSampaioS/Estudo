#include <iostream>
#include <string>
#include "Virus.h"
#include "Reservatorio.h"
#include "Hospedeiro.h"
#include "SIR.h"

//bool spillover(){}

int main() {

    //Modelo SIR
    int n; // População total
    int s; // Suscetível 
    int i; // Infectada 
    int r; // Recuperada 
    float beta; // taxa de infecção entre as pessoas
    float gama; // taxa de recuperação

    std::cout << "Informe alguns parametros";
    std::cout << "Populacao Suscetível: ";
    std::cin >> s;
    std::cout << "Populacao Infectada: ";
    std::cin >> i;
    std::cout << "Populacao Recuperada: ";
    std::cin >> r;
    std::cout << "taxa de infecção: ";
    std::cin >> beta;
    std::cout << "taxa de recuperação dos indivíduos: ";
    std::cin >> gama;

    n = (s+i+r);
    EquacaoSIR(n,s,i,r,beta,gama);



    //Hospedeiro *av=new Hospedeiro();
    //av->Mostar();






    int a;
    std::cin >> a;
    return 0;
}
