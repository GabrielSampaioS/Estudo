/* Declaramos uma vari�vel e atribuimos um valor valido para ela */
declare @cpf varchar(12)
set @cpf = '1471156710'

/* Declaramos mais 2 vari�veis, mas esta n�o utilizamos o set
   atribuimos o valor utilizando o proprio select */
declare @nome varchar(200)
declare @data date
select @nome = nome, @data = [DATA DE NASCIMENTO] from [TABELA DE CLIENTES] where cpf = @cpf

/* Declaramos e utilizamos o set para atribui o valor
   mas a tribui��o utiliza algumas fun��es e a variavel @data
   declarada anteriomente para calcular a idade atual */
declare @idade int
set @idade = DATEDIFF(YEAR, @data, GETDATE())
print @idade

/* Apenas damos um select utilizando como par�metro no where uma vari�vel criada */
select nome, cpf from [TABELA DE CLIENTES]
where CPF = @cpf

