	/*Function para Num Aleatorio*/
create function NumeroAleatorio (@MenorValor int, @MaiorValor int) Returns int
as
begin
declare @Aleatorio Float
select @Aleatorio = value from VW_Aleatorio
set @Aleatorio = Round(((@MaiorValor - @MenorValor - 1) * @Aleatorio + @MenorValor), 0)
Return @Aleatorio
end

select [dbo].[NumeroAleatorio](100, 1000)


	/*---------Funcion---------*/
Create Function EntidadeAleatoria (@Tipo varchar(12)) returns varchar(20)
as 
begin
--Declare e atribuir valores para a tabela temporaria
declare @EntidadeAleatoria varchar(12)
declare @CopiaTabela Table (Codigo varchar(20))

if @Tipo = 'Cliente'
begin
	insert into @CopiaTabela (Codigo) select [CPF] as Codigo from [TABELA DE CLIENTES]
end
if @Tipo = 'Vendedor'
begin
	insert into @CopiaTabela (Codigo) select [MATRICULA] as Codigo from [TABELA DE VENDEDORES]
end
if @Tipo = 'Produto'
begin
	insert into @CopiaTabela (Codigo) select [CODIGO DO PRODUTO] as Codigo from [TABELA DE PRODUTOS]
end

--Declare e set do menor e valor maximo utilizando tabela temporaria
declare @NumeroMin int
set @NumeroMin = 1
declare @NumeroMax int
select @NumeroMax = Count(*) from @CopiaTabela

declare @NumAleatorio int
select @NumAleatorio = [dbo].[NumeroAleatorio](0,@NumeroMax)

-- cursor para selecionar o dado referente ao NumAleatorio
declare @Controle int
set @Controle = 1

declare cursor1 cursor for 
	select Codigo from @CopiaTabela
open cursor1

fetch next from cursor1 into @EntidadeAleatoria
while @Controle < @NumAleatorio
begin
	fetch next from cursor1 into @EntidadeAleatoria
	set @Controle = @Controle + 1
end
close cursor1
deallocate cursor1

return @EntidadeAleatoria
end /*END Function*/

select [dbo].[EntidadeAleatoria] ('Vendedor')
select [dbo].[EntidadeAleatoria] ('Cliente')
select [dbo].[EntidadeAleatoria] ('Produto')

	/*-------------------------------------------------------------------------*/

declare @ControleProduto Table (Produto varchar(20))
declare @FlagControleProduto int

declare @Produto varchar(12)
declare @Quantidade int
declare @Preco int

declare @cliente varchar(12)
select @cliente = [dbo].[EntidadeAleatoria] ('Cliente')
declare @vendedor varchar(12)
select @vendedor = [dbo].[EntidadeAleatoria] ('Vendedor')

declare @Data date
set @Data  = '20230517'

declare @Numero int
select @Numero = MAX(Numero) + 1 from [NOTAS FISCAIS]

declare @Inposto float
set @Inposto = 0.18

declare @NumItens int
set @NumItens = [dbo].[NumeroAleatorio](2, 10)

declare @Contador int
set @Contador = 1
while @Contador <= @NumItens
begin
	set @Produto = [dbo].[EntidadeAleatoria] ('Produto')
	select @FlagControleProduto = Count(*) from @ControleProduto where Produto = @Produto
	if @FlagControleProduto = 0
	begin
		set @Quantidade = [dbo].[NumeroAleatorio](5, 100)
		select @Preco = [PREÇO DE LISTA] from [TABELA DE PRODUTOS] where [CODIGO DO PRODUTO] = @Produto


		insert into [ITENS NOTAS FISCAIS] (NUMERO,[CODIGO DO PRODUTO], QUANTIDADE, PREÇO)
		values (@Numero, @Produto, @Quantidade, @Preco)

		insert into @ControleProduto (Produto) values (@Produto)

		set @Contador = @Contador + 1

	end

end

select * from [NOTAS FISCAIS]