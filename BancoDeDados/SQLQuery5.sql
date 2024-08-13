use SUCOS_VENDAS

declare @Limite_maximo float, @Limite_Atual float
declare @bairro varchar(20)

set @bairro = 'Água Santa'
set @Limite_maximo = 400000

/* select sum([LIMITE DE CREDITO]) from [dbo].[TABELA DE CLIENTES] where BAIRRO = @bairro */

select @Limite_Atual = sum([LIMITE DE CREDITO]) from [dbo].[TABELA DE CLIENTES] where BAIRRO = @bairro
if @Limite_maximo <= (select sum([LIMITE DE CREDITO]) from [dbo].[TABELA DE CLIENTES] where BAIRRO = @bairro)
begin
	print 'Valor acima do limite'
end
else
begin
	print 'Valor abaixo do limite '
end