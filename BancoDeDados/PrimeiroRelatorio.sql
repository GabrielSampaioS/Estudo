/*1 Pegando apenas CPF(NF) e Valor Total(INF)*/
select NF.CPF, SUM(INF.QUANTIDADE) as 'Quantidade Total' 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
group by NF.CPF

/*2 Apenas adicionamos o nome(TC)*/
select TC.NOME, NF.CPF, SUM(INF.QUANTIDADE) as 'Quantidade Total' 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF

/*3 Pegamos a data(NF) e formatando ela para o formato 120 */
select TC.NOME, NF.CPF, CONVERT(varchar, NF.DATA, 120) as 'Data', SUM(INF.QUANTIDADE) as 'Quantidade Total' 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF, NF.DATA
order by Nf.DATA

/*4 SUBSTRING de 1 a 7 será o ANO e o Mês do campo Data 
   Neste momento, veremos apenas o Ano e o Mês agora
   Mas ainda não esta agrupando, pois falta adicionar a data no group by de forma correta*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_Mês', SUM(INF.QUANTIDADE) as 'Quantidade Total' 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF, NF.DATA
order by Nf.DATA

/*5 Como há função na data, devemos informar esta função no group by
   com isso, também vamos ter que alterar i order by*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_Mês', SUM(INF.QUANTIDADE) as 'Quantidade Total' from 
[NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF,  SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7)
order by Ano_Mês, TC.NOME

/*6 Vamos puxar agora da tabela TC a informação de quantidade maxima de comprar por mes
   E com isso criar um bloco CASE para validar os dados*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_Mês',
TC.[VOLUME DE COMPRA] as 'Quantidade Maxima', SUM(INF.QUANTIDADE) as 'Quantidade Total no Mês', 
case
	when SUM(INF.QUANTIDADE) > TC.[VOLUME DE COMPRA] then 'Venda Válida'
	else 'Venda Inválida'
end as 'Resultado do Mês'
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7), TC.[VOLUME DE COMPRA]
order by Ano_Mês, TC.NOME

/*7 Vamos alterar um ppouco as coisas, Complemente este relatório, listando somente os que tiveram vendas
    inválidas e calculando a diferença entre o limite de venda máximo e o realizado, em percentuais.*/
select Informacoes.NOME, Informacoes.CPF, Informacoes.Ano_Mês, Informacoes.[VOLUME DE COMPRA],
       Informacoes.QuantidadeComprada, (Informacoes.QuantidadeComprada - Informacoes.[VOLUME DE COMPRA]) as 'Valor Utrapassado',
	   ROUND(((Informacoes.QuantidadeComprada/Informacoes.[VOLUME DE COMPRA] - 1) * 100), 2) as 'Porcentagem Utrapassada'
from 
	(select TC.NOME, NF.CPF, SUM(INF.QUANTIDADE) as 'QuantidadeComprada', SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_Mês', TC.[VOLUME DE COMPRA]
	FROM [NOTAS FISCAIS] NF
	inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
	inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
	group by TC.Nome, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7), TC.[LIMITE DE CREDITO], TC.[VOLUME DE COMPRA]
	) Informacoes
where Informacoes.QuantidadeComprada > Informacoes.[VOLUME DE COMPRA]
order by Informacoes.Ano_Mês, Informacoes.NOME

