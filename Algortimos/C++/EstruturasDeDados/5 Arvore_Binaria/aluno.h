#include <string>  
using namespace std;

class Aluno
{
private:
    int ra;
    string name;
public:
    Aluno();
    Aluno(int ra, string name);
    ~Aluno();

    int getRa() const;

    string getName() const;
};

