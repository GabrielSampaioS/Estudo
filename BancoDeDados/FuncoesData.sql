/* SYSDATETIME Retorna a hora do sistema*/
SELECT SYSDATETIME() as 'SYSDATETIME'

/* SYSDATETIMEOFFSET Retorna a hora do sistema informando quantas 
   horas do fuso horário de greenwich*/
SELECT SYSDATETIMEOFFSET() as 'SYSDATETIMEOFFSET'

/* SYSUTCDATETIME Retorna a hora de greenwich, do padrão zero*/
SELECT SYSUTCDATETIME() as 'SYSUTCDATETIME'

/* CURRENT_TIMESTAMP Retorna a hora do sistema com uma precisão menor do que o SYSTEMTIME*/
SELECT CURRENT_TIMESTAMP as 'CURRENT_TIMESTAMP'

/* GETDATE Mesmo retorno do  CURRENT_TIMESTAMP mas aplicações diferentes*/
SELECT GETDATE() as 'GETDATE'

/* GETUTCDATE mesmo retorno de SYSUTCDATETIME*/
SELECT GETUTCDATE() as 'GETUTCDATE'

/* DATENAME(YEAR,GETDATE()) Retorna o ano atual*/
SELECT DATENAME(YEAR,GETDATE()) as 'DATENAME(YEAR,GETDATE())'

/* DATENAME(MICROSECOND,GETDATE()) Retorna o milisegundos atual*/
SELECT DATENAME(MICROSECOND,GETDATE()) as ' DATENAME(MICROSECOND,GETDATE())'

/* DATENAME(MINUTE,GETDATE()) Retorna o minuto atual*/
SELECT DATENAME(MINUTE,GETDATE()) as 'DATENAME(MINUTE,GETDATE())'

/* DATENAME(MONTH,GETDATE()) Retorna o mês atual*/
SELECT DATENAME(MONTH,GETDATE()) as 'DATENAME(MONTH,GETDATE())'

/* DAY(GETDATE()) Retorna o dia atual*/
SELECT DAY(GETDATE()) as 'DAY(GETDATE())'

/* YEAR(GETDATE()) Retorna o ano atual*/
SELECT YEAR(GETDATE()) as 'YEAR(GETDATE())'

/* DATEFROMPARTS Converte o parametro em data*/
SELECT DATEFROMPARTS(2015,9,1) as 'DATEFROMPARTS()'

/* DATENAME(MONTH,DATEFROMPARTS() Após converter o parametro para data, vai retornar o mês da data*/
SELECT DATENAME(MONTH,DATEFROMPARTS(2015,9,1)) as ' DATENAME(MONTH,DATEFROMPARTS())'

/* DATETIME2FROMPARTS COnverte o parametro para data com hora, minutom segundo e milisegundo*/
SELECT DATETIME2FROMPARTS(2015,9,1,13,12,11,120,4) as 'DATETIME2FROMPARTS()'

/*  DATEDIFF(MONTH, DATEFROMPARTS(), GETDATE()) 
	Converte o parâmetro para data com o DATEFROMPARTS()
	Pega a data atual com o GETDATE()
	E calcula a quantidade de mês de diferença entre as duas datas e retorna este valor
*/
SELECT DATEDIFF(MONTH, DATEFROMPARTS(2001,2,9), GETDATE()) as ' DATEDIFF(MONTH, DATEFROMPARTS(), GETDATE())'

/* DATEADD(MONTH, 5, GETDATE()) Pegamos a data atual e somamos mais 5 meses*/
SELECT DATEADD(MONTH, 5, GETDATE()) as ' DATEADD(MONTH,,GETDATE())'

/* ISDATE Valida se o parâmetro pode ser uma data*/
SELECT ISDATE('2018-01-01') as 'ISDATE()'

/* ISDATE Valida se o parâmetro pode ser uma data*/
SELECT ISDATE('2018-25-28') as 'ISDATE()'












SELECT * FROM [NOTAS FISCAIS] 

SELECT [DATA], CONCAT(DATENAME(DAY, [DATA]), ' ', DATENAME(MONTH, [DATA]), ' ', DATENAME(YEAR, [DATA]))
FROM [NOTAS FISCAIS]

select * from [TABELA DE CLIENTES]
select nome, [DATA DE NASCIMENTO], DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE()) as 'Idade Atual' from [TABELA DE CLIENTES]








