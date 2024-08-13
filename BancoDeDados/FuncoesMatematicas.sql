/* CEILING Retornara o Inteiro maior */
SELECT CEILING(12.333223) as 'CEILING'

/* FLOOR Retornara o Inteiro menor*/
SELECT FLOOR(12.333223) as 'FLOOR'

/* RAND Gerar um numero aleatório*/
SELECT RAND() as 'RAND'

/* ROUND Arredonda o numero para a quantidade de casa informada*/
SELECT ROUND(12.33323323, 2) as 'ROUND'

/*------------------------------------------------------*/

select * from [NOTAS FISCAIS]
select * from [TABELA DE PRODUTOS]
SELECT * FROM [ITENS NOTAS FISCAIS]
select * from [TABELA DE CLIENTES]

select TP.[NOME DO PRODUTO], INF.[CODIGO DO PRODUTO], SUM(INF.QUANTIDADE) as 'Quantidade de Venda', floor(sum(QUANTIDADE * IMPOSTO)) as 'Imposto pago do produto'
from [ITENS NOTAS FISCAIS] INF
inner join [NOTAS FISCAIS] NF on INF.NUMERO = NF.NUMERO
inner join [TABELA DE PRODUTOS] TP on INF.[CODIGO DO PRODUTO] = TP.[CODIGO DO PRODUTO]
where year(NF.Data) = 2016
group by TP.[NOME DO PRODUTO], INF.[CODIGO DO PRODUTO] 

/*------------------------------------------------------*/

select TC.CPF, Tc.NOME, Round(SUM(INF.PREÇO * inf.QUANTIDADE), 2) as 'Valor Gasto', year(nf.DATA) as 'Ano'
from [TABELA DE CLIENTES] TC
inner join [NOTAS FISCAIS] NF on TC.CPF = NF.CPF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
Group By TC.CPF, Tc.NOME, year(nf.data)
Order by [Ano], [Valor Gasto] desc

