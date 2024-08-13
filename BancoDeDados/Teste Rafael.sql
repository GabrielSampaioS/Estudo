/*Poder mandar DataInicial e final*/
Create Procedure DadosParaRelatorio @periodo int
as
begin

/*Declarando e set data inical e final*/
declare @DataInicia as Date
declare @DataFinal as date 

	select @DataInicia = Min(DataAtendimento),  @DataFinal = Max(DataAtendimento) from Proposta 
	inner join Cliente on Proposta.IDCliente = Cliente.IDCliente
	inner join (
		select MAX(Versao) as 'Versao', CodigoProposta  from Proposta
		group by CodigoProposta) UltimaVersao
	on  UltimaVersao.CodigoProposta = Proposta.CodigoProposta
	where Proposta.CodigoStatus = 17

/*Criar tabela de retorno*/
declare @TabelaRetorno Table ([Data Inicial] date , [Data Final] date, [Dias Corridos] int, [QTD de Propostas] int, [Valor Total] money)

while @DataInicia <= @DataFinal
begin
	/*insert valoes DataInicial , DataFInal e Periodo*/
	insert into @TabelaRetorno([Data Inicial], [Data Final], [Dias Corridos]) values (@DataInicia, DateAdd(day, @periodo-1, @DataInicia), @periodo)

	/*Select para declarar QTD e Valor*/
	declare @QTD as int
	declare @Valor as money

	select  @Valor = SUM(Valor), @QTD = COUNT(*) from Proposta 
	inner join Cliente on Proposta.IDCliente = Cliente.IDCliente
	inner join (
		select MAX(Versao) as 'Versao', CodigoProposta  from Proposta
		group by CodigoProposta) UltimaVersao
	on  UltimaVersao.CodigoProposta = Proposta.CodigoProposta
	where Proposta.CodigoStatus = 17 and Proposta.DataAtendimento >= @DataInicia and Proposta.DataAtendimento <= DateAdd(Day, @periodo, @DataInicia)

	/*Update os Valores*/
	Update @TabelaRetorno
	set [QTD de Propostas] = @QTD, [Valor Total] = @Valor
	Where [Data Inicial] = @DataInicia

	/*Incrementando variavel de controle*/
	set @DataInicia = DateAdd(day, @periodo, @DataInicia)
	set @QTD = 0
	set @Valor = 0

end

select Format([Data Inicial], 'dd/MM/yy') as Inicio, Format([Data Final], 'dd/MM/yy') as Fim, [Dias Corridos], [QTD de Propostas], [Valor Total] from @TabelaRetorno
return
end

exec DadosParaRelatorio 30
