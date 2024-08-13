Create Procedure CalculaIdade
as
begin
	update [TABELA DE CLIENTES]
	set IDADE = Datediff(year, [DATA DE NASCIMENTO], GetDate())
end

EXEC CalculaIdade

select NOME, [DATA DE NASCIMENTO], IDADE from [TABELA DE CLIENTES]

/* Temos 3 tipos de embalagem, Imagine que, pela legislação, o imposto pago depende do tipo de 
   embalagem do produto e, a cada momento, ele muda.Vamos montar uma SP que tenha como parametro
   mês, ano, alíquota e Tipo de embalagem. */

/* Aqui simplistente ligamos as tabelas que precisamos para ter todas as informações */
select NF.NUMERO, NF.DATA, NF.IMPOSTO, TP.EMBALAGEM 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE PRODUTOS] TP on INF.[CODIGO DO PRODUTO] = TP.[CODIGO DO PRODUTO]

/* Para facilitar a visualização vamos realizar um select de apenas 1 dia
   Para ver se o comando de update esta funcionando */

Select NF.DATA, NF.MATRICULA, NF.IMPOSTO, TP.EMBALAGEM 
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE PRODUTOS] TP on INF.[CODIGO DO PRODUTO] = TP.[CODIGO DO PRODUTO]
Where Month(NF.DATA) = 1 and Year(NF.DATA) = 2015 and TP.EMBALAGEM = 'Garrafa' 
order by TP.EMBALAGEM 

/* Comando Update funcionando */

Update [NOTAS FISCAIS]
set IMPOSTO = 0.1 * 10
from [NOTAS FISCAIS] NF
inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
inner join [TABELA DE PRODUTOS] TP on INF.[CODIGO DO PRODUTO] = TP.[CODIGO DO PRODUTO]
Where Month(NF.DATA) = 1 and Year(NF.DATA) = 2015 and TP.EMBALAGEM = 'PET' 

/*Criar a SP utilizando o update acima*/

Create Procedure AtualizarImposto (@mes as int, @ano as int, @embalagem as varchar(10), @imposto as float)
as
begin
	Update [NOTAS FISCAIS]
	set IMPOSTO = @imposto
	from [NOTAS FISCAIS] NF
	inner join [ITENS NOTAS FISCAIS] INF on NF.NUMERO = INF.NUMERO
	inner join [TABELA DE PRODUTOS] TP on INF.[CODIGO DO PRODUTO] = TP.[CODIGO DO PRODUTO]
	Where MONTH(NF.DATA) = @mes and Year(NF.DATA) = @ano and TP.EMBALAGEM = @embalagem
end

exec AtualizarImposto 01,2015,'Pet', 0.1

exec AtualizarImposto, 2015,'Garrafa', 0.9