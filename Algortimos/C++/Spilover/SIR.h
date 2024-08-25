#ifndef SIR_H_Included
#define SIR_H_Included

void EquacaoSIR(const int t, int& s, int& i, int& r, float beta, float gama){
//x1 = dD/dT = - BetaIS/N ]
//      S(t+Δt) = S(t) + (dS/dt) * Δt
//x2 = dI/dT =   BetaIS/N - gamaI
//      I(t+Δt) = I(t) + (dI/dt) * Δt
//x3 = dR/dr =   gamaI
//      R(t+Δt) = R(t) + (dR/dt) * Δt
float x1, x2, x3;
int contador = 1;
while(contador < 100){
    
    x1 = - beta * i * s / t;
    x2 = beta * i * s /t - gama * i;
    x3 = gama * i;

    std::cout << "Tempo: = " << contador << " | " << x1 << " | " << x2 << " | " << x3 << std::endl;
    std::cout << "Tempo: = " << contador << " |  " << s << " |   " << i << " |   " << r << std::endl;
    std::cout << contador << "," << s << "," << i << "," << r << std::endl;

    s += x1;
    i += x2;
    r += x3;
    contador ++;

}
}

//o tempo que o indivíduo leva para se recuperar da infecção
void TaxaRecuperacao(){
    int mu;
    mu = 1;
}


void TaxaContato(int p, int s, int t){
    /*
    p = probabilidade de infeccao para cada contato (indivíduo para indivíduo)
    s = Suscetível
    t = Total da população
    */

    float beta1;
    beta1 = p * s /t; 

}

void RazaoDeInfeccao(float beta1, int i ){
    /*
        beta1 = TaxaContato
        i = Infectados
    */

   int razao;
   razao = beta1 * i;
}

void LeiDaAcaoDaMassas(){

}




#endif 