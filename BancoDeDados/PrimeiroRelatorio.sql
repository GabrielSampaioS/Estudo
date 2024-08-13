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

/*4 SUBSTRING de 1 a 7 ser� o ANO e o M�s do campo Data 
   Neste momento, veremos apenas o Ano e o M�s agora
   Mas ainda n�o esta agrupando, pois falta adicionar a data no group by de forma correta*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_M�s', SUM(INF.QUANTIDADE) as 'Quantidade Total' 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF, NF.DATA
order by Nf.DATA

/*5 Como h� fun��o na data, devemos informar esta fun��o no group by
   com isso, tamb�m vamos ter que alterar i order by*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_M�s', SUM(INF.QUANTIDADE) as 'Quantidade Total' from 
[NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF,  SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7)
order by Ano_M�s, TC.NOME

/*6 Vamos puxar agora da tabela TC a informa��o de quantidade maxima de comprar por mes
   E com isso criar um bloco CASE para validar os dados*/
select TC.NOME, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_M�s',
TC.[VOLUME DE COMPRA] as 'Quantidade Maxima', SUM(INF.QUANTIDADE) as 'Quantidade Total no M�s', 
case
	when SUM(INF.QUANTIDADE) > TC.[VOLUME DE COMPRA] then 'Venda V�lida'
	else 'Venda Inv�lida'
end as 'Resultado do M�s'
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
group by TC.Nome, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7), TC.[VOLUME DE COMPRA]
order by Ano_M�s, TC.NOME

/*7 Vamos alterar um ppouco as coisas, Complemente este relat�rio, listando somente os que tiveram vendas
    inv�lidas e calculando a diferen�a entre o limite de venda m�ximo e o realizado, em percentuais.*/
select Informacoes.NOME, Informacoes.CPF, Informacoes.Ano_M�s, Informacoes.[VOLUME DE COMPRA],
       Informacoes.QuantidadeComprada, (Informacoes.QuantidadeComprada - Informacoes.[VOLUME DE COMPRA]) as 'Valor Utrapassado',
	   ROUND(((Informacoes.QuantidadeComprada/Informacoes.[VOLUME DE COMPRA] - 1) * 100), 2) as 'Porcentagem Utrapassada'
from 
	(select TC.NOME, NF.CPF, SUM(INF.QUANTIDADE) as 'QuantidadeComprada', SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7) as 'Ano_M�s', TC.[VOLUME DE COMPRA]
	FROM [NOTAS FISCAIS] NF
	inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
	inner join [TABELA DE CLIENTES] TC on NF.CPF = TC.CPF
	group by TC.Nome, NF.CPF, SUBSTRING(CONVERT(varchar, NF.DATA, 120), 1,7), TC.[LIMITE DE CREDITO], TC.[VOLUME DE COMPRA]
	) Informacoes
where Informacoes.QuantidadeComprada > Informacoes.[VOLUME DE COMPRA]
order by Informacoes.Ano_M�s, Informacoes.NOME

