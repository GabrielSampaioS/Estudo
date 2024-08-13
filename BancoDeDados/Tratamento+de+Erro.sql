CREATE PROCEDURE TrataErroZero 
	@CPF VARCHAR(12), @ANO INT, @DENOMINADOR INT, 
	@NUMERRO INT OUTPUT, @NUMLINHA INT OUTPUT
AS
BEGIN
  SELECT SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
  SUM(INF.QUANTIDADE * INF.[PREÇO])/@DENOMINADOR AS COMISSAO
  FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [NOTAS FISCAIS] NF
  ON INF.NUMERO = NF.NUMERO WHERE NF.CPF = @CPF AND YEAR(NF.[DATA]) = @ANO
  SELECT @NUMERRO = @@ERROR, @NUMLINHA = @@ROWCOUNT
END

DECLARE @DENOMINADOR INT
DECLARE @CPF VARCHAR(12)
DECLARE @ANO INT
DECLARE @NUMERRO INT
DECLARE @NUMLINHA INT
SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0
 EXEC TrataErroZero @CPF = @CPF, @ANO = @ANO, @DENOMINADOR = @DENOMINADOR, 
					@NUMERRO = @NUMERRO OUTPUT, @NUMLINHA = @NUMLINHA OUTPUT
IF @NUMERRO <> 0
 PRINT 'Houve um erro: ' + CONVERT(VARCHAR(30), @NUMERRO) + ' - ' + CONVERT(VARCHAR(30), @NUMLINHA)


 /**/

Create Procedure IncluirVendedor
@Matricula as varchar(5), @Nome as varchar(100), @Percentual as float,
@DataAdmissa as date, @Ferias as bit, @Bairro as varchar(50), @NumeroErro as int OUTPUT
as
begin

insert into [TABELA DE VENDEDORES](MATRICULA,NOME,[PERCENTUAL COMISSÃO],[DATA ADMISSÃO],[DE FERIAS], BAIRRO)
values (@Matricula, @Nome, @Percentual, @DataAdmissa, @Ferias, @Bairro)
select @NumeroErro = @@ERROR

end

declare @ERRO int
EXEC IncluirVendedor '00238','Pericles Alves',0.11,'20160821',0,'Santo Amaro', @NumeroErro = @ERRO OUTPUT
if @ERRO <> 0 
Print 'Ocorreu um erro'
if @ERRO = 2627
Print 'Erro por causa da PK, PK informada já existe'


/*Try=Catch*/

CREATE PROCEDURE TrataErroZeroTry 
	@CPF VARCHAR(12), @ANO INT, @DENOMINADOR INT, 
	@Mensagem varchar(50) OutPut
AS
BEGIN
	Begin Try
		SELECT SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
		SUM(INF.QUANTIDADE * INF.[PREÇO])/@DENOMINADOR AS COMISSAO
		FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [NOTAS FISCAIS] NF
		ON INF.NUMERO = NF.NUMERO WHERE NF.CPF = @CPF AND YEAR(NF.[DATA]) = @ANO
	End Try

	Begin Catch
		set @Mensagem = 'Houve um erro, número: ' ++ Convert(varchar(10), @@ERROR)
	End Catch

END

DECLARE @DENOMINADOR INT
DECLARE @CPF VARCHAR(12)
DECLARE @ANO INT
declare @Mensagem VARCHAR(50)
SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0
set @Mensagem = ''
exec TrataErroZeroTry @CPF = @CPF, @ano = @ANO, @DENOMINADOR = @DENOMINADOR, @Mensagem = @Mensagem output
if @Mensagem <> ''
	print @Mensagem