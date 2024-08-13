
CREATE PROCEDURE [dbo].[TrataErroZeroTry2] 
	@CPF VARCHAR(12), @ANO INT, @DENOMINADOR INT, 
	@Mensagem varchar(max) OutPut
AS
BEGIN
	Begin Try
		SELECT SUM(INF.QUANTIDADE * INF.[PREÇO]) AS FATURAMENTO,
		SUM(INF.QUANTIDADE * INF.[PREÇO])/@DENOMINADOR AS COMISSAO
		FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [NOTAS FISCAIS] NF
		ON INF.NUMERO = NF.NUMERO WHERE NF.CPF = @CPF AND YEAR(NF.[DATA]) = @ANO
	End Try

	Begin Catch
		set @Mensagem = 'Houve um erro, número: ' + Convert(Varchar(10), ERROR_NUMBER()) + ' - ' 
		set @Mensagem = @Mensagem + 'Mensagem: ' + ERROR_MESSAGE() + ' - '
		set @Mensagem = @Mensagem + 'Grau de severidade do erro: ' + Convert(Varchar(10), ERROR_SEVERITY()) + ' - '
		set @Mensagem = @Mensagem + 'Estado do erro: ' +  Convert(Varchar(10), ERROR_STATE()) + ' - '
		set @Mensagem = @Mensagem + 'Número da linha: ' + Convert(Varchar(10), ERROR_LINE())  + ' - '
		set @Mensagem = @Mensagem + 'Procedure: ' + ERROR_PROCEDURE()
	End Catch

END

declare @DENOMINADOR int
declare @CPF varchar(12)
declare @ANO int
declare @Mensagem varchar(max)

set @CPF = '1471156710'
set @DENOMINADOR = 0
set @ano = 2016
set @Mensagem = ''
exec TrataErroZeroTry2 @CPF = @CPF, @ANO = @ANO, @DENOMINADOR = @DENOMINADOR, @Mensagem = @Mensagem OUtPut
if @Mensagem <> ''
	print @Mensagem

