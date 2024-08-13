/*Cursor*/

declare @Nome varchar(100)
declare Cursor1 cursor for
		select TOP 4 NOME from [TABELA DE CLIENTES]
open Cursor1
fetch next from Cursor1 into @Nome
while @@FETCH_STATUS = 0
begin
	print @Nome + ' - Fetch Status: ' + Convert(Varchar(30), @@FETCH_STATUS)
	fetch next from Cursor1 into @Nome
end
print 'Fora do While: ' + @Nome + Convert(Varchar(30), @@FETCH_STATUS)
close Cursor1
Deallocate Cursor1 

/*Criando cursor para não usar o SUM*/

declare @CreditoCursor float
declare @CreditoTotal float
set @CreditoTotal = 0

declare cursor1 cursor for
		select [LIMITE DE CREDITO] from [TABELA DE CLIENTES]

open cursor1
fetch next from cursor1 into @CreditoCursor
while @@FETCH_STATUS = 0
begin
	set @CreditoTotal = @CreditoTotal + @CreditoCursor
	fetch next from cursor1 into @CreditoCursor
end
close cursor1
deallocate cursor1

print  @CreditoTotal

/*Cursor com mais do que uma coluna*/

declare @Nome varchar(200)
declare @Endereco varchar(max)

declare cursor1 cursor for
		select Nome, (ESTADO + ' - ' + CIDADE + ' - ' + BAIRRO + ' - ' + CEP) ENDERECO  
		from [TABELA DE CLIENTES]

open cursor1
fetch next from cursor1 into @Nome, @Endereco

while @@FETCH_STATUS = 0
begin
	Print 'Nome: ' + @nome + ' - ' + 'Endereço: ' + @Endereco
	Fetch next from cursor1 into @Nome, @Endereco
end


/**/
declare @quantidade int
declare @preco float
declare @faturamento float
set @faturamento = 0

declare cursor1 cursor for
	SELECT INF.QUANTIDADE, INF.PREÇO FROM [ITENS NOTAS FISCAIS] INF
	INNER JOIN [NOTAS FISCAIS] NF ON NF.NUMERO = INF.NUMERO
	WHERE MONTH(NF.DATA) = 1 AND YEAR(NF.DATA) = 2017 

open cursor1 

fetch next from cursor1 into @quantidade, @preco
while @@FETCH_STATUS = 0
begin
	set @faturamento = @faturamento + (@quantidade * @preco)
	fetch next from cursor1 into @quantidade, @preco
end
close cursor1
deallocate  cursor1
print @faturamento

/**/


