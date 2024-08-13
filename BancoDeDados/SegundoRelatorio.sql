/* Ordernar pot Quantidade de receita por sabor */
select PesquisaBase.SABOR, PesquisaBase.Ano, PesquisaBase.Faturamento,
	   ROUND(((PesquisaBase.Faturamento * 100) / Faturamento.FaturamentoAnual ),2) as 'Participação'
from 
	(select TP.SABOR, Year(NF.DATA) as 'Ano', ROUND(SUM(INF.PREÇO * INF.QUANTIDADE),2) as 'Faturamento'
	from [TABELA DE PRODUTOS] TP
	inner join [ITENS NOTAS FISCAIS] INF on TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
	inner join [NOTAS FISCAIS] NF on INF.NUMERO = NF.NUMERO
	where Year(NF.Data) = 2016
	group by TP.SABOR, YEAR(data)) PesquisaBase
	
inner join 	

	(select Year(NF.Data) as 'Ano', ROUND(SUM(INF.PREÇO * INF.QUANTIDADE),2) as 'FaturamentoAnual'
	from [ITENS NOTAS FISCAIS] INF
	inner join [NOTAS FISCAIS] NF on  INF.NUMERO = NF.NUMERO
	where Year(NF.DATA) = 2016 
	group by Year(NF.Data)) Faturamento 
	
on Faturamento.Ano = PesquisaBase.Ano
order by PesquisaBase.Faturamento DESC

/* Ordernar pot Quantidade de receita por Tamanho  */

declare @ano int
set @ano = 2020
select PesquisaBase.TAMANHO, PesquisaBase.Ano, PesquisaBase.Faturamento,
	   ROUND(((PesquisaBase.Faturamento * 100) / Faturamento.FaturamentoAnual ),2) as 'Participação'
from 
	(select TP.TAMANHO, Year(NF.DATA) as 'Ano', ROUND(SUM(INF.PREÇO * INF.QUANTIDADE),2) as 'Faturamento'
	from [TABELA DE PRODUTOS] TP
	inner join [ITENS NOTAS FISCAIS] INF on TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
	inner join [NOTAS FISCAIS] NF on INF.NUMERO = NF.NUMERO
	where Year(NF.Data) = @ano
	group by TP.TAMANHO, YEAR(data)) PesquisaBase
	
inner join 	

	(select Year(NF.Data) as 'Ano', ROUND(SUM(INF.PREÇO * INF.QUANTIDADE),2) as 'FaturamentoAnual'
	from [ITENS NOTAS FISCAIS] INF
	inner join [NOTAS FISCAIS] NF on  INF.NUMERO = NF.NUMERO
	where Year(NF.DATA) = @ano 
	group by Year(NF.Data)) Faturamento 
	
on Faturamento.Ano = PesquisaBase.Ano
order by PesquisaBase.Faturamento DESC

