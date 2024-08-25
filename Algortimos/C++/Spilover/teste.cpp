#include <iostream>
#include <vector>
#include <random>

using namespace std;

// Enumeração dos possíveis estados dos indivíduos na simulação
enum class State {
    Suscetivel,
    Infectado,
    Recuperado,
    Imune,
    Morto

};

// Classe que representa um indivíduo na simulação
class Individual {
private:
    State state; // Estado do indivíduo

public:
    Individual() : state(State::Suscetivel) {}

    // Método para definir o estado do indivíduo
    void setState(State newState) {
        state = newState;
    }

    // Método para obter o estado do indivíduo
    State getState() const {
        return state;
    }
};

class Virus {
private:
    float VirulenciaReservatório; //quão venenoso
    float infectividadeReservatório ; //quão facil de passar 

    float VirulenciaHumanos; //quão venenoso
    float infectividadeHumanos ; //quão facil de passar 

public:
    

};

// Função para gerar um número aleatório de acordo com uma distribuição uniforme
double getRandomNumber() {
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> dis(0.0, 1.0);
    return dis(gen);
}

// Função para realizar a simulação da propagação do vírus
void simulateVirusSpread(vector<Individual>& population, double infectionRate, double recoveryRate, int numSteps) {
    for (int i = 0; i < numSteps; i++) {
        // Iterar sobre a população
        for (auto& individual : population) {
            // Verificar o estado atual do indivíduo
            switch (individual.getState()) {
                case State::Suscetivel:
                    // Verificar se o indivíduo será infectado
                    if (getRandomNumber() < infectionRate) {
                        individual.setState(State::Infectado);
                    }
                    break;
                case State::Infectado:
                    // Verificar se o indivíduo irá se recuperar
                    if (getRandomNumber() < recoveryRate) {
                        individual.setState(State::Recuperado);
                    }
                    break;
                default:
                    break;
            }
        }
    }
}

int main() {
    int populationSize = 1000;   // Tamanho da população
    double infectionRate = 20.543; // Taxa de infecção
    double recoveryRate = 25.5;   // Taxa de recuperação
    int numSteps = 1000;           // Número de passos da simulação

    // Criar a população inicial
    vector<Individual> population(populationSize);

    // Realizar a simulação da propagação do vírus
    simulateVirusSpread(population, infectionRate, recoveryRate, numSteps);

    // Exibir o estado final da população
    int numSuscetivel = 0;
    int numInfectado = 0;
    int numRecuperado = 0;

    for (const auto& individual : population) {
        switch (individual.getState()) {
            case State::Suscetivel:
                numSuscetivel++;
                break;
            case State::Infectado:
                numInfectado++;
                break;
            case State::Recuperado:
                numRecuperado++;
                break;
        }
    }

    cout << "Estado final da população:" << endl;
    cout << "Susceptíveis: " << numSuscetivel << endl;
    cout << "Infectados: " << numInfectado << endl;
    cout << "Recuperados: " << numRecuperado << endl;

    cin >> numRecuperado;
    return 0;
}
