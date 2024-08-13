create Table PreparoReagente (
Codigo
DataPreparo
DataValidade
Segmento
Setor
Amazenamento
LocalAmazenamento
Diluente 
Identificacao
)

create Table PreparoReagente(
CodigoPreparoReagente FK
CodigoPadraoAnalitico PK
QuantidadeUtilizada
unidade 
)


select * from ReagentesPreparado
select * from RelacaoPadraoAnaliticoEPreparo

select CodigoChavePadrao, CodigoPadrao, Ativo.NomeComum as 'Ativo', Lote, RelacaoPadraoAnaliticoEPreparo.QuantidadeUtilizada, RelacaoPadraoAnaliticoEPreparo.unidadeMedida
from PadraoAnalitico
inner join Ativo on Ativo.CodigoAtivo = PadraoAnalitico.CodigoAtivo
inner join RelacaoPadraoAnaliticoEPreparo on RelacaoPadraoAnaliticoEPreparo.CodigoPadraoAnalitico = PadraoAnalitico.CodigoAtivo



