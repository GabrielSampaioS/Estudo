#ifndef Virus_H_Included
#define Virus_H_Included

//sarampo período de incubação é de cerca de 2 semanas e o período de latência é aproximadamente 1 semana
class Virus {
    double virulencia;      //Quão letal
    double infectividade;   //
    double TempoVida;       //
    double TempoIncubacao;  //
    double TempoContagio;   //

public:
    Virus(double _virulencia, double _infectividade, double _TempoVida, double _TempoIncubacao, double _TempoContagio){
        virulencia = _virulencia;
        infectividade = _infectividade;
        TempoVida = _TempoVida;
        TempoIncubacao = _TempoIncubacao;
        TempoContagio = _TempoContagio;
    }

};

#endif 