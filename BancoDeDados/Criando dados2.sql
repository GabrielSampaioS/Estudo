/*Script para add*/
declare @ControleProduto Table (Produto varchar(20))
declare @FlagControleProduto int
set @FlagControleProduto = 0

declare @Produto varchar(20)
declare @Quantidade int
declare @Preco float

declare @cliente varchar(12)
select @cliente = [dbo].[EntidadeAleatoria] ('Cliente')
declare @vendedor varchar(12)
select @vendedor = [dbo].[EntidadeAleatoria] ('Vendedor')

declare @Data date
set @Data  = '20230518'

declare @Numero int
select @Numero = MAX(Numero) + 1 from [NOTAS FISCAIS]

declare @Inposto float
set @Inposto = 0.18

insert into [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
values (@cliente, @vendedor, @Data, @Numero, '0.1')


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

		set @Contador = @Contador + 1
		insert into @ControleProduto (Produto) values (@Produto)
	end
	

end

/*Criar Procedure*/

Create Procedure CriarNotaFiscal @Data as Date
as
begin
declare @ControleProduto Table (Produto varchar(20))
declare @FlagControleProduto int
set @FlagControleProduto = 0

declare @Produto varchar(20)
declare @Quantidade int
declare @Preco float

declare @cliente varchar(12)
select @cliente = [dbo].[EntidadeAleatoria] ('Cliente')
declare @vendedor varchar(12)
select @vendedor = [dbo].[EntidadeAleatoria] ('Vendedor')

declare @Numero int
select @Numero = MAX(Numero) + 1 from [NOTAS FISCAIS]

declare @Inposto float
set @Inposto = 0.18

insert into [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
values (@cliente, @vendedor, @Data, @Numero, '0.1')


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

		set @Contador = @Contador + 1
		insert into @ControleProduto (Produto) values (@Produto)
	end
	

end
end

/*Criar loop para adicionaar varias NF para varios dias*/

declare @Data date
set @Data = '20200110'

while @Data < '20230518'
begin
	exec CriarNotaFiscal @Data
	set @Data = DAteAdd(DAY, 1, @Data)
end
