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

    string getName() const;
    int getRa() const;
};