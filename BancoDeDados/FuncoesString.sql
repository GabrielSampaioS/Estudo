/* LTRIM remove o caractere de espaço do lado esquerdo */
SELECT LTRIM('      OLA') as 'LTRIM'

/* RTRIM remove o caractere de espaço do lado direito */
SELECT RTRIM('OLA      ') as 'RTRIM'

/* CONCAT concatena 2 ou mais strings */
SELECT CONCAT('OLA ','TUDO BEM') as 'CONCAT'
/* Neste caso, o valor 1 é trasnformado em string */
select CONCAT (1,1) as 'CONCAT' 

/* LEFT retorna a string até a posição informada */
SELECT LEFT('Rua Augusto',4)  as 'LEFT'

/* LEFT retorna a string da posição informada até o final */
SELECT RIGHT('Rua Agusto',5)  as 'RIGHT'

/* UPPER retorna a string em caixa alta */
SELECT UPPER('Rua Agusto')    as 'UPPER'
 
/* LOWER retorna a string em caixa baixa */
SELECT LOWER('Rua Agusto')    as 'LOWER'
 
/* REPLACE realiza a alteração na string. 1 parametro pe a string,
   2 é o trecho a ser alterado e 3 é pelo que será alterado*/
SELECT REPLACE('Rua Agusto','Rua.','avenida')  as 'REPLACE'

/* SUBSTRING retorna a string a parti da posição infomada no primeiro parâmetro
   até a posição informa no segundo parâmetro */
SELECT SUBSTRING('RUA AUGUSTA', 1, 3)  as 'SUBSTRING'

/* LEN retorna o tamanho da string */
SELECT LEN('RUA AUGUSTA')  as 'LEN'









