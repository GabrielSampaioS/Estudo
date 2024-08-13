use SUCOS_VENDAS


select TC.CPF, TC.NOME, SUM(INF.QUANTIDADE * INF.PREÇO) as faturamento
from [TABELA DE CLIENTES] TC
inner join [NOTAS FISCAIS] NF on TC.CPF = NF.CPF and Year(NF.DATA) = 2016
inner join  [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
group by TC.CPF, TC.NOME

/*---*/

create type ListaClientes as Table (CPF varchar(12) not null)

declare @lista as ListaClientes
insert into @lista (CPF) values ('94387575700'), ('5648641702'), ('492472718')

/*---*/

select TC.CPF, TC.NOME, SUM(INF.QUANTIDADE * INF.PREÇO) as faturamento
from [TABELA DE CLIENTES] TC
inner join [NOTAS FISCAIS] NF on TC.CPF = NF.CPF and Year(NF.DATA) = 2016
inner join  [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join @lista Lista on TC.CPF = Lista.CPF
group by TC.CPF, TC.NOME

/*Criar procedure*/

Create Procedure FaturamentoClinete @ano as int, @Lista as ListaClientes readonly
as
begin
	select TC.CPF, TC.NOME, SUM(INF.QUANTIDADE * INF.PREÇO) as faturamento
	from [TABELA DE CLIENTES] TC
	inner join [NOTAS FISCAIS] NF on TC.CPF = NF.CPF and Year(NF.DATA) = Year(@ano)
	inner join  [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
	inner join @lista Lista on TC.CPF = Lista.CPF
	group by TC.CPF, TC.NOME
end

/**/
declare @lista as ListaClientes
insert into @lista (CPF) values ('94387575700'), ('5648641702'), ('492472718')
exec FaturamentoClinete  @lista