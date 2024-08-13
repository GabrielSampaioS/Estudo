declare @dia date declare @UltimoDia date
declare @QTDNotas int

set @dia = '20170101'
set @UltimoDia = '20170710'

while @dia < @UltimoDia
begin
	select @QTDNotas = count(*) from [NOTAS FISCAIS] where DATA = @dia
	print convert(varchar(10), @Dia) + ' --> ' + convert(varchar(10), @QTDNotas)
	select @dia = DATEADD(day, 1, @dia)
end


/* Vamos fazer um loop mais complicado */

If OBJECT_ID('Tabela de Numeros', 'U')is not null
	drop table [Tabela de Numeros]

Create Table [Tabela de Numeros] ([Numero] int, [Status] bit)

declare @Limite_Minimo int, @Limite_Maximo int, @Contador int
declare @Nota int

set @Limite_Minimo = 98
set @Limite_Maximo = 104
while @Limite_Minimo < @Limite_Maximo
begin
	select @Nota = COUNT(*) from [NOTAS FISCAIS] where NUMERO = @Limite_Minimo
	if @Nota > 0
		insert into [Tabela de Numeros] ([Numero], [Status]) values (@Limite_Minimo, 1)
	else 
		insert into [Tabela de Numeros] ([Numero], [Status]) values (@Limite_Minimo, 0)
	set @Limite_Minimo = @Limite_Minimo + 1
end

select * from [Tabela de Numeros]


/* Vamos utilizar agora uma Funcion para acinionar mais valores a esta tabela 
   1 Vamos criar mais um campo na tabela com Float 
   e apos se for uma nota, vamos chamar a Funcion*/

If OBJECT_ID('Tabela de Numeros', 'U')is not null
	drop table [Tabela de Numeros]

Create Table [Tabela de Numeros] ([Numero] int, [Status] bit, [Faturamento] Float)

declare @Limite_Minimo int, @Limite_Maximo int, @Contador int, @Nota int

set @Limite_Minimo = 98
set @Limite_Maximo = 110
while @Limite_Minimo < @Limite_Maximo
begin
	select @Nota = COUNT(*) from [NOTAS FISCAIS] where NUMERO = @Limite_Minimo
	if @Nota > 0
		insert into [Tabela de Numeros] ([Numero], [Status], [Faturamento]) values (@Limite_Minimo, 1, [dbo].[FaturamentoNota](@Limite_Minimo))
	else 
		insert into [Tabela de Numeros] ([Numero], [Status], [Faturamento]) values (@Limite_Minimo, 0, 0)
	set @Limite_Minimo = @Limite_Minimo + 1
end

select * from [Tabela de Numeros]

