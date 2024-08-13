select * from [ITENS NOTAS FISCAIS] where NUMERO = 100

/* Criando uma FUnction */
Create Function FaturamentoNota (@Numero as Int) Returns Float
as
begin
	Declare @Faturamento Float
	select @Faturamento = sum(QUANTIDADE * PRE�O) from [ITENS NOTAS FISCAIS] where NUMERO = @Numero
	Return @Faturamento
end

select Numero, (PRE�O * QUANTIDADE) as 'Faturamento', [dbo].[FaturamentoNota](Numero) as 'Faturamento Fun��o'
from [ITENS NOTAS FISCAIS]

/* Criando a 2 Function */

CREATE FUNCTION NUMERONOTAS (@DATA DATE) RETURNS INT
AS
BEGIN
DECLARE @NUMNOTAS INT
SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
    WHERE DATA = @DATA
RETURN @NUMNOTAS
END

SELECT [dbo].[NUMERONOTAS]('20170202')