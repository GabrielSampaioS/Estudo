/* LTRIM remove o caractere de espa�o do lado esquerdo */
SELECT LTRIM('      OLA') as 'LTRIM'

/* RTRIM remove o caractere de espa�o do lado direito */
SELECT RTRIM('OLA      ') as 'RTRIM'

/* CONCAT concatena 2 ou mais strings */
SELECT CONCAT('OLA ','TUDO BEM') as 'CONCAT'
/* Neste caso, o valor 1 � trasnformado em string */
select CONCAT (1,1) as 'CONCAT' 

/* LEFT retorna a string at� a posi��o informada */
SELECT LEFT('Rua Augusto',4)  as 'LEFT'

/* LEFT retorna a string da posi��o informada at� o final */
SELECT RIGHT('Rua Agusto',5)  as 'RIGHT'

/* UPPER retorna a string em caixa alta */
SELECT UPPER('Rua Agusto')    as 'UPPER'
 
/* LOWER retorna a string em caixa baixa */
SELECT LOWER('Rua Agusto')    as 'LOWER'
 
/* REPLACE realiza a altera��o na string. 1 parametro pe a string,
   2 � o trecho a ser alterado e 3 � pelo que ser� alterado*/
SELECT REPLACE('Rua Agusto','Rua.','avenida')  as 'REPLACE'

/* SUBSTRING retorna a string a parti da posi��o infomada no primeiro par�metro
   at� a posi��o informa no segundo par�metro */
SELECT SUBSTRING('RUA AUGUSTA', 1, 3)  as 'SUBSTRING'

/* LEN retorna o tamanho da string */
SELECT LEN('RUA AUGUSTA')  as 'LEN'









